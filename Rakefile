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

$user = "claflamme"

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

def get_creds
  dir = Dir.entries("/Users/#{$user}/.aws")
  creds = []

  dir.each do |f|
    if f.length > 11 && f[0,12] == "credentials_"
      creds.push(f[12, f.length])
    end
  end
  creds
end

def switch_creds
  creds = get_creds()
  puts "Switch to wat?\n"

  i = 0
  creds.each do |o|
    puts "#{i}: #{o}"
    i += 1
  end

  selection = STDIN.gets.chomp.to_i
  selection = creds[selection]

  IO.copy_stream("/Users/#{$user}/.aws/credentials_#{selection}", "/Users/#{$user}/.aws/credentials")

  # this is probably a bad idea
  # File.open("/Users/#{$user}/.aws/credentials").each do |line|
  #   puts line
  # end
  32.times { print "*".colorize(:green) }
  puts "\n* Using #{selection.upcase!.colorize(:red)} creds now *\n"
  32.times { print "*".colorize(:green) }
  puts "\n"
end

def which_creds
  creds = get_creds
  creds.each do |cred|
    if FileUtils.compare_file("/Users/#{$user}/.aws/credentials", "/Users/#{$user}/.aws/credentials_#{cred}")
      32.times { print "*".colorize(:green) }
      puts "\n* You're using #{cred.upcase!.colorize(:red)} creds.*\n"
      32.times { print "*".colorize(:green) }
      puts "\n"
    end
  end
end

#
# Rake Tasks
############################################################################################

desc 'List all Ec2 instances for all regions'
task :list_all_instances do
  show_all_instances()
end

desc 'Swap AWS creds file from personal to work or vice versa'
task :switch_creds do
  switch_creds()
end

desc 'Show which creds are in use'
task :which_creds do
  which_creds()
end
