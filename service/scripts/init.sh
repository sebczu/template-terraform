#!/bin/bash
echo "STARTED"

echo "TYPE: $TYPE"

set -e

cd /scripts

echo $CREDENTIAL | base64 -d > credential.json

gcloud auth activate-service-account --key-file=credential.json
gcloud config set project personal-331119
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable iam.googleapis.com
gcloud services enable container.googleapis.com

terraform version

if [ "$TYPE" = "APPLY" ] ; then
  terraform apply -auto-approve
fi
if [ "$TYPE" = "DESTROY" ] ; then
  terraform destroy -auto-approve
fi