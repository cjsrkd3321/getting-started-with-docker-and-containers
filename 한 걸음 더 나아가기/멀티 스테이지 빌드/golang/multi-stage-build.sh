# 각각의 이미지가 빌드되고, 결국 release-stage만 최종 이미지가 됨
# build-stage / run-test-stage / release-stage

docker build -t no-multistage .

docker run --rm -p 8080:8080 no-multistage

docker build -t test -f Dockerfile.multistage --no-cache --progress plain --target run-test-stage .

docker build -t multistage -f Dockerfile.multistage .

docker run -p 8080:8080 --rm multistage