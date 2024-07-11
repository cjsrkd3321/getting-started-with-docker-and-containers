# 현재경로(.)를 기준으로 Dockerfile에 명시된 명렁을 실행해 web 이라는 이름의 이미지 생성
docker build -t web .

# node:22 이미지를 활용해 빌드
docker build -t web:node22 --build-arg IMAGE_VERSION=22 .

##### docker run entrypoint, cmd 값 덮어씌우기 #####
docker run --rm web help # npm help
docker run --rm -it --entrypoint sh web # sh

docker run -d --rm -p 8080:5000 --name web web

# EXPOSE 사용 시(포트 동적 매핑)
docker run -d --rm -P --name web22 web:node22

# docker image ls와 동일
docker images

# 컨테이너 목록 보기
docker ps

# 앱 정상 동작 테스트
curl http://localhost:8080

# 현재 동작중인 컨테이너의 환경 변수 확인
docker exec web env

# 컨테이너 이미지 삭제하면서 익명 볼륨도 같이 삭제
docker rm -f -v web web22

########## 캐시 효율화 이후 ##########
docker build -t web -f Dockerfile.new .; docker run --rm -it web
