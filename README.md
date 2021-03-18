
![InfraD](https://github.com/hyonsok5/terraform-lunch2/blob/main/etc/infraD-lunch2-hackerthon.png)
![lunch2](https://github.com/hyonsok5/terraform-lunch2/blob/main/etc/lunch2.png)
![admin](https://github.com/hyonsok5/terraform-lunch2/blob/main/etc/admin-lunch2.png)
![roulette](https://github.com/hyonsok5/terraform-lunch2/blob/main/etc/roulette.png)

# terraform-lunch2

1. Terraform Cloud used (https://app.terraform.io/)
   - Secrets, Envs etc stored
   - CI/CD in GitHub Actions setting up
1. GitHub Actions Secret used
1. All Document & Commit Message must be written in english
1. cli folder for azure cli command (/cli/)
   - No Version Control (Local Only)
   - To make resource group, tf state storage 
1. Terraform Secret How2
    - Secret Info must use running variable input
```
    terraform apply -var "secret=something" 
```

