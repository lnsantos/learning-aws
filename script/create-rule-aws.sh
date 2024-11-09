#!/usr/bin/env bash

rulename=$1 

if [ -z $rulename ]; then
	echo "Please provide a role name as an argument."
	exit 1
fi


aws iam create-role \
  --role-name $rulename \
  --assume-role-policy-document '{"Version": "2012-10-17","Statement": [{ "Effect": "Allow", "Principal": {"Service": "lambda.amazonaws.com"}, "Action": "sts:AssumeRole"}]}' \
  | grep -o '"Arn": "[^"]*' \
  | grep -o '[^"]*$'\

