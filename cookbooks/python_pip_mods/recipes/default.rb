#
# vi: set ft=ruby :
#
# Cookbook name: django
# Recipe: default
#

# package "MySQL-python" do
#   provider Chef::Provider::PythonPip
#   action :install
# end

python_pip "MySQL-python" do
  action :install
end

python_pip "web.py" do
  action :install
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
