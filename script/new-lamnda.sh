#!/usr/bin/env bash 

./script/go-executable-build.sh "lambda" ../cmd/lambda/main.go
new_role=$(./script/create-rule-aws.sh "lamda-role-auto")

./script/create-function-aws.sh "lambda" $new_role 

