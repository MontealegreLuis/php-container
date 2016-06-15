# Docker container for PHP projects

[![license](https://img.shields.io/github/license/mashape/apistatus.svg?maxAge=2592000)]()

Try your PHP + MySQL projects using Docker containers.

## Configuration

The PHP container will have a user and a group matching your current username,
user ID and group ID. You can set the password for MySQL's root user, the
container's hostname, and the prefix to be used for the images and containers.
Modify the `.env.example` file if you want to adjust those settings.

```bash
# This is the hostname for the PHP container
export CONTAINER_HOSTNAME=your_custom_container_hostname
export CONTAINERS_PREFIX=your_custom_prefix
# You'll get 3 images: your_custom_prefix/dev, your_custom_prefix/db, and your_custom_prefix/data
# And 3 containers: your_custom_prefix_dev, your_custom_prefix_db and your_custom_prefix_data
# This is the password for MySQL's root user
export DB_ROOT_PASSWORD=your_custom_mysql_password
```

## Installation

To setup the containers, run the following command, if you want to use the
default settings:

```bash
$ cp .env.example .env.sh && make install
```

If you created a custom .env.sh from the .env.example file.

```bash
$ make install
```

## Usage

To start working with the container, run the following command:

```bash
$ docker-compose run --rm --service-ports web bash
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

You can browse your site at [http://localhost/][1]. Press CTRL+C to stop your
application from the container.

## Accessing your MySQL server

If you want to query your database, run the following command (MySQL's container
should be running):

```bash
$ docker exec -it <your_db_container_name_here> bash
```

From there you can run `mysql -u root -p`, the password for this user is in the
`.env.sh` file. Or you can login with any other user created from the PHP
container.

[1]: http://localhost/
