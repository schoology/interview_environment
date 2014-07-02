#
# vi: set ft=ruby :
#
# Cookbook Name:: mysql
# Recipe:: default
# 

# ensure that the mysql-server package is installed.
package "mysql-server" do
  action :install
end

# enable the service on boot, and make sure it is started
service "mysqld" do
  action [ :enable, :start ]
end

# this is equivalent to running /usr/bin/mysql_secure_installation
bash 'mysql_secure_install emulate' do
  code <<-"EOH"
    /usr/bin/mysqladmin drop test -f
    /usr/bin/mysql -e "delete from user where user = '';" -D mysql
    /usr/bin/mysql -e "delete from user where user = 'root' and host = \'#{node[:hostname]}\';" -D mysql
    /usr/bin/mysql -e "SET PASSWORD FOR 'root'@'::1' = PASSWORD('#{node[:mysql][:server_root_password]}');" -D mysql
    /usr/bin/mysql -e "SET PASSWORD FOR 'root'@'127.0.0.1' = PASSWORD('#{node[:mysql][:server_root_password]}');" -D mysql
    /usr/bin/mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('#{node[:mysql][:server_root_password]}');" -D mysql
    /usr/bin/mysqladmin flush-privileges -p#{node[:mysql][:server_root_password]}
  EOH
  action :run
  only_if "/usr/bin/mysql -u root -e 'show databases;'"
end

for db in node[:mysql][:databases] do
  bash "add mysql database #{db[:name]}" do
    code <<-"EOH"
      /usr/bin/mysql -e "CREATE DATABASE #{db[:name]};" -u root -p#{node[:mysql][:server_root_password]}
    EOH
    action :run
    not_if <<-"EOH"
      /usr/bin/mysql -e "SHOW DATABASES LIKE \'#{db[:name]}\';" -u root -p#{node[:mysql][:server_root_password]} | grep -c #{db[:name]}
    EOH
  end
end

# add a user that can log in remotely for each user in the user_list
for user in node[:mysql][:user_list] do 
  log "add mysql user #{user[:username]}" do
    message "#{user[:username]}"
    level :info
  end

  bash "add mysql user #{user[:username]}" do
    code <<-"EOH"
      /usr/bin/mysql -e "CREATE USER \'#{user[:username]}\'@'localhost' IDENTIFIED BY \'#{user[:password]}\';" -D mysql -u root -p#{node[:mysql][:server_root_password]}
      /usr/bin/mysql -e "CREATE USER \'#{user[:username]}\'@'%' IDENTIFIED BY \'#{user[:password]}\';" -D mysql -u root -p#{node[:mysql][:server_root_password]}
      /usr/bin/mysql -e "GRANT ALL ON *.* TO \'#{user[:username]}\'@'localhost';" -u root -p#{node[:mysql][:server_root_password]}
      /usr/bin/mysql -e "GRANT ALL ON *.* TO \'#{user[:username]}\'@'%';" -u root -p#{node[:mysql][:server_root_password]}
      /usr/bin/mysqladmin flush-privileges -p#{node[:mysql][:server_root_password]}
    EOH
    action :run
    not_if <<-"EOH"
      /usr/bin/mysql -u root -p#{node[:mysql][:server_root_password]} -e "SELECT User FROM user WHERE User = '#{user[:username]}';" -D mysql | grep remote
    EOH
  end
end

# make sure that iptables allows for input/output on port 3306
bash 'iptables open mysql port' do
  code <<-"EOH"
    /sbin/iptables -I INPUT -p tcp --dport 3306 -m state --state NEW,ESTABLISHED -j ACCEPT
    /sbin/iptables -I OUTPUT -p tcp --dport 3306 -m state --state ESTABLISHED -j ACCEPT
    /sbin/service iptables save
  EOH
  action :run
  not_if "/sbin/iptables -L -v | /bin/grep mysql"
end
