#
# vi: set ft=ruby :
#
# Cookbook name: apache2
# Recipe: default
#

# ensure that the httpd package is installed.
package "httpd" do
  action :install
end

# make sure that iptables allows for input/output on port 3306
bash 'iptables open port 80' do
  code <<-"EOH"
    /sbin/iptables -I INPUT -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
    /sbin/iptables -I OUTPUT -p tcp --dport 80 -m state --state ESTABLISHED -j ACCEPT
    /sbin/service iptables save
  EOH
  action :run
  not_if "/sbin/iptables -L -v | /bin/grep httpd"
end

template "/etc/httpd/conf/httpd.conf" do
                source "httpd.conf.erb"
                mode 0644
                owner "root"
                group "root"                
end

service "httpd" do
  action [:enable, :start]
end

package "php" do
  action :install
  notifies :restart, 'service[httpd]', :delayed
end

# install mod_fcgid
package "mod_fcgid" do
  action :install
  notifies :restart, 'service[httpd]', :delayed
end

# install PHP5
package "php-cli" do
  action :install
  notifies :restart, 'service[httpd]', :delayed
end
