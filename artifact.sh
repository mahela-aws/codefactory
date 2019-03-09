#!/bin/sh

# Getting Parameters

S3_BUCKET_NAME=$1
AWS_ACCESS_KEY=$2
AWS_SECRET_ACCESS_KEY=$3
DIR=${PWD##*/}
BRANCH=""



get_branch()
{
echo ""
echo "Getting Branch Name"
echo ""
BRANCH=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
echo "$BRANCH"
}

#get_branch

pull_changes()
{
echo ""
echo "Pulling Changes from GIT repository"
echo ""
git pull
echo ""


}

#pull_changes

compress_repo()
{

echo "Compressing your GIT repository"
echo ""
COMMAND="tar cvzf $DIR-$BRANCH.tar.gz *"
echo "Executing Tar Command : $COMMAND"
$COMMAND 2>/dev/null
echo ""
echo "Compressing Completed"
echo ""
}

#compress_repo

upload_to_s3()
{

echo "S3 upload function not completed"
echo ""
}


#Function calls

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

