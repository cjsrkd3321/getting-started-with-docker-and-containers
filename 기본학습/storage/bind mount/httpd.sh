# 가능 (ro)
docker run --rm --name httpd -p 8080:80 \
    -v .:/usr/local/apache2/htdocs/:ro \
    -d httpd:2.4

docker exec -it httpd ls /usr/local/apache2/htdocs
curl http://localhost:8080
docker rm -f httpd

# 가능 (rw)
docker run --rm --name httpd -p 8080:80 \
    -v "$(pwd)"/index.html:/usr/local/apache2/htdocs/index.html:rw \
    -d httpd:2.4

# 실습 전 로컬 index.html 파일 내용 복사
docker exec -it httpd ls /usr/local/apache2/htdocs
docker exec -it httpd sh -c "echo rex > /usr/local/apache2/htdocs/index.html"
curl http://localhost:8080
docker rm -f httpd

# 불가능
docker run --rm --name httpd -p 8080:80 \
    -v "$(pwd)"/index.html:/usr/local/apache2/htdocs/ \
    -d httpd:2.4