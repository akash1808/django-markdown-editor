#!/bin/sh
clone_git(){
  git config --global filter.lfs.smudge "git-lfs smudge --skip"
  timeout 60  git clone --progress --verbose https://${GH_TOKEN}@github.com/akash1808/django-deployment.git
  cd django-deployment
  timeout 10 git fetch
  timeout 10 git checkout master
}
setup_git() {
  timeout 10 git config --global user.email "travis@travis-ci.org"
  timeout 10 git config --global user.name "Travis CI"
}

commit_files() {
  cat $1 > check.txt
  timeout 10 git add check.txt
  timeout 10 git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  timeout 60 git push --quiet --set-upstream origin master 
}

clone_git
setup_git
commit_files
upload_files
