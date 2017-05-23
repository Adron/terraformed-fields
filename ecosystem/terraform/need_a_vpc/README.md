# What is the "need_a_vpc" directory for?

**Purpose:** The reason I put this here was if or when you end up with a deleted default VPC these days (or, like I, you had such an old AWS account you never had one) then this is a quick recreation of a VPC that is usable for the creation of the other elements of this repo. Specifically so, the VPC created here is/would need to be used in the terraform config/template files in the directory this directory is in.
 
**Use:** Running `terraform apply` should do it. You'll need to have the .aws/credentials and related setup before hand however so that your machine can connect to and make changes in your AWS account.