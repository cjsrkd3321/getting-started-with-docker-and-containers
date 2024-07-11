# sqlite를 활용해 개발 환경 구성
docker run --rm -it -p 3000:3000 --name todo \
    -w /app -v "$(pwd)":/app node:22-alpine \
    sh -c "yarn install && yarn run dev"

########## mysql 컨테이너를 활용한 데이터 영구 저장 환경 구성 ##########
docker network create todo

# 볼륨 자동 생성
docker run -d --name mysql \
    --network todo --network-alias mysql \
    -v mysql-volume:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=secret \
    -e MYSQL_DATABASE=todos \
    mysql:8.0

# 비밀번호 입력하여 인증
docker exec -it mysql mysql -u root -p

# todos 확인
show databases;

exit

# app 연동
docker run --rm -it -p 3000:3000 --name todo \
    --network todo \
    -e MYSQL_HOST=mysql \
    -e MYSQL_USER=root \
    -e MYSQL_PASSWORD=secret \
    -e MYSQL_DB=todos \
    -w /app -v "$(pwd)":/app node:22-alpine \
    sh -c "yarn install && yarn run dev"

docker rm -f mysql

docker volume rm -f mysql-volume

docker network rm -f todo