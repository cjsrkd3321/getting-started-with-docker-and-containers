docker volume create pg

# -d 옵션이 없다면? foreground로 동작
# windows 사용자의 경우 최상위 폴더의 "[필독] 윈도우 사용자분들께.txt"를 꼭 읽어주세요!
docker run --name pg --rm \
    --memory="512m" --cpus="0.5" \
    -v pg:/var/lib/postgresql/data \
    -e POSTGRES_PASSWORD=rex postgres

# 컨테이너들 정보 및 상태 확인
docker ps

# 컨테이너 내부에 프로세스를 실행(exec)할건데,
# 직접 터미널을 사용하는 것처럼(-it) 설정해서,
# bash를 실행해줘
docker exec -it pg bash

psql -U postgres

exit

exit

# 컨테이너들 자원 사용량 확인
docker stats

# 볼륨이 이미 사용중이어서 삭제 불가
docker volume rm pg

docker rm -f pg

docker volume rm pg
