#!/usr/bin/env bash

fname=$1

if [ -z $fname ]; then
	echo "Error: function name not provided."
	exit 1
fi

# chmod +x ./go-executable-build.sh
# ../script/go-executable-build.sh "bootstrap.zip" "../cmd/lambda/main.go"	

aws lambda update-function-code --function-name $fname --zip-file fileb://build/bootstrap.zip
