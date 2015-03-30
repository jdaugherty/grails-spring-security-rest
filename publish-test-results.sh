#!/usr/bin/env bash

mkdir -p target/divshot/$TRAVIS_JOB_NUMBER
cd target/divshot
divshot -t $DIVSHOT_TOKEN config:add name spring-security-rest
divshot -t $DIVSHOT_TOKEN pull production
rm -rf *
cd ../..
mv target/test-reports target/divshot/$TRAVIS_JOB_NUMBER/core
for app in `ls test/apps` ; do mv test/apps/$app/target/test-reports target/divshot/$TRAVIS_JOB_NUMBER/$app ; done
cd target/divshot
divshot -t $DIVSHOT_TOKEN config:add name spring-security-rest
divshot -t $DIVSHOT_TOKEN push production