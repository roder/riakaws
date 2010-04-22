pool "riakaws" do
  cloud "dev" do
    instances 3
    using :ec2
    
    image_id "ami-09e40a60" # Ubuntu 10.04 Beta Server  32-bit (Lucid Lynx)
    # image_id "ami-bb709dd2" # Ubuntu 9.10 Server 32-bit (Karmic Koala)# 
        
    chef :solo do
      attributes :riakaws => {
        :aws_access_key => ENV['EC2_ACCESS_KEY'], 
        :aws_secret_key => ENV['EC2_SECRET_KEY']
        }
      repo File.dirname(__FILE__)+"/chef/"
      recipe "cloud"
      recipe "riak"
    end
    
    user "ubuntu"
    
    security_group "base" do
      %w(22 8098 8087).each {|port|  authorize :from_port => port, :to_port => port}
      authorize :from_port => -1, :to_port => -1, :group_name => "base", :protocol => "icmp"
      authorize :from_port => 1, :to_port => 65535, :group_name => "base", :protocol => "tcp"
      authorize :from_port => 1, :to_port => 65535, :group_name => "base", :protocol => "udp"
    end
    
  end
end