docker build -t multistage -f Dockerfile.multistage .

docker run -p 8080:8080 --rm --name multistage multistage

# debug 이미지 활용 시
docker exec -it multistage sh
docker exec -it --user root multistage sh