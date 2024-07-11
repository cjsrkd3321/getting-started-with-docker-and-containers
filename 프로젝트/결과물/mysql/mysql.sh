docker run -d --name mysql \
    --network service --network-alias mysql \
    -v mysql-volume:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=secret \
    -e MYSQL_DATABASE=todos --restart always \
    --cpus="0.2" --memory="512m" mysql:8.0