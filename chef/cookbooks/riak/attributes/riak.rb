
# These are the default deb packages to install and this should be overriden in clouds.rb
set_unless[:riak][:url] = "http://downloads.basho.com/riak/riak-0.11/riak_0.11.0-1344_i386.deb"

set_unless[:riak][:src_bin] = '/usr/sbin/riak'
set_unless[:riak][:cookie] = 'riak'
set_unless[:riak][:erts] = '/usr/lib/riak/erts-5.7.5/bin'

set_unless[:riak][:init] = "http://gist.github.com/raw/374888/34c03d7b1306fb6e7f944b200f40a8b4739ce4bb/Ubuntu%20initscript%20riak"
