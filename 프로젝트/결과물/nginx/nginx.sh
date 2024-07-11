docker run -d -p 8080:80 --name nginx \
    --network service --network-alias web \
    -v "$(pwd)"/default.conf:/etc/nginx/conf.d/default.conf \
    --restart always \
    --cpus="0.2" --memory="128m" nginx