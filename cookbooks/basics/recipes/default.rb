# vi: set ft=ruby :
#
# Cookbook name: basics
# Recipe: default
#

# This must be done via bash because otherwise Chef makes yum think we are trying to install a package.
# The yum_package resource fails for the same reason as generic package.
bash "install EPEL repo" do
  code <<-"EOH"
    /usr/bin/yum install -y http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
  EOH
  action :run
  not_if "/bin/ls /etc/yum.repos.d/ | grep epel.repo"
end

