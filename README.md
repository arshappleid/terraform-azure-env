# azure-ad-sql-server


## Setting up the Environment
Ensure docker, docker compose , and the docker engine is installed
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
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
az login

terraform init ## install all modules
terraform apply ## Deploy everything
terraform apply --auto-approve
terraform destroy

## Configure Subscription 
az account list --output table
az account set --subscription "<subscription-id-or-name>"
az account show --output table
az account list --output table ## use this to get the subscription id
```


## References
(Terraform Azure Vnet Module)[https://registry.terraform.io/modules/Azure/vnet/azurerm/latest]