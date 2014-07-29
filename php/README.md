# The PHP Box
To set up the PHP box, go to the root directory of the project and run

    cd php
    vagrant up

The PHP box mounts the src/codeigniter source at the boxes apache docroot. If you couldn't tell from the directory name, we have setup [codeigniter](http://ellislab.com/codeigniter) as the PHP framework. Codeigniter is a very simple MVC framework. After provisioning is complete you should be able to see the Codeigniter application running at [http://localhost:8090/home](http://localhost:8090/home).
### A bit about Codeigniter
If you are unfamiliar with codeigniter it might be worth briefly familiarizing yourself with how it work. Codeigniter is a very simple MVC. A few other things worht highlighting:

* Codeigniter has a built in database abstraction layer and provisioning sets things up so you are ready to start writing queries against the MySQL database (after creating a schema and loading it with data). Read more about the [codeigniter database library](http://ellislab.com/codeigniter/user-guide/database/examples.html)
* Templating in codeigniter is extremely simple but it is still worth taking note on how it is done. Read more about [codeigniter views](http://ellislab.com/codeigniter/user-guide/general/views.html)
