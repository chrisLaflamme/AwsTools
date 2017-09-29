# AwsTools

This project is holds a variety of rake tasks life with AWS a bit easier.

### EC2
#### list_all_instances

:construction_worker UNDER CONSTRUCTION: :construction_worker Lists all instances and their state for all regions.

### Creds
#### swap_creds
This task will rename files in you .aws directory to help you manage multiple AWS account credentials. There is an notion of AWS profile partitioning that is supported in the AWS credentials file itself but having two separate files helps prevent accidentally interacting with the incorrect AWS account.
