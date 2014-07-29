# Prerequisites
1. Ensure your host computer has the following minimum specifications:
   * __Memory:__ 4Gb
   * __CPUs:__ 4vCPUs

2. First, download and install [Virtualbox](https://www.virtualbox.org/) which is the default virtualization technology used by vagrant.

3. Next, download and install [vagrant](http://www.vagrantup.com/) which should be considered a driver, or front-end for various virtualization technologies (e.g. Virtualbox).

4. Once vagrant and virtaulbox are installed, open up a command line and execute the following (note: In windows you should make sure vagrant is in your PATH environment variable).
        
         vagrant plugin install vagrant-omnibus
         vagrant plugin install vagrant-vbguest

   Installing the vagrant-vbguest plugin is necessary to ensure that vagrant checks that the version of VirtualBox Guest       Additions installed on the guest operating system matches the version of VirtualBox being used to run the virtual       machine. In cases where the VirtualBox Guest Addtions version does not match the version of VirtualBox, you may see vagrant report errors or have trouble providing basic functionality such as networking or mapping of shared drives.

5. Finally, clone the repo and checkout any submodules

         git submodule init
         git submodule update

# Vagrant Overview

[Vagrant](http://www.vagrantup.com/) is a tool to programmatically manipulate and provision virtualboxes.

To start the Virtualbox and run any provisioning run

      vagrant up

 
To simply provision an already running box run

      vagrant provision
    
To get a shell connection within the virtualbox run 

      vagrant ssh
      
**Note** - if you are running this on a Windows machine you will not have ssh available to you. You can use a client like [PuTTY](http://www.putty.org/) to connect to the box. The connection credentials for the client will look like:

* **Host**: 127.0.0.1
* **Port**: 2222
* **Username**: vagrant
* **Password**: vagrant

# Project Overview

In order to effectively assess applicants in a variety of languages, we needed a fast way to setup technology stacks ready to be developed on. This project aims to do just that. There are three directories each containing a Vagrantfile that will provision a box ready to be developed on in that language.

# Connecting to MySQL
Each flavor of virtualbox has MySQL installed. To connect from the host machine you can connect using the following credentials

* **Host**: 127.0.0.1 (e.g. localhost to your workstation)
* **Port**: 3310 
* **Username**: interview
* **Password**: interview

# Available Environment's

Each directory (except cookbooks) has a seperate Vagrantfile that sets up a virtualbox with a stack specific to that language.

* [The PHP Box](php/README.md)
* [The Ruby Box](ruby/README.md)
* [The Python Box](python/README.md)
 
