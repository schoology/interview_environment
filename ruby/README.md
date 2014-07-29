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

### Running Sinatra
You can start the application by ssh'ing into the virtualbox and navigating to the main ruby script already prepared for you

    cd /vagrant/src
    ruby interview.rb

You can view the running Sinatra application on your host machine by browsing to [http://localhost:8092/](https://localhost:8092/)
