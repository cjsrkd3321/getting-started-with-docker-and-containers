docker build -t was .

# 외부 포트 노출 제거
# DB 연동
# 커스텀 네트워크 추가
# 수평 확장 고려하여 --network-alias 추가
# 재시작 정책 추가
docker run -d --name was1 \
    -e MYSQL_HOST=mysql \
    -e MYSQL_USER=root \
    -e MYSQL_PASSWORD=secret \
    -e MYSQL_DB=todos \
    --network service --network-alias was \
    --restart always \
    --cpus="0.2" --memory="512m" was

##### was 컨테이너 추가할 때, 아래 명령도 같이 입력 #####
docker run -d --name was2 \
    -e MYSQL_HOST=mysql \
    -e MYSQL_USER=root \
    -e MYSQL_PASSWORD=secret \
    -e MYSQL_DB=todos \
    --network service --network-alias was \
    --restart always \
    --cpus="0.2" --memory="512m" was

docker exec nginx nginx -s reload