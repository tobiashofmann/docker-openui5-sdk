#!/bin/bash
for i in $(git tag);
do
  echo $i;
  git checkout $i
  npm install
  grunt build
  mkdir -p /var/www/html/$i/resources
  for f in ./target/*; do echo $f; cp $f/resources/* -R /var/www/html/resources/$i; done
  # clean up src and target
  rm -R ./target/*
  rmdir ./target
done
