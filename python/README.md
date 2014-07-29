# The Python Box
To set up the Python box, run `vagrant up` from this directory.

The Python box has [web.py](http://webpy.org/) installed on it by default. In the src directory there is a very basic interview.py file which establishes a connection and adds one url that displays a basic template.
### A bit about Web.py
web.py is a simple Python framework that helps you create a basic web application. A few things worth highlighting:
* Web.py comes with a templating framework called Templator. You can find the Templator documentation here [http://webpy.org/docs/0.3/templetor](http://webpy.org/docs/0.3/templetor)
* Web.py comes with a database wrapper which you can read more about here [http://webpy.org/docs/0.3/tutorial#databasing](http://webpy.org/docs/0.3/tutorial#databasing). The interview.py file that comes in the repo will take care of establishing the connection to the MySQL server installed on the box.

### Running Web.py
You can start the application by ssh'ing into the virtualbox and navigating to the main python script already prepared for you

    cd /vagrant/src
    python interview.py

You can view the running Web.py application on your host machine by browsing to [http://localhost:8091/](https://localhost:8091/)
