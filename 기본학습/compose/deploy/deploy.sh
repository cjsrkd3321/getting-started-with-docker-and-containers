# https://docs.docker.com/compose/compose-file/deploy/

# 항상 빌드 하면서 up 시키기
# 컴포즈는 동일한 이미지 이름이 존재하는 경우, build를 생략함
docker compose up -d --build

# 컴포즈 로그 살펴보기
docker compose logs -f

# 컴포즈에서 띄운 컨테이너 리소스 사용량 보기
docker compose stats

# 컴포즈로 띄운 컨테이너와 네트워크 삭제
docker compose down

# Healthy 상태 될 때까지 기다리기
docker compose up -d --wait