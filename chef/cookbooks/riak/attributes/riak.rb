
# These are the default deb packages to install and this should be overriden in clouds.rb
set_unless[:riak][:url] = "http://downloads.basho.com/riak/riak-0.10/riak_0.10-1_i386.deb"
set_unless[:innostore][:url] = "http://downloads.basho.com/innostore/innostore-10/innostore_10-1_i386.deb"


set_unless[:riak][:src_bin] = '/usr/sbin/riak'
set_unless[:riak][:cookie] = 'riak'
set_unless[:riak][:erts] = '/usr/lib/riak/erts-5.7.4/bin'

set_unless[:innostore][:lib] = '/usr/lib/riak/lib/innostore-10/priv/innostore_drv.so'

set_unless[:riak][:init] = "http://gist.github.com/raw/374888/master/Ubuntu%20initscript%20riak"
