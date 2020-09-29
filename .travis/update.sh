#!/bin/sh
git config --global filter.lfs.smudge "git-lfs smudge --skip"
timeout 60  git clone --progress --verbose https://${GH_TOKEN}@github.com/akash1808/django-deployment.git
cd django-deployment
timeout 10 git fetch
timeout 10 git checkout master
echo "complete"
timeout 10 git config --global user.email "travis@travis-ci.org"
timeout 10 git config --global user.name "Travis CI"
echo "complete2"
echo $1  > check.txt
echo "complete 3"
sed -i "/django-test/s/.*/        image: asia.gcr.io\/gcp-akash-287109\/django-test:$1-develop/" prod/django.yaml
sed -i "/django-test/s/.*/        image: asia.gcr.io\/gcp-akash-287109\/django-test:$1-develop/" dev/django.yaml
git add prod/django.yaml
git add dev/django.yaml
timeout 10 git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"

timeout 60 git push --quiet --set-upstream origin master 

