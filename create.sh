#!/bin/bash
for i in $(git tag);
do
  echo $i;
  git checkout $i
  npm install
  grunt build
  mkdir -p /var/www/html/$i/resources
#  for f in ./target/*; do echo $f; cp $f/resources/* -Rv /var/www/html/resource
s/; done
  # clean up src and target
#  rm -R ./target/*
#  rmdir ./target
done
