# codefactory
CodeFactory repo contains bash script called artifact.sh which facilitate automation of local git repository uploads to Amazon S3 buckets.
All configuration files and conf folders are created for testing purposes. None of them are releavant to the bash script file.

Usage
User need to copy this bash script file to root folder of their git repository
Script will prompt for S3 bucket name, Access key and Secret access key from the user.
Once provided script will automatically upload the compressed current branch tar ball to provided S3 bucket.

Assumptions
Script will assume aws cli and git configurations are done in the host environment
Also user credentials provided have access to S3 bucket name given and have write permmisions to put objects in the bucket.
