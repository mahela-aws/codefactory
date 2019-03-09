#!/bin/sh

# Getting Parameters

S3_BUCKET_NAME=$1
AWS_ACCESS_KEY=$2
AWS_SECRET_ACCESS_KEY=$3
DIR=${PWD##*/}
BRANCH=""
FILE_NAME=""

export_env_variables()
{

export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
echo ""
echo "Exporting Credentials"
echo ""
echo "AWS_ACCESS_KEY_ID : $AWS_ACCESS_KEY_ID"
echo "AWS_SECRET_ACCESS_KEY : $AWS_SECRET_ACCESS_KEY"
echo ""
}

get_branch()
{
echo ""
echo "Getting Branch Name"
echo ""
BRANCH=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
echo "$BRANCH"
}


pull_changes()
{
echo ""
echo "Pulling Changes from GIT repository"
echo ""
git pull
echo ""


}


compress_repo()
{

echo "Compressing your GIT repository"
echo ""
FILE_NAME=$DIR-$BRANCH.tar.gz
COMMAND="tar cvzf $FILE_NAME *"
echo "Executing Tar Command : $COMMAND"
$COMMAND 2>/dev/null
echo ""
echo "Compressing Completed"
echo ""
}


upload_to_s3()
{

echo "Uploading your repository to S3 bucket : $S3_BUCKET_NAME "
echo ""
aws s3 cp $FILE_NAME s3://$S3_BUCKET_NAME
echo ""
}


#Function calls

export_env_variables
get_branch
pull_changes
compress_repo
upload_to_s3



#echo "tar command :$TAR_COMMAND";
#echo "current directory :$DIR";
#echo "current git branch :$BRANCH";
#echo "S3 Bucket name :$S3_BUCKET_NAME";
#echo "Access Key :$AWS_ACCESS_KEY";
#echo "Secret Access Key :$AWS_SECRET_ACCESS_KEY";

