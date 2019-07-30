# AWS-CloudFormation-Project


This is the Repo for the CloudFormation Project that deploys Deep Security within a VPC. This is purely a project made for the learning opportunity, as well as the challenge. 

![Diagram of the Deployment](https://deep-sec-haydencardwell.s3.amazonaws.com/Cloudformation.png)

This project has three simple, but realistic goals. 

- Deploy one Deep Security Manager in which the console can be logged into.
- Do not require the individual deploying this template to deploy multiple templates. 
- Implement parameters to give the individual appropriate configuration options for their deployment. 

Initally this project aimed to implement an RDS instance for hosting the Deep Security Manager's database, but upon testing, this idea was scrapped due to the amount of time that an RDS database takes to intialize, on average 15 to 20 minutes. You can find the templates that deployed the VPC and the RDS instance within the now defunct RDS branch. 

The newest version of this template simply uses the same instance to host the Deep Security Manager and the database. Moving forward I would separate this functionality into two servers to not only make the fault domain smaller, but also reduce costs. This being said, there is something to say for the relative simplicity that this configuration brings. 

Keep in mind, there are multiple things that need to be changed in order for this set of templates to comply with not only general best practices, but security best practices as well. If time was readily available, there are a few different things that I would really like to implement in the future. These include, but are not limited to:

- KMS for generating the Deep Security Masterkey 
- A workaround for the S3 permissions that the EC2 instance uses. 
- Multiple manager nodes for availability, and work delegation. 
- Manager nodes deployed on spot instances for very large deployments(Needs testing for viability, but potentially possible).
- Agents within the environment to work with. 
- Scripting that automates the connection of the manager with the deploying AWS account. 

Please note that most of the files found within this Repo are redundant for easier inspection, and upon deployment of the master template will be pulled from a public S3 bucket. 
