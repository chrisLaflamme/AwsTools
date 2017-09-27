require 'aws-sdk'

# list of AWS regions
regions = [
  "us-east-1"
  # "us-east-2",
  # "us-west-1",
  # "us-west-2",
  # "ca-central-1",
  # "eu-west-1",
  # "eu-central-1",
  # "eu-west-2",
  # "ap-northeast-1",
  # "ap-northeast-2",
  # "ap-southeast-1",
  # "ap-southeast-2",
  # "ap-south-1",
  # "sa-east-1"
]



desc "List All Ec2 Instances for all Regions"
task :list_all_instances do
  regions.each do |region|
    # new client for every region
    ec2 = Aws::EC2::Client.new(
      region: region
    )

    # show each instance in the region
    resp = ec2.describe_instances({
      max_results: 6,
    })

    puts resp.reservations[0].instances[0].tags[0].value
  end

end
