function heading {
echo '================================================================'
echo " > $@"
echo '================================================================'
}

# make sure we are on mac
if [ "$(uname -s)" != "Darwin" ]; then
    echo 'This script is for Mac users only.'
    exit
fi

# make sure brew is installed
if [ -z "$(which brew)" ]; then
    echo 'You must have brew installed to use this script.'
    exit
fi

# the Makefile relies on the envsubst command, but it is not installed by
# default on mac, so we will install it with brew
heading 'installing command line utils...'
echo 'we are going to install some command line utilities necessary for our docker setup'
echo 'if you already have these installed, expect to see a warning from brew telling you such'
brew install gettext
# add to PATH
brew link --force gettext

# install docker
heading 'installing docker...'
brew install docker

# download docker-compose and docker-machine binaries
heading 'installing docker-compose...'
curl -L https://github.com/docker/machine/releases/download/v0.7.0/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine
heading 'installing docker-machine...'
curl -L https://github.com/docker/compose/releases/download/1.7.1/run.sh > /usr/local/bin/docker-compose
# make them executable
echo 'making docker-compose and docker-machine executable...'
chmod +x /usr/local/bin/docker-{compose,machine}

heading 'create default docker machine...'
docker-machine create --driver virtualbox default

# copy env file
heading 'copy .env file...'
cp .env.example .env.sh

heading 'all done!'
echo 
echo 'now run this command to import the necessary env vars'
echo '    eval "$(docker-machine env default)"'
echo 'and then run'
echo '    make'
