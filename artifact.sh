#!/bin/sh

# Getting Parameters

echo "Enter your S3 bucket name :"$1;
echo "Enter your AWS Access Key :"$2;
echo "Enter your AWS Secret Access Key :"$3;

S3_BUCKET_NAME=$1;
AWS_ACCESS_KEY=$2;
AWS_SECRET_ACCESS_KEY=$3;
DIR=.

echo "current directory $DIR";
echo "S3 Bucket name :$S3_BUCKET_NAME";
echo "Access Key :$AWS_ACCESS_KEY";
echo "Secret Access Key :$AWS_SECRET_ACCESS_KEY";
