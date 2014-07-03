VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "CentOS-6.5-x86_64-puppet-chef"
  config.vm.box_url = "http://279020f5c10bc4f81e01-96f7502f2b1256957419f890585e776c.r12.cf2.rackcdn.com/CentOS-6.5-x86_64-puppet-chef.box"
  config.vm.hostname = "interview-env"
  config.vm.network :forwarded_port, guest: 80, host: 8090 # Apache
  config.vm.network :forwarded_port, guest:8000, host: 8091 # Django

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
  end

  # run with : python manage.py runserver 0.0.0.0:8000;
  config.vm.provision :shell, :inline => "
    if [ ! -d \"/vagrant/src/interview\" ]; then
      cd /vagrant/src/;
      django-admin startproject interview;
    fi"
end