riakaws
=====================================================
pronounced [*ruckus*](http://dictionary.reference.com/browse/ruckus)

Simple and rapid [Riak](http://riak.basho.com/) cloud deployment.

The default configuration includes using [innostore](https://wiki.basho.com/display/RIAK/Setting+Up+Innostore) as the storage backend.

Currently the Amazon Machine Image is set to 32-bit ubuntu server. This is a single core, small AWS instance.  It would be better to run with more memory and more cores, but if you're cheap like me, you're probably grateful that this is the default. Riakaws spins up 3 nodes in the cloud.  The defaults can be changed in clouds.rb.

In *riakaws*, Riak is also configured to run with `heart`, which is not the default Riak configuration.


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