#!/bin/sh

# Getting Parameters

#echo "Enter your S3 bucket name :"$1;
#echo "Enter your AWS Access Key :"$2;
#echo "Enter your AWS Secret Access Key :"$3;

S3_BUCKET_NAME=$1;
AWS_ACCESS_KEY=$2;
AWS_SECRET_ACCESS_KEY=$3;
DIR=${PWD##*/};
BRANCH="";
TAR_COMMAND="tar cvzf '"$DIR"-"$BRANCH".tar.gz' *"


get_branch()
{

echo "Getting Branch Name";
BRANCH=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p');

}

get_branch

pull_changes()
{

echo "Pulling Changes from GIT repository";

git pull;



}

pull_changes

compress_repo()
{

echo "Compressing your GIT repository"
echo "tar command :$TAR_COMMAND";
$TAR_COMMAND 2>/dev/null;
#tar cvzf '$DIR"-"$BRANCH.tar.gz' *

}

compress_repo

upload_to_s3()
{

echo "S3 upload function not completed";

}

echo "tar command :$TAR_COMMAND";
echo "current directory :$DIR";
echo "current git branch :$BRANCH";
echo "S3 Bucket name :$S3_BUCKET_NAME";
echo "Access Key :$AWS_ACCESS_KEY";
echo "Secret Access Key :$AWS_SECRET_ACCESS_KEY";

