docker run -d -p 8080:80 --name nginx nginx

# 2번 터미널
# 서버 응답 및 관련 정보 모두 출력하지 않음(-s -o /dev/null)
curl -s -o /dev/null http://localhost:8080

# 1초 마다 요청을 보냄
while true; do curl -s -o /dev/null http://localhost:8080; sleep 1; done

# 로그 출력
docker logs nginx

# 타임스탬프와 함께 로그를 보고 싶을 때
docker logs -t nginx

# 로그 출력 계속 보기
docker logs -f nginx

# --since Xs: (현재 시점에서) X초 전 부터
docker logs -f --since 10s nginx

# --until Xs: (현재 시점에서) X초 전 까지 
docker logs --until 10s nginx

# 10초 전 부터(since), 1분 전 까지(until)... 로그 출력되지 않음.
#        until     since
#         <-        ->
# 0분 1분 1분10초 ... 2분 ... 2분10초(현재)
docker logs -f --since 10s --until 1m nginx

# 특정 시간대 로그만 보고 싶을 때
# 2014-09-16T06:17:46.000000000Z 더 세부적으로도 가능
docker logs -f --since=2024-07-11T00:00:00Z --until=2024-07-11T01:30:30Z nginx