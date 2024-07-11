# docker run --rm -d -p 1111:5000 --name registry-srv \
#   -e REGISTRY_HTTP_HEADERS_Access-Control-Allow-Origin="['*']" \
#   -e REGISTRY_HTTP_HEADERS_Access-Control-Expose-Headers="[Docker-Content-Digest]" \
#   -e REGISTRY_HTTP_HEADERS_Access-Control-Allow-Methods="[HEAD,GET,OPTIONS,DELETE]" \
#   -e REGISTRY_HTTP_HEADERS_Access-Control-Allow-Headers="[Authorization,Accept,Cache-Control]" registry

# 위 명령과 동일
docker run -d -p 1111:5000 --name registry-srv \
  --env-file .env.dev registry

# 레포지토리 목록 보기
curl http://localhost:1111/v2/_catalog

docker run --rm -d -p 8080:80 --name registry-ui \
  -e REGISTRY_URL=http://localhost:1111 \
  -e SINGLE_REGISTRY=true joxit/docker-registry-ui

# 컨테이너 현황
docker ps

# 이미지 현황
docker images

# private registry 푸시하기 위해 이름 변경
docker tag registry localhost:1111/registry:v0.0.1
# private registry 푸시
docker push localhost:1111/registry:v0.0.1
# 로컬로 가져오기(이미 존재해서 바로 종료됨)
docker pull localhost:1111/registry:v0.0.1

########## 이미지를 제외한 초기화 명령어 ##########
# 모든 컨테이너 삭제
docker rm -f $(docker ps -a -q)

# 모든 볼륨 삭제
docker volume rm -f $(docker volume ls -q)

# 기본 네트워크 제외한 커스텀 네트워크 삭제
docker network rm -f $(docker network ls -q)

# 빌드 과정 중 발생한 모든 캐시 삭제
docker builder prune -a -f

# Images를 제외하고 모두 0으로 나오면 초기화 완료
docker system df
