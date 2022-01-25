# terraform-docker-demo

This repo will create a mysql docker container.It has three main part:

   - create a random password : you can use this password as "MYSQL_ROOT_PASSWORD"

   - database name : is mysql

   - creation of docker container from mysql latest image (exposed port is: 33306) 

It has three outputs:

   - id
   
   - image name

   - container ip

# What is Terraform?

Terraform is an infrastructure as code (IaC) tool that allows you to build, change, and version infrastructure safely and efficiently.

This includes low-level components such as compute instances, storage, and networking, as well as high-level components such as DNS entries, SaaS features, etc. 

Terraform can manage both existing service providers and custom in-house solutions.

# How to use?

   - terraform init
   - terraform plan
   - terraform apply -auto-approve
   - terraform output -json
