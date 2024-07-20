# https://docs.docker.com/compose/compose-file/build/

# compose.yaml 서비스에 build가 존재하는 모든 것들 빌드 진행
docker compose build

# 항상 빌드 하면서 up 시키기
# 컴포즈는 동일한 이미지 이름이 존재하는 경우, build를 생략함
docker compose up -d --build