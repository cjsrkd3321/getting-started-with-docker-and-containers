docker run --name pg --rm -e POSTGRES_PASSWORD=rex postgres

docker volume ls

docker volume inspect [VOLUME_NAME]

# Anonymous Volume은 -v 옵션을 붙이면 같이 삭제됨
docker rm -f -v pg
