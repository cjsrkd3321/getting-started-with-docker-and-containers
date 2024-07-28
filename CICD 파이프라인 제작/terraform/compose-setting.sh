DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
ln -s /usr/local/bin/docker-compose $DOCKER_CONFIG/cli-plugins/docker-compose