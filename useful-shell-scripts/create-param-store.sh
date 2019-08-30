#!/bin/bash

# Given a property file with only secured parameters that need to be 
# stored in AWS Parameter Store as SecureString, this shell script will 
# act as a helper

file="./stage-secure.properties"

if [ -f "$file" ]
then
  # Please configure aws cli to point to right region and account, with 
  # permission to create parameter store
  echo "Exporting values from environment file to AWS parameter store - $file"
  while IFS='=' read -r key value
  do
  # Replace /lab with environment specific namespace you like to create
    JSON_STRING='{"Name":"/lab/common-params/'"$key"'","Value":"'"$value"'","Type":"SecureString"}'
    # echo $JSON_STRING
    aws ssm put-parameter --overwrite --cli-input-json "$JSON_STRING"
    
  done < "$file"
else
  echo "Environment file - $file not found."
fi

