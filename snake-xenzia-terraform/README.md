
# Snake Xenzia Project 

- Hosted the snake xenzia game on Amazon S3 using the Terraform 







## Workflow

- Create a S3 Bucket
- Assign necessary permissions
- Enable Website Hosting
- Push the repo files to s3 bucket
- Create a Route53 record to point the game s3 endpoint to your subdomain. (subdomain.domain.com)
- Clean Up.


## Environment Variables

To run this project, you will need to add the AWS Credentials as the environment variables to your system - 

`export AWS_ACCESS_KEY_ID="<YOUR ACCESS KEY>"`

`export AWS_SECRET_ACCESS_KEY="<YOUR SECRET KEY>"`

**Or run below command and provide your aws creds-** 

- You need to first install the aws cli on your system

```
aws configure
```



## Deployment

The first step to using Terraform is initializing the working directory. In your shell session, type the
following command:

```bash
  terraform init
```

 Now, Check what all resources we're going to create- 

```bash
  terraform plan
```

 We're now ready to deploy this infra on AWS
```bash
  terraform apply -auto-approve
```

 Once, you're done. Destroy all the resources by running
```
  terraform destroy 
```
