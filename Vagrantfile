VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "CentOS-6.5-x86_64-puppet-chef"
  config.vm.box_url = "http://279020f5c10bc4f81e01-96f7502f2b1256957419f890585e776c.r12.cf2.rackcdn.com/CentOS-6.5-x86_64-puppet-chef.box"
  config.vm.hostname = "interview-env"
  config.vm.network :forwarded_port, guest: 80, host: 8090 # Apache
  config.vm.network :forwarded_port, guest:8000, host: 8091 # Django
  config.vm.network :forwarded_port, guest:3000, host: 8092 # RoR
  config.vm.network :forwarded_port, guest:3306, host: 3310 # MySQL

  config.vm.provider :virtualbox do |vb|
  	vb.customize ["modifyvm", :id, "--memory", "2048"]
  	vb.customize ["modifyvm", :id, "--ioapic", "on"]
  	vb.customize ["modifyvm", :id, "--cpus", "4"]
  end

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "basics"
    chef.add_recipe "apache2"
    chef.add_recipe "mysql"
    chef.add_recipe "django"
    chef.add_recipe "rvm::system"
    chef.add_recipe "rvm::vagrant"
    chef.add_recipe "rails"

    chef.json = {
      'rvm' => {
         'rubies' => ["ruby-2.1.2", "ruby-1.9.3-p327"],
         'default_ruby' => "ruby-2.1.2",
         :vagrant => { :system_chef_solo => "/opt/chef/bin/chef-solo" }
      }
    }

  end

  # Place any scripts in the path
  config.vm.provision :shell, :inline => "
    sudo ln -s /vagrant/scripts/* /usr/local/bin/"
end