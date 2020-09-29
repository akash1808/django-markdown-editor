#!/bin/sh
clone_git(){
  git config --global filter.lfs.smudge "git-lfs smudge --skip"
  timeout 60  git clone --progress --verbose https://${GH_TOKEN}@github.com/akash1808/django-deployment.git
  cd django-deployment
  git fetch
  git checkout master
}
setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_files() {
  cat $1 > check.txt
  git add check.txt
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git push --quiet --set-upstream origin master 
}

clone_git
setup_git
commit_files
upload_files
