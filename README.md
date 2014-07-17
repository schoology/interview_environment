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

# Vagrant Overview

[Vagrant](http://www.vagrantup.com/) is a tool to programmatically manipulate and provision virtualboxes.

To start the Virtualbox and run any provisioning run

    vagrant up

 
To simply provision an already running box run

    vagrant provision
    
To get a shell connection within the virtualbox run 

    vagrant ssh

# Project Overview

In order to effectively assess applicants in a variety of languages, we needed a fast way to setup technology stacks ready to be developed on. This project aims to do just that. There are three directories each containing a Vagrantfile that will provision a box ready to be developed on in that language.

# Connecting to MySQL
Each flavor of virtualbox has MySQL installed. To connect from the host machine you can connect using the following credentials

* **Host**: 127.0.0.1 (e.g. localhost to your workstation)
* **Port**: 3310 
* **Username**: interview
* **Password**: interview

# The PHP Box
To set up the PHP box, go to the root directory of the project and run

    cd php
    vagrant up

The PHP box mounts the src/codeigniter source at the boxes apache docroot. If you couldn't tell from the directory name, we have setup [codeigniter](http://ellislab.com/codeigniter) as the PHP framework. Codeigniter is a very simple MVC framework. After provisioning is complete you should be able to see the Codeigniter application running at [http://localhost:8090/home](http://localhost:8090/home).
### A bit about Codeigniter
If you are unfamiliar with codeigniter it might be worth briefly familiarizing yourself with how it work. Codeigniter is a very simple MVC. A few other things worht highlighting:

* Codeigniter has a built in database abstraction layer and provisioning sets things up so you are ready to start writing queries against the MySQL database (after creating a schema and loading it with data). Read more about the [codeigniter database library](http://ellislab.com/codeigniter/user-guide/database/examples.html)
* Templating in codeigniter is extremely simple but it is still worth taking note on how it is done. Read more about [codeigniter views](http://ellislab.com/codeigniter/user-guide/general/views.html)
