# Why Terraform?

Since three months, you have been actively building CI/CD pipeline to integrate the code to your application, building docker containers, orchestrating the pods with Kubernetes. Even before you do all this, an infrastructure like servers, networks, clusters, need to be created to ready the ground. In this session, you will explore IAC ( Infrastructure as Code via Terraform) which lets build the infrastructure via code from the scratch. With Terraform you can not only build, but provision new resources, manage the cloud infrastructure all without touching the hardware or the management console in AWS.


### Task 1: Understand IAC 

1. What is the use of Infrastructure as Code (IaC) and why you need it in DevOps/Cloud?
2. What issues does IAC resolve that occurs when deploying resources manually via AWS Management console?
3. Terraform vs other IAC tools (AWS CloudFormation, Pulumni, and Ansible)
4. What is Declarative and Cloud-agnostic.


### Explanation

1. Terraform allows you to define, deploy and manage the overall cloud infrastructure including ``servers``, ``database``, ``networks`` etc using the human readable configuration files rather than manually clicking on the AWS or other cloud console. **DevOps engineers** often have to maintain the consistent cloud infrastructure across Development, Testing, and Production environment which is also time consuming when you have to build 20, 30 instance and different networks. It uses variables, modules(reusable templates) to spin up and clone the environment smoothly.

2. Building the infrastructure manually with AWS management console requires you to navigate through several EC2 instance options, menus to select the resources etc. And doing this for several times just to spin up instances or create the networks is a time consuming process. Terraform let you define the infrastructure with ``HCL`` HashiCorp Configuration Language and then you run ``terraform apply`` which deploy the entire infrastructure in few seconds.
There is high possibility of the human error when the configurations are done manually so it gets difficult to manage the entire architecture manually.

3. When choosing between Terraform vs other IAC tools like (AWS CloudFormation, Pulumni, and Ansible), it depends on whether your organization is using a multi-cloud or AWS only architecture. As Terraform is a multi-cloud application which works with all major cloud provides like AWS, Ezure, GCP, Kubernetes, SAAS etc whereas CloudFormation is exclusive to AWS only.

4. Declarative stands for you define the end result(desired and state) that you need to build on your cloud infrastructure rather than ``how-to`` to build that infrastructure. Now the Terraform engine handles the underlying logic, API calls and execution order to make reality match your profile.

### Task 2: Setup Terraform

First install the Terraform application and to do that ensure that Terraform repository is added in your Linux machine. Also, you can verify if the terraform is installed with ``terraform -version`` command. 

Second, setup the AWS CLI in your Linux in order to use the command based AWS setup. 

```
aws configure
# Enter the AWS Access key ID, Secret Access Key and the default region (us-east-1)
```

Verify AWS is configure with below command : 

```
yoginderbagga@fedora:~/my-first-terraform$ aws sts get-caller-identity 
{
    "UserId": "ABCDXYZ",
    "Account": "3465123456",
    "Arn": "arn:aws:iam::3465123456:user/spider_man"
}
```

### Task 3: Create an S3 Bucket with Terraform Configuration

S3 Bucket (Simple Storage Service) is a cloud storage service which is used to store, manage files, data and digital objects of any sizes. You can think of S3 bucket is a container where you can store any huge size files in unlimited number. 

One thing to note, an object storage service is different from a database(like PostgreSQL, MongoDB) as the database stores structure information like text, numbers, or alphabets etc whereas an S3 bucket stores unstructured files(images, videos, PDFs, and backups) 

**Use Cases**

- To store user-generated content and secure document storage: Suppose when a customer takes photo of the product, invoices and uploads PDF of that via the mobile app and that file goes from application server and uploaded directly into the ``Amazon S3 bucket``
- Big Data Analytics & Financial Auditing: Big companies tracks the transactions, user clicks, histories of millions of users in a single day. Now all these raw files, database transactions, and third party API data are continuously dumped into a massive central S3 Data Lake.
- Your server handles the application backend logic, and S3 handles the heavy files. Now if server crashes, your data files are safe.



<img width="1361" height="505" alt="image" src="https://github.com/user-attachments/assets/bf68e541-1a39-4082-90dd-2cbaab89e8d3" />

```
yoginderbagga@fedora:~/s3-with-terraform$ terraform plan
```

```
yoginderbagga@fedora:~/s3-with-terraform$ terraform apply 
```

```
yoginderbagga@fedora:~/s3-with-terraform$ cat main.tf 
provider "aws" {
    region = "us-east-1"
}

#Define the S3 Bucket Resource

resource "aws_s3_bucket" "my_bucket" {
    bucket = "yogi-s3-bucket-terraform"

    tags = {
      Environment = "Dev"
      ManagedBy   = "Terraform"
	}
}

resource "aws_s3_bucket_versioning" "versioning" {
    bucket = aws_s3_bucket.my_bucket.id
    versioning_configuration {
      status = "Enabled"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
    bucket = aws_s3_bucket.my_bucket.id

    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }


resource "aws_s3_bucket_public_access_block" "public_access" {
    bucket = aws_s3_bucket.my_bucket.id

    block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
```
In above example, when you run ``terraform init`` command is used to initialize a new or existing Terraform directory. It downloads the ``Provider`` plugin based on the infrastructure you're using and the necessary binary files into a hidden local directory. 

Here is the results after successful run of terraform apply. 

<img width="1912" height="566" alt="image" src="https://github.com/user-attachments/assets/ed71c441-99da-4fbd-90bd-ae933e4b308c" />

### Task 4: Add an EC2 Instance in Existing Project

Verified EC2 instance was added from the same ``main.tf`` file, it showed 1 resource which is the S3 bucket already exist so it was unchanged. 

```
yoginderbagga@fedora:~/s3-with-terraform$ cat main.tf 
provider "aws" {
    region = "us-east-1"
}

#Define the S3 Bucket Resource

resource "aws_s3_bucket" "my_bucket" {
    bucket = "yogi-s3-bucket-terraform"

    tags = {
      Environment = "Dev"
      ManagedBy   = "Terraform"
	}
}

resource "aws_s3_bucket_versioning" "versioning" {
    bucket = aws_s3_bucket.my_bucket.id
    versioning_configuration {
      status = "Enabled"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
    bucket = aws_s3_bucket.my_bucket.id

    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }


resource "aws_s3_bucket_public_access_block" "public_access" {
    bucket = aws_s3_bucket.my_bucket.id

    block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_instance" "New-world" {
    ami = "ami-XYZ
  instance_type = "t2.micro"

  tags = {
    Name = "TerraWorld"
  }
}
```
