##### 기존에 배운 명령어로 실행하면, #####
docker network create service
docker run -d --network service --network-alias redis redis:alpine
docker build -t web .
docker run -p 8000:5000 -d --network service --stop-signal=SIGINT --network-alias web web
docker rm -f $(docker ps -a -q)
docker network rm -f $(docker network ls -q)
##### 매우 행복해질 수 있음 #####

--------------------------------------------------

docker compose --help

# compose.yaml 서비스에 build가 존재하는 모든 것들 빌드 진행
docker compose build

# 서비스 및 네트워크 생성
docker compose up

# 서비스 및 네트워크 삭제
docker compose down

# 서비스 및 네트워크 생성(백그라운드)
docker compose up -d

# 컴포즈 프로젝트 현황(서비스는 프로젝트의 하위)
docker compose ls

# 항상 빌드 하면서 up 시키기
# 컴포즈는 동일한 이미지 이름이 존재하는 경우, build를 생략함
docker compose up -d --build

docker compose logs -h

docker compose logs -f

docker compose down

##### 폴더명이 한글인 경우 #####
# 프로젝트명 지정할 수 있으나, 불편함.
docker compose -p rex up -d

docker compose -p rex down