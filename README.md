riakaws
=====================================================
pronounced [*ruckus*](http://dictionary.reference.com/browse/ruckus)

Simple and rapid [Riak](http://riak.basho.com/) cloud deployment.

The default configuration uses the furiously fast key-value store [bitcask](http://blog.basho.com/2010/04/27/hello,-bitcask/) as the storage backend. Modifications to the default riak configuration can be made in [./chef/cookbooks/riak/files/default/app.config](http://github.com/roder/riakaws/blob/master/chef/cookbooks/riak/files/default/app.config).

Currently the Amazon Machine Image is set to 32-bit ubuntu server. This is a single core, small AWS instance.  It would be better to run with more memory and more cores, but if you're broke, you're probably grateful that this is the default. Riakaws spins up 3 nodes in the cloud.  The defaults can be changed in clouds.rb.

Prerequisites
----------------

**Gems**

* [amazon-ec2](http://github.com/grempe/amazon-ec2)
* [poolparty](http://poolpartyrb.com)

To install:

    $ gem install amazon-ec2
    $ gem install poolparty

**Environment Variables**


This should be placed in ~/.bashrc or ~/.profile

    export EC2_ACCESS_KEY='aws_access_key'
    export EC2_SECRET_KEY='aws_secret_key'

Deployment
--------------------

**Initial Deployment**

    $ cloud start -c path/to/clouds.rb
    
**Scaling Out**

    $ cloud expand -c path/to/clouds.rb
    $ cloud configure -c path/to/clouds.rb
    
**Scaling In**
    
    $ cloud contract -c path/to/clouds.rb

Known Issues
------------

Often with the Ubuntu image, there is an issue where poolparty will try to login to the AMI before ssh is ready.  You'll see that your cloud deployment fails with an error like this:

    Copying the chef-repo into the base directory from ./chef/
    Creating the dna.json
    Connection closed by 72.44.56.95
    rsync: connection unexpectedly closed (0 bytes received so far) [sender]
    rsync error: unexplained error (code 255) at /SourceCache/rsync/rsync-40/rsync/io.c(452) [sender=2.6.9]
    
The only resolution, I have found is to terminate the cloud and continue re-deploy.
    
License
-------
Copyright 2010 Matt Heitzenroder

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at


    `http://www.apache.org/licenses/LICENSE-2.0 <http://www.apache.org/licenses/LICENSE-2.0>`_

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.