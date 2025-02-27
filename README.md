# Snake Xenzia

- Hosted the snake xenzia game on Amazon S3 using the Terraform 

## Architecture Diagram
![arch-diagram](https://github.com/deeepak-tyagii/snake-xenzia/blob/master/asset/s3static1.gif)


## Workflow

- Create a S3 Bucket
- Assign necessary permissions
- Enable Website Hosting
- Push the repo files to s3 bucket
- Create a Route53 record to point the game s3 endpoint to your subdomain. (snake-xenzia.yourdomain.com)
- Clean Up.

## Clone this repo
First you need to clone this repo using following command - 

```
git clone <git-username/git-reponame>
```
Now, navigate to the terraform folder -
```
cd repo/snake-xenia-terraform
```

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



## Demo

<!-- <img alt="GIF" height="300px" width="300px" src="./assets/introo-game.gif" /> -->
![demo-gif](https://github.com/jaikarans/snake-xenzia/blob/master/asset/intro-game.gif)

## License
[MIT](https://choosealicense.com/licenses/mit/)
