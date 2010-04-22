set_unless[:riak][:url] = "http://downloads.basho.com/riak/riak-0.9/riak_0.9.1-2_i386.deb"
set_unless[:riak][:src_bin] = '/usr/sbin/riak'
set_unless[:riak][:cookie] = 'riak'
set_unless[:riak][:erts] = '/usr/lib/riak/erts-5.7.4/bin'
set_unless[:riak][:init] = "http://gist.github.com/raw/374888/08b52132863b772da565c3630265c8298c2b74e6/Ubuntu%20initscript%20riak"

set_unless[:innostore][:url] = "http://downloads.basho.com/innostore/innostore-8/innostore_8_i386.deb"
set_unless[:innostore][:riak_config] = '/etc/riak/app.config'
set_unless[:innostore][:lib] = '/usr/lib/riak/lib/innostore-8/priv/innostore_drv.so'
