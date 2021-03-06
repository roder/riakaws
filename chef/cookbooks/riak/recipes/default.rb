include_recipe "cloud"

# Download the riak.deb file
remote_file "/tmp/riak.deb" do
  source node[:riak][:url]
  action :create_if_missing
  not_if "test -e #{node[:riak][:src_bin]}"
end

cookbook_file "/etc/sudoers" do
  source "sudoers"
  owner "root"
  group "root"
  mode "0440"
end

# Install the downloaded package
dpkg_package "riak" do
  source "/tmp/riak.deb" 
  action :install
end

# Add riak erts path to user environment
template "/etc/profile.d/riak" do
  source "riak.profile.erb"
  owner "root"
  group "root"
  mode "0755"
end

cookbook_file "/etc/riak/app.config" do
  source "app.config"
  owner "root"
  group "root"
  mode "0644"
end

template "/etc/riak/vm.args" do
  source "vm.args.erb"
  owner "riak"
  group "riak"
  mode "0644"
end

template "/etc/init.d/riak" do
  source "riak.erb"
  owner "root"
  group "root"
  mode "0744"
end

execute "join" do
  action :nothing
  name = node[:riakaws][:cloud].first
  if name.nil?
    Chef::Log.info("Riak Join: No nodes found.")
    
  else
    # FIXME: exit 0 is used to avoid situations where the other node has not 
    # started and we don't want chef to exit
    # TODO: check for active riak node before calling the command.
    Chef::Log.info("Riak Join: will attempt to join riak@" + node[:fqdn] + " to riak@" + name)
    command "sleep 5 && /usr/sbin/riak-admin join riak@#{name} || exit 0"
  end
end

service "riak" do
  supports :restart => true 
  action [ :enable, :start ]
  notifies :run, resources(:execute => "join") 
end
