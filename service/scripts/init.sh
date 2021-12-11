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

# fetch terraform.tfstate
git clone https://$(jq .token credential_github.json --raw-output)@github.com/sebczu/template-terraform-state.git
mv template-terraform-state/terraform.tfstate /

terraform $COMMAND

# push terraform.tfstate
cp terraform.tfstate template-terraform-state/
cd template-terraform-state
git config --global user.name 'sebczu'
git config --global user.email 'dev.sebastian.czubala@gmail.com'
git add .
git commit -m "Update terraform state"
git push -u origin master

echo "FINISHED"