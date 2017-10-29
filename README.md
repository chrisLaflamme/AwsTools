# AwsTools

This project is holds a variety of rake tasks life with AWS a bit easier.

### EC2
#### list_all_instances

:construction_worker: UNDER CONSTRUCTION: :construction_worker:

Lists all instances and their state for all AWS regions.

### Creds
#### switch_creds
This task will rename files in your .aws directory to help you manage interacting with different AWS accounts. There is a notion of AWS profile partitioning that is supported in the AWS credentials file itself but having separate files helps prevent accidentally interacting with the incorrect AWS account.
This task requires that you have the following files in your .aws/ directory and that they be properly configured with the corresponding credentials.
> .aws/credentials

> .aws/credentials_personal OR .aws/credentials_work

#### which_creds
This task will show you which credentials are currently active.  This task requires that you have the following two files in your .aws/ directory and that they be properly configured with the corresponding credentials.
> .aws/credentials

> .aws/credentials_personal OR .aws/credentials_work
