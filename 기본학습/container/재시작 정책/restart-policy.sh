# 재시작 정책은 --rm과 같이 사용 불가 (--restart no 제외)

# 2번 터미널
docker stats

# 항상 재시작
# 다만, 수동으로 중지된 경우 도커 데몬이 재시작되거나 컨테이너 자체가 재시작될 때만 재시작됨.
docker run -d --name bb --restart always busybox sleep 1

docker rm -f bb

# exit 0 이 아닌 경우 재시작
docker run -d --name bb --restart on-failure busybox sleep 5

docker rm -f bb

# 최대 재시작 횟수 설정 가능
docker run -d --name bb --restart on-failure:2 busybox sh -c 'sleep 1; exit 1'

docker rm -f bb

# always와 비슷하나, 
# 도커 데몬이 다시 시작되더라도 재시작 되지 않음.
docker run -d --name bb --restart unless-stopped busybox sleep 2

docker rm -f $(docker ps -a -q)