FROM hashicorp/terraform:1.0.11

# install bash, curl, python
RUN apk update && apk upgrade
RUN apk add --no-cache \
  bash \
  curl \
  python3

# install gcloud
RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz
RUN mkdir -p /usr/local/gcloud \
  && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
  && /usr/local/gcloud/google-cloud-sdk/install.sh
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin

# install 'lib providers' by terraform
COPY /scripts/provider.tf /scripts/provider.tf
COPY /scripts/variables.tf /scripts/variables.tf
WORKDIR /scripts
RUN terraform init

# copy rest of the scripts
COPY /scripts /scripts

ENTRYPOINT ["/scripts/init.sh"]