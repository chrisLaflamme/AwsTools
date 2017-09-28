require 'aws-sdk'

# list of AWS regions
@regions = [
  "us-east-1",
  "us-east-2",
  "us-west-1",
  "us-west-2",
  "ca-central-1",
  "eu-west-1",
  "eu-central-1",
  "eu-west-2",
  "ap-northeast-1",
  "ap-northeast-2",
  "ap-southeast-1",
  "ap-southeast-2",
  "ap-south-1",
  "sa-east-1"
]

def show_all_instances
  # intialize empty hash to push to
  regions_with_instances = {}
  @regions.each do |region|
    # new client for every region
    ec2 = Aws::EC2::Client.new(
      region: region
    )

    resp = ec2.describe_instances({
      max_results: 6,
    })
    # check to see if there are any instances in the region at all
    if resp.reservations[0] == nil
      puts "#{region}: no instances"
      regions_with_instances["#{region}"] = nil
    else
      #TODO: handle multiple instances per region
      puts "#{region}: " + resp.reservations[0].instances[0].tags[0].value
      regions_with_instances["#{region}"] = resp.reservations[0].instances[0].tags[0].value
    end

    p regions_with_instances
  end
end

desc "List All Ec2 Instances for all Regions"
task :list_all_instances do
  show_all_instances
end
