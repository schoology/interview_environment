#
# vi: set ft=ruby :
#
# Cookbook name: django
# Recipe: default
#

package "ruby-devel" do
  action :install
end

bash "Install rails" do
  code <<-"EOH"
    rvm use 2.1.2;
    gem install rails;
    gem install mysql;
  EOH
end

# make sure that iptables allows for input/output on the port rails will run on - port 3000
bash 'iptables open port 3000' do
  code <<-"EOH"
    /sbin/iptables -I INPUT -p tcp --dport 3000 -m state --state NEW,ESTABLISHED -j ACCEPT
    /sbin/iptables -I OUTPUT -p tcp --dport 3000 -m state --state ESTABLISHED -j ACCEPT
    /sbin/service iptables save
  EOH
  action :run
  not_if "/sbin/iptables -L -v -n | /bin/grep \"tcp dpt:3000\""
end