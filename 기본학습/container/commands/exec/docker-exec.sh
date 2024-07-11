# 무한히 sleep 상태
docker run -d --name busybox busybox sleep infinite

docker exec -it busybox sh

# 실제로 sh 프로세스가 하나 추가되어 있음
ps

exit

docker exec busybox ps

docker rm -f busybox