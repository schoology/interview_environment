# The Python Box
To set up the Python box, run `vagrant up` from this directory.

The Python box has [Flask](http://flask.pocoo.org/docs/0.10/) installed on it by default. In the src directory there is a very basic interview.py file which establishes a connection and adds one url that displays a basic template.
### A bit about Flask
Flask is a simple Python framework that helps you create a basic web application. A few things worth highlighting:
* Flask uses a templating framework called [Jinja2](http://jinja.pocoo.org/docs/dev/). You can read more about Jinja2's template inheritance [here](http://flask.pocoo.org/docs/0.10/patterns/templateinheritance/#template-inheritance)
* Included on the back and the interview.py script is [Flask-MySQL](http://flask-mysql.readthedocs.org/en/latest/). The website gives a brief example but there is a more detailed one [here](http://www.techillumination.in/2014/01/python-web-application-development.html)

### Running Flask
You can start the application by ssh'ing into the virtualbox and navigating to the main interview.py python script already prepared for you. Note: Python [virtualenv](http://docs.python-guide.org/en/latest/dev/virtualenvs/) is installed and should be used when working with the interview.py application.

    cd /vagrant/src
    source bin/activate
    python interview.py

You can view the running Flask application on your host machine by browsing to [http://localhost:8091/](http://localhost:8091/)
