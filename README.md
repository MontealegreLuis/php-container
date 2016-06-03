# Docker container for PHP

Container to setup a development environment for projects using PHP and MySQL.

## Installation

To setup the containers, run the following command:

```bash
$ export CODEUP_USER=`id -u $USER` && export CODEUP_GROUP=`id -g $USER` && make install
```

## Usage

To start working with the container, run the following command:

```bash
$ docker-compose run --rm -p 8000:8000 web bash
```

Inside your container you can use the following command to create a database:

```bash
$ database
```

You will need to provide, a database name, a user and a password.

## Adding PHP projects

Your projects are meant to be cloned inside the `sites` folder. This container
uses PHP's built-in server to run your applications. You can start the server
from your public folder. You can also provide the path to your public folder
from the command line.

```bash
$ server
$ server -t path/to/public/folder
```

## Accessing your MySQL server

If you want to query your database, run the following command (MySQL's container
should be running):

```bash
$ docker exec -it codeup_db bash
```

From there you can run `mysql -u root -p`, the password for this user is
`codeup`. Or you can login with any other user created from the PHP container.
