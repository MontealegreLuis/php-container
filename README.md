# Docker container for PHP

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
