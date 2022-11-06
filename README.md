![terraform aws webserver](https://user-images.githubusercontent.com/50776786/200194267-08da68c8-5485-463b-9f69-883ed4e1e59b.png)

Web Server deployment on “AWS” using InfraStructure as Code (IaC) tool “Terraform”:
----------------------------------------------------------------------------------

*Deployment of webserver application facing public internet which process the user’s request by automating the entire infrastructure deployment.

*Step-by-step procedure on how to automate and deploy webserver application in AWS suing Terraform.

Terraform:
----------
Terraform Documentation : https://registry.terraform.io/providers/hashicorp/aws/latest/docs

-Terraform is a simple and very powerful orchestration tool developed to provision the infrastructure for the popular cloud platform which includes AWS, Google Cloud and Microsoft Azure. 

-Terraform can also be used as a configuration management tool but is best suited for orchestration (provisioning).

-AWS, Amazon Web Services, the popular cloud platform today supports huge enterprise application deployments. 

-AWS provides secure cloud platform which offers compute, database, content delivery, storage and many more functionalities to serve small, medium and large scale enterprise.

-This will help automating the deployment process using Terraform in AWS.

AWS Resources  :
--------------
1.Virtual Private Network (VPC)
2.Public subnet
3.Route tables
4.Internet gateways
5.EC2 instance
6.Security Group

Configuration:
--------------
-Create Virtual Private network (VPC) with mentioned CIDR range.

-Create a Public subnet with any of the CIDR block range, where the webserver will be deployed to face Internet users and handles their requests. The webserver will be assigned with a public IP as it is facing the internet users.

- Create an “internet gateway” which connects the above created VPC to the internet.

- A routing table will be created to allow the EC2 Instances (where the webserver is deployed) to the outside WAN network.

- A Front End server, virtual instance is created to serves as a webserver which deployed in public subnet of a VPC.

Prerequsite:
------------
1. AWS Account with free tier access.

2. IDE tool to write terraform coded i.e Visual Studio Code.

3. Key-Pair create and download from AWS ->EC2 to local machine with mathing name with variables.

4. Terraform installed in your local machine.

Deploy the infrastructure:
--------------------------
Once the template creation is done, use “terraform init” to load the required provider plugins and continue to check the infrastructure to be built using “terraform plan”. Once the configuration is verified, use “terraform apply” to deploy the infrastructure

![terraform deploy](https://user-images.githubusercontent.com/50776786/200195350-5732d7ff-da78-4b9e-a45c-0b18c30319fe.PNG)

Terraform Init:
---------------
The terraform init command initializes a working directory containing Terraform configuration files. This is the first command that should be run after writing a new Terraform configuration or cloning an existing one from version control. It is safe to run this command multiple times.

$terraform init

![image](https://user-images.githubusercontent.com/50776786/200195786-56e56791-6efb-401d-a1d3-1fbd0c89b400.png)


Terraform Plan:
---------------
The terraform plan command creates an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure. By default, when Terraform creates a plan it: Reads the current state of any already-existing remote objects to make sure that the Terraform state is up-to-date.Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.


$terraform plan

OR

#Save the plan/output file using -out option .

$terraform plan -out=webserver.txt

![image](https://user-images.githubusercontent.com/50776786/200195740-20a54a3b-49d2-444a-88c3-a1b8f8df23b3.png)


Terraform Apply:
----------------
terraform apply — Creates or updates infrastructure depending on the configuration files. By default, a plan will be generated first and will need to be approved before it is applied. terraform apply -auto-approve — Apply changes without having to interactively type 'yes' to the plan.

$terraform apply

OR

*Apply the saved output/plan file which is "webserver.txt"

$terraform apply "webserver.txt"

![image](https://user-images.githubusercontent.com/50776786/200195855-07d69379-aa9b-42e9-bc29-9dba12e71329.png)

Note:
-----
*Once provisioning and deployment of webserver successfull.

*Login to AWS account and navigate to EC2 services .

*Take the Public IP of the EC2 instance .

![image](https://user-images.githubusercontent.com/50776786/200196160-77fa111f-35f5-4a40-96db-dc5d262fb364.png)


*Open a new tab in ur browser and paste and enter, you will see application server is up and running and will retun message as below.

http://15.206.72.201/

![image](https://user-images.githubusercontent.com/50776786/200196187-b4c89aa2-e54b-4865-b802-f45a1a78bbdc.png)



Terraform Destroy:
------------------
The terraform destroy command is a convenient way to destroy all remote objects managed by a particular Terraform configuration.

$terraform destroy

![image](https://user-images.githubusercontent.com/50776786/200196336-0d4943e7-0e8d-46b3-b8a2-17beb6bb9d79.png)


Conclusion:
-----------
Using an IAC tool, Terraform, infrastructure provisioning is made easy, reliable and reusable. The same template can be used to deploy a webservers in different regions in a couple of minutes without user errors and rework. The same template can also be used to modify the infrastructure based on the business requirements and these changes can be saved in a state file.

Reference:
----------
https://developer.hashicorp.com/terraform

https://registry.terraform.io/providers/hashicorp/aws/latest/docs

https://docs.aws.amazon.com/ec2/index.html

https://aws.amazon.com/getting-started/

https://code.visualstudio.com/download

https://www.terraform.io/downloads
