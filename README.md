# Docker container for PHP projects

[![license](https://img.shields.io/github/license/mashape/apistatus.svg?maxAge=2592000)]()

Try your PHP + MySQL projects using Docker containers.

## Installation

### For Mac users

Run the `mac-setup.sh` script and follow the instructions when it finishes running.

```bash
bash mac-setup.sh
```

### Linux

To setup the containers, run the following command:

```bash
$ cp .env.example .env.sh && make install
```

## Usage

To start a `bash` session in the container, run the following command:

```bash
$ docker-compose run --rm --service-ports web bash
```

From your container you can use the following command to create a database:

```bash
$ database
```

You will need to provide, a database name, a user and a password. You will be
able to use MySQL's client from the container using the following command:

```bash
$ mysql -u root -h db -p
```

The password for the `root` user is in the `.env.sh` file. Or you can login with
any other user created from the container.

## Adding PHP projects

Your projects are meant to be cloned inside the `sites` folder. This container
uses PHP's built-in server to run your applications. You can start the server
from your public folder. You can also provide the path to your public folder
from the command line.

```bash
$ server
$ server -t path/to/public/folder
```

You can browse your site at [http://localhost/][1]. To stop your application,
Press CTRL+C from the container.

Mac users need to use the VM's IP (`192.168.99.101` for instance).

### Configuration

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

If you create a custom .env.sh from the .env.example file. You only need to run
this command to install the container:

```bash
$ make install
```

[1]: http://localhost/
[2]: https://docs.docker.com/engine/installation/mac/
[3]: https://www.gnu.org/software/gettext/manual/html_node/envsubst-Invocation.html
