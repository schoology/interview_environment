# Prerequisites
1. Ensure your host computer has the following minimum specifications:

    * __Memory:__ 4Gb
    * __CPUs:__ 4vCPUs

2. First, download and install [Virtualbox](https://www.virtualbox.org/) which is the default virtualization technology used by vagrant.

3. Next, download and install [vagrant](http://www.vagrantup.com/) which should be considered a driver, or front-end for various virtualization technologies (e.g. Virtualbox).

4. Once vagrant and virtaulbox are installed, open up a command line and execute the following (note: In windows you should make sure vagrant is in your PATH environment variable).
        
        vagrant plugin install vagrant-omnibus
        vagrant plugin install vagrant-vbguest

Installing the vagrant-vbguest plugin is necessary to ensure that vagrant checks that the version of VirtualBox Guest Additions installed on the guest operating system matches the version of VirtualBox being used to run the virtual machine. In cases where the VirtualBox Guest Addtions version does not match the version of VirtualBox, you may see vagrant report errors or have trouble providing basic functionality such as networking or mapping of shared drives.

# Setup

The Vagrant provisioner script uses a contributed cookbook called [chef-rvm](https://github.com/fnichol/chef-rvm). Before starting and provisioning the guest virtualbox make sure the git submodule is included. To do this run

	git submodule init
	git submodule update 

After doing this move into the directory of the environment you would like to use (php, ruby, python) - this is where the Vagrantfiles are.

To start the Virtualbox and run any provisioning run

    vagrant up

 
To simply provision an already running box run

    vagrant provision
    
To get a shell connection within the virtualbox run 

    vagrant ssh

# Connecting to MySQL
From the host machine you can connect using the following credentials

* **Host**: 127.0.0.1 (e.g. localhost to your workstation)
* **Port**: 3310 
* **Username**: interview
* **Password**: interview

# Starting Django
To setup Django, run the following within the virtualbox

	setup_python.sh

This script should be in your path. After setting up Django you can start the server by running

	cd /vagrant/src/python/interview; python manage.py runserver 0.0.0.0:8000

You can view the running Django server at [http://localhost:8091/](http://localhost:8091/). The app at this point has been setup to connect to a mysql database (interview).

# Starting Ruby on Rails
To setup Ruby on Rails, run the following within the virtualbox
    
    setup_ror.sh
    
This script should be in your path. After setup is complete, you can start the server by running

    cd /vagrant/src/ruby/interview; bin/rails server
    
You can view the running Ruby on Rails application at [http://localhost:8092/](http://localhost:8092/). The application is configured to connect to a mysql database (interview).