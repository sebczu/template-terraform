#!/bin/bash
echo "STARTED"

COMMAND=$1
echo "COMMAND: $COMMAND"

set -e

cd /scripts

echo $CREDENTIAL | base64 -d > credential.json

gcloud auth activate-service-account --key-file=credential.json
gcloud config set project personal-331119
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable iam.googleapis.com
gcloud services enable container.googleapis.com

terraform version

terraform $COMMAND

echo "FINISHED"