### **TEMPLATE-TERRAFORM**

#### 1. Build image
```bash
docker build -t sebczu/personal:template-terraform-0.0.1 service
```

#### 2. Docker-compose run container (create cluster)
```bash
docker-compose -f docker/docker-compose-apply.yml up
```

#### 3. Docker-compose run container (destroy cluster)
```bash
docker-compose -f docker/docker-compose-destroy.yml up
```

#### 3. Docker run container (interactive mode)
```bash
docker run -it \
--entrypoint /bin/bash \
-e "CREDENTIAL_GCLOUD={BASE_64_CREDENTIAL_GCLOUD}" \
-e "CREDENTIAL_DOCKERHUB={BASE_64_CREDENTIAL_DOCKERHUB}" \
-e "CREDENTIAL_GITHUB={BASE_64_CREDENTIAL_GITHUB}" \
sebczu/personal:template-terraform-0.0.1
```

#### 4. Docker run container (create cluster)
```bash
docker run \
-e "CREDENTIAL_GCLOUD={BASE_64_CREDENTIAL_GCLOUD}" \
-e "CREDENTIAL_DOCKERHUB={BASE_64_CREDENTIAL_DOCKERHUB}" \
-e "CREDENTIAL_GITHUB={BASE_64_CREDENTIAL_GITHUB}" \
sebczu/personal:template-terraform-0.0.1 \
"apply -auto-approve"
```

#### 5. Docker run container (destroy cluster)
```bash
docker run \
-e "CREDENTIAL_GCLOUD={BASE_64_CREDENTIAL_GCLOUD}" \
-e "CREDENTIAL_DOCKERHUB={BASE_64_CREDENTIAL_DOCKERHUB}" \
-e "CREDENTIAL_GITHUB={BASE_64_CREDENTIAL_GITHUB}" \
sebczu/personal:template-terraform-0.0.1 \
"destroy -auto-approve"
```

#### 5. Create service account for kubernetes cluster
```bash
login to google cloud console
IAM -> Service account -> Create Service Account (Select Role: Owner)
Keys -> Add Key -> Select: JSON
```