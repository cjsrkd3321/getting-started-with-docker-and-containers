# 모든 컨테이너 삭제
# -q: ID들만 간단하게 출력
docker rm -f $(docker ps -a -q)

# 모든 이미지 삭제
# -q: ID들만 간단하게 출력
docker rmi -f $(docker images -q)

# 모든 볼륨 삭제
# -q: ID들만 간단하게 출력
docker volume rm -f $(docker volume ls -q)

# 기본 네트워크 제외한 커스텀 네트워크 삭제
# -q: ID들만 간단하게 출력
docker network rm -f $(docker network ls -q)

# 빌드 과정 중 발생한 모든 캐시 삭제
# -a(--all), -f(--force)
docker builder prune -a -f

# 모두 0으로 나오면 초기화 완료
docker system df
