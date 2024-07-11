docker build -t was .

docker run -d --rm --name was -p 3000:3000 \
    --cpus="0.2" --memory="512m" was