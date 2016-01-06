#!/bin/bash
for i in $(git tag -l "1.32.5");
do
  echo $i;
  git checkout $i
  npm install
  grunt build --production
  mkdir -p /var/www/html/$i/resources
  for f in ./target/*; do echo $f; cp $f/resources/* -R /var/www/html/$i/resources/; done
  # clean up src and target
  rm -R ./target/*
  rmdir ./target
done
rm -R *
