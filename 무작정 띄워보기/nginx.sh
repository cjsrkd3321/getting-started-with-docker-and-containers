docker run --rm -d -p 8080:80 nginx

curl http://localhost:8080

# 컨테이너들 정보 및 상태 확인
docker ps

# -f = --force, 강제 삭제 옵션
docker rm -f [CONTAINER_ID 또는 CONTAINER_NAME]
