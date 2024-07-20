docker compose up -d

docker compose logs

# docker rm -v 와 달리 named volume도 삭제됨.
docker compose down -v

##### scaling 적용해보기 #####
docker compose up --no-deps -d was --build
docker compose scale was=10
docker compose exec web nginx -s reload

##### 배포 형상 적용 후 #####
# 개발
docker compose -f compose.yaml -f deploy/dev.compose.yaml up --watch
docker compose -f compose.yaml -f deploy/dev.compose.yaml watch

# 운영
docker compose -f compose.yaml -f deploy/prod.compose.yaml up -d

# healthcheck:
#   test: ["CMD", "mysqladmin", "ping", "-h", "localhost"]
#   interval: 5s
#   retries: 10

# depends_on:
#   db:
#     condition: service_healthy
#     restart: false