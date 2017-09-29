require 'aws-sdk'
require 'fileutils'
require 'colorize'

# list of AWS regions
@regions = [
  'us-east-1',
  'us-east-2',
  'us-west-1',
  'us-west-2',
  'ca-central-1',
  'eu-west-1',
  'eu-central-1',
  'eu-west-2',
  'ap-northeast-1',
  'ap-northeast-2',
  'ap-southeast-1',
  'ap-southeast-2',
  'ap-south-1',
  'sa-east-1'
]

#
# Method Definitions
############################################################################################

def show_all_instances
  # intialize empty hash to push to
  regions_with_instances = {}
  @regions.each do |region|
    # new client for every region
    ec2 = Aws::EC2::Client.new(
      region: region
    )

    resp = ec2.describe_instances(max_results: 6)
    # check to see if there are any instances in the region at all
    if resp.reservations[0].nil?
      puts "#{region}: no instances"
      regions_with_instances[region.to_s] = nil
    else
      # TODO: handle multiple instances per region
      puts "#{region}: " + resp.reservations[0].instances[0].tags[0].value
      regions_with_instances[region.to_s] = resp.reservations[0].instances[0].tags[0].value
    end

    p regions_with_instances
  end
end

def swap_creds
  FileUtils.cd '/Users/claflamme/.aws'
  puts FileUtils.pwd
  # check what creds are being used now
  if File.file? 'credentials_personal'
    # switch from work to personal
    puts 'credentials_personal block'
    FileUtils.mv 'credentials', 'credentials_work'        # NOTE: the order matters here!!!
    FileUtils.mv 'credentials_personal', 'credentials'

    puts "Using PERSONAL creds now".colorize(:red)
    puts "Check yo'self though!!!".colorize(:green)
  elsif File.file? 'credentials_work'
    # switch from personal to work
    puts 'credentials work block'
    FileUtils.mv 'credentials', 'credentials_personal'    # NOTE: the order matters here!!!
    FileUtils.mv 'credentials_work', 'credentials'

    puts "Using WORK creds now!".colorize(:red)
    puts "Check yo'self though!!!".colorize(:green)
  end
  # verify that the creds are correct
  sh 'aws s3 ls'
end

#
# Rake Tasks
############################################################################################

desc 'List All Ec2 Instances for all Regions'
task :list_all_instances do
  show_all_instances
end

desc 'Swap AWS creds file from personal to work or vice versa'
task :swap_creds do
  swap_creds
end
