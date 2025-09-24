# Terraform Env with Cloud Cli tools
This project is a template to use for terraform Projects, which comes with AWS Cli tools preinstalled. Installation of the cli tools can can configured from the Docker compose files. Additionally tools for terraform linting (TFLint) and Terraform Security have been pre installed. Additionally this project has been configured with VSCode Extensions to lint and run the security config check on each 

This project ensures that AWS/Azure Credentials for different projects remain contained within the Docker environment. Which mitigates the risk of accidentally deploying into an unknown account. Although requires configuring the account logins through single-sign on on each new project. 

## Requirements
1. Docker, Docker compose. 
2. VsCode IDE, (Run on Save Extension)[https://marketplace.visualstudio.com/items?itemName=emeraldwalk.RunOnSave]

## Setting up the Environment
Ensure docker, docker compose , and the docker engine is installed.
```
brew install -y docker
```

### Spin up the container
```
docker compose up -d
docker ps ## Take the container ID
docker exec --interactive --tty <container_id> bash
```

### Inside the Container
```
az version
aws --version

terraform init ## install all modules
terraform apply ## Deploy everything
terraform apply --auto-approve
terraform destroy

## Configure Subscription 
az account list --output table
az account set --subscription "<subscription-id-or-name>"
az account show --output table
az account list --output table ## use this to get the subscription id

## AWS Configure Login
aws sso login --profile my-profile
```

