# AWS-CloudFormation-Project
This is the Repo for the CloudFormation Project that deploys Deep Security within a VPC. 

Initally this project aimed to implement an RDS instance for hosting the Deep Security Manager's database, but upon testing, this idea was scrapped due to the amount of time that a database takes to intialize, on average 15 to 20 minutes. 

The newest version of this template simply uses the same instance to host the Deep Security Manager and the database. Moving forward I would separate this functionality into two servers, but there is something to say for the simplicity that this configuration brings. 
