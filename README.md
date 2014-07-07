# Connecting to MySQL
From the host machine you can connect using the following credentials

* **Host**: 127.0.0.1 (e.g. localhost to your workstation)
* **Port**: 3310 
* **Username**: interview
* **Password**: interview

# Starting Django
To setup Django, run 

	setup_python.sh

This script should be in your path. After setting up Django you can start the server by running

	cd /vagrant/src/python/interview; python manage.py runserver 0.0.0.0:8000

You can view the running Django server at [http://localhost:8091/](http://localhost:8091/). The app at this point has been setup to connect to a mysql database (interview).

# Starting Ruby on Rails
To setup Ruby on Rails, run
    
    setup_ror.sh
    
This script should be in your path. After setup is complete, you can start the server by running

    cd /vagrant/src/ruby/interview; bin/rails server
    
You can view the running Ruby on Rails application at [http://localhost:8092/](http://localhost:8092/). The application is configured to connect to a mysql database (interview).