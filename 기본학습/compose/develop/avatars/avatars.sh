# https://docs.docker.com/compose/multiple-compose-files/
# https://docs.docker.com/compose/compose-file/develop/

# 앱 로그 확인 없이, watch의 결과만 보고 싶은 경우(빌드 로그 나옴)
docker compose watch [SERVICE]

# 앱 로그 확인하면서 watch 하려는 경우(빌드 로그 안나옴)
docker compose up --watch [SERVICE]