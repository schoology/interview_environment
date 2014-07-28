#
# vi: set ft=ruby :
#
# Cookbook name: django
# Recipe: default
#

package "python" do
  action :install
end

package "python-devel" do
  action :install
end

package "python-pip" do
  action :install
end

# package "MySQL-python" do
#   action :install
# end

bash "pip install MySQL-python" do
  code <<-"EOH"
    pip install MySQL-python
  EOH
  not_if "pip list | grep -c MySQL-python"
end

# make sure that iptables allows for input/output on the port django will run on port 3000
bash 'iptables open port 8000' do
  code <<-"EOH"
    /sbin/iptables -I INPUT -p tcp --dport 8000 -m state --state NEW,ESTABLISHED -j ACCEPT
    /sbin/iptables -I OUTPUT -p tcp --dport 8000 -m state --state ESTABLISHED -j ACCEPT
    /sbin/service iptables save
  EOH
  action :run
  not_if "/sbin/iptables -L -v -n | /bin/grep \"tcp dpt:8000\""
end
