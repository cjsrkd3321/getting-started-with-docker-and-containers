# 1번 터미널
docker run --rm -it --name b1 busybox sh

# 2번 터미널
docker run --rm -it --name b2 busybox sh

# 각 터미널에서 입력
ifconfig eth0

ping b1
ping b2

ping [b1 IP]
ping [b2 IP]

# 컨테이너 종료
exit

######### --link 사용해보기 #########
# 1번 터미널
docker run --rm -it --name b1 busybox sh

# 2번 터미널
docker run --rm -it --name b2 --link b1 busybox sh

ping b1
ping b2

exit