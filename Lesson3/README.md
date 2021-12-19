# How to run

1.`terraform fmt`
2.`terraform validate`
3.`terraform plan -var-file="./env/non-prod/dev.tfvars" -out="test.tfplan"`
4.`terraform apply "test.tfplan"`