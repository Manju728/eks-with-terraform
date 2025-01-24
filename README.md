# eks-with-terraform

### How to deploy?

###### Change directory
```commandline
cd cloud_infrastructure
```

###### Initialize terraform
```commandline
terraform init -backend-config=backend-config.hcl
```

###### Select environment
```commandline
terraform workspace select -or-create test
```

###### Apply changes
```commandline
terraform apply -auto-approve
```
###### Destroy changes
```commandline
terraform destroy -auto-approve
```
