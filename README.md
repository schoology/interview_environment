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

# The Ruby Box
To set up the Ruby box, go to the root directory of the project and run

    cd ruby
    vagrant up

The Ruby box has [Sinatra](http://www.sinatrarb.com/) installed on it by default. In the src directory there is a very basic interview.rb file which establishes a connection and adds one route that displays a basic template.
### A bit about Sinatra
Sinatra is an extremely simple framework that helps you create a basic web application. A few things worth highlighting:
* It will be important to understand the templating used in the application in order to build UI's. Out of the box, this Sinatra install uses [erubis](http://www.kuwata-lab.com/erubis/) templating which comes with Ruby. If you feel comfortable with a different templating feel free to plug it in.
* Ruby has [MySQL/Ruby](http://www.tmtm.org/en/mysql/ruby/) installed out of the box
* The box also has activerecord installed

# The Python Box
To set up the Python box, go to the root directory of the project and run

    cd python
    vagrant up

The Python box has [web.py](http://webpy.org/) installed on it by default. In the src directory there is a very basic interview.py file which establishes a connection and adds one url that displays a basic template.
### A bit about Web.py
web.py is a simple Python framework that helps you create a basic web application. A few things worth highlighting:
* Web.py comes with a templating framework called Templator. You can find the Templator documentation here [http://webpy.org/docs/0.3/templetor](http://webpy.org/docs/0.3/templetor)
* Web.py comes with a database wrapper which you can read more about here [http://webpy.org/docs/0.3/tutorial#databasing](http://webpy.org/docs/0.3/tutorial#databasing). The interview.py file that comes in the repo will take care of establishing the connection to the MySQL server installed on the box.


