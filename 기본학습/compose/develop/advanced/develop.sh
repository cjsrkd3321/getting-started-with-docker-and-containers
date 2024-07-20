# https://docs.docker.com/compose/multiple-compose-files/
# https://docs.docker.com/compose/compose-file/develop/

# 앱 로그 확인 없이, watch의 결과만 보고 싶은 경우(빌드 로그 나옴)
docker compose -f compose.yaml -f dev.compose.yaml watch [SERVICE]

# 앱 로그 확인하면서 watch 하려는 경우(빌드 로그 안나옴)
docker compose -f compose.yaml -f dev.compose.yaml up --watch [SERVICE]

# 항상 빌드 하면서 up 시키기
# 컴포즈는 동일한 이미지 이름이 존재하는 경우, build를 생략함
docker compose -f compose.yaml -f dev.compose.yaml up -d --build

# 개발 환경 띄울 때
docker compose -f compose.yaml -f dev.compose.yaml up --watch

# 운영 환경 가정하여 띄울 때
docker compose -f compose.yaml -f prod.compose.yaml up -d