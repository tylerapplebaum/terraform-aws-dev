# terraform-aws-dev

Initialize the environment
`terraform.exe init`

Check syntax; prepare deployment
`terraform.exe plan -out dev-aws-ami01.plan`

Deploy!
`terraform.exe apply dev-aws-ami01.plan`

Examine the environment
`terraform.exe show`

Blow it away
`terraform.exe destroy`
  
Terraform labs:
- [x] Launch AMI + new SG at same time
- [ ] Launch Cloudfront distro w/ S3 origin + upload files
- [ ] Launch ALB + EC2 instances