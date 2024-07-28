# 꼭 ec2-user로 접근!
ssh -i rex.pem ec2-user@[EC2 PUBLIC DOMAIN]

# docker compose 형태로 명령 실행가능하도록 설정
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
ln -s /usr/local/bin/docker-compose $DOCKER_CONFIG/cli-plugins/docker-compose