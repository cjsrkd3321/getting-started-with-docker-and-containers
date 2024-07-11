# 8080 포트 사용중인 컨테이너 없는지 확인
docker ps

# 현재경로(.)를 기준으로 Dockerfile에 명시된 명렁을 실행해 web 이라는 이름의 이미지 생성
docker build -t web .

# docker image ls와 동일
docker images

docker run -d --rm -p 8080:5000 --name web web

docker rm -f web

# 재밌는 장난 해보기
# --rm 옵션이 없으면 컨테이너가 끝까지 삭제되지 않음
docker run -p 8080:5000 --memory="10m" --name web web

# 실행 중인(running) 컨테이너 목록에 보이지 않음
docker ps

# 모든 상태를 보여주는(-a) 목록에 보임
docker ps -a

# 컨테이너에 대한 자세한(inspect) 정보 보기
docker inspect web

docker rm -f web
