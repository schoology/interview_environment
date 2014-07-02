# default root password
default[:mysql][:server_root_password] = 'r00tp@ssw0rd'

default[:mysql][:user_list] = [{ :username => 'interview', :password => 'interview'}]

default[:mysql][:databases] = [{:name => 'interview'}]
