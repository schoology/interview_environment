#
# vi: set ft=ruby :
#
# Cookbook name: django
# Recipe: default
#

package "ruby-devel" do
  action :install
end

gem_package "mysql" do
  action :install
end

gem_package "sinatra" do
  action :install
end

# make sure that iptables allows for input/output on the port sinatra will run on - port 3000
bash 'iptables open port 3000' do
  code <<-"EOH"
    /sbin/iptables -I INPUT -p tcp --dport 4567 -m state --state NEW,ESTABLISHED -j ACCEPT
    /sbin/iptables -I OUTPUT -p tcp --dport 4567 -m state --state ESTABLISHED -j ACCEPT
    /sbin/service iptables save
  EOH
  action :run
  not_if "/sbin/iptables -L -v -n | /bin/grep \"tcp dpt:3000\""
end