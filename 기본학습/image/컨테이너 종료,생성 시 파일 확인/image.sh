# nginx 컨테이너 생성
docker run --rm -d --name nginx nginx

# 쉘 연결
docker exec -it nginx bash

# rex 파일 생성
touch rex

# 파일 조회
ls rex

# 쉘 종료
exit

# nginx 컨테이너 삭제
docker rm -f nginx

# nginx 컨테이너 재생성
docker run --rm -d --name nginx nginx

# 쉘 연결
docker exec -it nginx bash

# 파일 조회
# 파일 없음
ls rex
