r = gem_package "amazon-ec2" do
  action :nothing
end

r.run_action(:install)

Gem.clear_paths
require 'AWS'

ec2 = AWS::EC2::Base.new(:access_key_id => node[:riakaws][:aws_access_key], :secret_access_key => node[:riakaws][:aws_secret_key])

# In set[:riak][:cloud] list, create a list of running nodes
nodes = []
ec2.describe_instances.reservationSet.item.each do |n|
  n.instancesSet.item.each do |i|  
    if i.instanceState.name =~ /running/
      if i.privateDnsName != node[:fqdn]
        nodes << i.privateDnsName
      end
    end
  end
end

node[:riakaws][:cloud] = nodes