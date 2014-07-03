#
# vi: set ft=ruby :
#
# Cookbook name: apache2
# Recipe: default
#

# ensure that the httpd package is installed.
package "python" do
  action :install
end

package "Django" do
  action :install
end

package "python-devel" do
  action :install
end

package "python-pip" do
  action :install
end

package "MySQL-python" do
  action :install
end


bash "pip install MySQL-python" do
  code <<-"EOH"
    pip install MySQL-python
  EOH
end