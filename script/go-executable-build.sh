#!/usr/bin/env bash

# verify if user stay minimum arguments
if [ "$#" -ne 2 ]; then
	echo "Usage: $0 [OPTION] name file [OPTION] dir main.go"
	exit 1
fi

echo "command executed is $0 \n Name to binary is :$1\n Directorectory reference is: $2\n"

export package=$2

export os="linux"
export arch="amd64"
export out_filename=$1

# verify if user send argument in script
if [[ -z "$package" ]]; then
	echo "argument not found, please send $0 value"
	exit 1
fi

# make build golang binary
env GOOS=$os GOARCH=$arch go build -o $out_filename $package

if [ $? -ne 0 ]; then
   	echo 'An error has occurred! Aborting the script execution...'
	exit 1
fi

# verify is foulder build exist, if not exist then create
if [ -e "build"]; then
	echo "Building directory doesn't exist, its create"
	mkdir build
fi

# create zip file with name send in argument script
zip "build/${out_filename}.zip" $out_filename
echo 'Zip is success'

# remove binary none zip in root foulder
rm -f $out_filename

echo 'Binary file is removed'
echo 'Build successful!'
exit 0






