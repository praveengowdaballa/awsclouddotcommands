#!/bin/bash
# create a new user and create a new profile
aws iam create-user --user-name praveen-user
credentials=$(aws iam create-access-key --user-name praveen-user \
           --query 'AcessKey.[AcesskeyId,SecretAccessKey]'\
           --output text)
acess_key_id=$(echo $credentials |cut -d' ' -f 1)
secret_access_key=$(echo $credentials |cut -d' ' -f 2)
aws configure set profile.praveen.aws_acess_key_id "$access_key_id"
aws configure set profile.praveen.aws_secret_access_key "$secret_access_key"
