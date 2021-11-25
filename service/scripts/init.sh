#!/bin/bash
echo "STARTED"

COMMAND=$1
echo "COMMAND: $COMMAND"

set -e

cd /scripts

echo $CREDENTIAL_GCLOUD | base64 -d > credential_gcloud.json
echo $CREDENTIAL_DOCKERHUB | base64 -d > credential_dockerhub.json
echo $CREDENTIAL_GITHUB | base64 -d > credential_github.json

gcloud auth activate-service-account --key-file=credential_gcloud.json
gcloud config set project personal-331119
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable iam.googleapis.com
gcloud services enable container.googleapis.com

terraform version

terraform $COMMAND

echo "FINISHED"