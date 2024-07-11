##### 원래 삭제 과정 #####
docker run -d --name nginx nginx

# jq는 별도 설치 필요
docker inspect nginx --format '{{json .State}}' | jq

docker stop nginx

# running 상태가 아닌 컨테이너 목록도 보여줌
docker ps -a

docker rm nginx

##### --rm 사용 시 #####
docker run --rm -d --name nginx nginx

docker stop nginx

docker ps -a

##### rm -f #####
docker run -d --name nginx nginx

# stop 과정 없이 강제로 삭제
docker rm -f nginx

docker ps -a

##### docker run --rm 효과적으로 사용하려면 #####
# 쉘 종료하면 컨테이너 완전 삭제됨
docker run --rm -it busybox sh