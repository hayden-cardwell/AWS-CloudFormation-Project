# AWS-CloudFormation-Project


This is the Repo for the CloudFormation Project that deploys Deep Security within a VPC. 

![Diagram of the Deployment](https://deep-sec-haydencardwell.s3.amazonaws.com/Cloudformation.png)

Initally this project aimed to implement an RDS instance for hosting the Deep Security Manager's database, but upon testing, this idea was scrapped due to the amount of time that a database takes to intialize, on average 15 to 20 minutes. 

The newest version of this template simply uses the same instance to host the Deep Security Manager and the database. Moving forward I would separate this functionality into two servers, but there is something to say for the relative simplicity that this configuration brings. 

Keep in mind, there are multiple things that need to be changed in order for this set of templates to comply with not only general best practices, but security best practices as well.  

Please note that most of the files found within this Repo are redundant for easier inspection, and will be pulled from a public S3 bucket. 
