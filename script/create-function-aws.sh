#!/usr/bin/env bash

lambda_name=$1
role=$2	

chmod +x ./create-rule-aws.sh

if [ -z "$role" ]; then
	role=$(../script/create-rule-aws.sh "role_${lambda_name}")
fi	

aws lambda create-function --function-name $lambda_name \
--runtime provided.al2023 --handler bootstrap \
--role $role \
--zip-file fileb://../build/bootstrap.zip
