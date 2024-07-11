docker run --rm --name httpd -p 8080:80 \
    -v .:/usr/local/apache2/htdocs/:ro \
    -d httpd:2.4

curl http://localhost:8080

# 로컬 index.html 수정해보기

curl http://localhost:8080

# 컨테이너 내부에서 index.html 수정해보기
docker exec -it httpd bash

# bash: /usr/local/apache2/htdocs/index.html: Read-only file system
# 오류 발생! 왜냐하면 Read-Only(ro) 라서
echo 123 >/usr/local/apache2/htdocs/index.html

docker rm -f httpd
