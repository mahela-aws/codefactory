#!/bin/sh

# This bash script is created to facilitate local  git repository uploads to Amazon S3 buckets

# Defining Global Variables

S3_BUCKET_NAME=""
AWS_ACCESS_KEY=""
AWS_SECRET_ACCESS_KEY=""
REPO_NAME=""
BRANCH=""
FILE_NAME=""

# Function Definitions

# Firt Funtion that reads user inputs from command prompt
# User must supply s3 bucket name, access key and secret access key

get_parameters()
{
echo ""
read -p "Enter your S3 Bucket Name : " S3_BUCKET_NAME
echo ""
read -s -p "Enter your Access Key : " AWS_ACCESS_KEY
echo ""
echo ""
read -s -p "Enter your Secret Access Key : " AWS_SECRET_ACCESS_KEY
echo ""
}

# Second Fuction exports user provided access key and secret access key into environment variables

export_env_variables()
{

echo ""
echo "Exporting Credentials..."
export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
#echo ""
#echo "AWS_ACCESS_KEY_ID : $AWS_ACCESS_KEY_ID"
#echo ""
#echo "AWS_SECRET_ACCESS_KEY : $AWS_SECRET_ACCESS_KEY"
#echo ""

}

# Third Function gets the repo name by extracting users root folder name

get_repo_name()
{

echo ""
echo "Getting Repo Name..."
echo ""
REPO_NAME=${PWD##*/}
echo "$REPO_NAME"

}

# Fourth Function extracts the branch name from the git branch command

get_branch()
{

echo ""
echo "Getting Branch Name..."
echo ""
BRANCH=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
echo "$BRANCH"

}

# Fifth Fuction pull the changes from the git repository

pull_changes()
{

echo ""
echo "Pulling Changes from GIT repository..."
echo ""

git pull

	if [ $? -eq 0 ]; then
	
	echo ""
	echo "Completed Pulling Changes..."	

	else
	
	echo ""	
	echo "Failed to Pull Changes..."
	echo ""
	exit 1	

	fi

}

# Sixth Function compresses the git repo into a tar ball

compress_repo()
{

echo ""
echo "Compressing your Repository..."
echo ""
FILE_NAME=$REPO_NAME-$BRANCH.tar.gz
COMMAND="tar cvzf $FILE_NAME *"
echo "Executing Tar Command : $COMMAND"

$COMMAND 2>/dev/null
      
	if [ $? -eq 0 ]; then   

	echo ""
	echo "Completed Compression..."
	echo ""

	else
	
	echo ""
	echo "Failed to Compress repo..."
	echo ""
	exit 1

	fi

}

# Seventh Funtion uploads the tar ball to the specified S3 bucket

upload_to_s3()
{

echo "Uploading your repository to S3 bucket : $S3_BUCKET_NAME "
echo ""

aws s3 cp $FILE_NAME s3://$S3_BUCKET_NAME
	
	if [ $? -eq 0 ]; then

	echo ""
	echo "Completed uploading to S3 bucket..."
	echo ""

	else
	
	echo ""
	echo "Failed to upload to S3 bucket..."
	echo ""
	exit 1

	fi

}


#Function calls

get_parameters
export_env_variables
get_repo_name
get_branch
pull_changes
compress_repo
upload_to_s3


