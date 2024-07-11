docker network create run

# --rm: 컨테이너 종료 시 완전 삭제 (로그도 같이 삭제되므로 운영에선 조심)
# -it: 사용자에게 표준입력 제공(-i), 터미널 형태 제공(-t)
# --name: 컨테이너에 이름 부여
# --network: 커스텀 네트워크 사용
# -v: 바인드 마운트(설정에 따라 다름)
docker run --rm -it -p 8080:80 \
    --name httpd --network run \
    -v "$(pwd)"/index.html:/usr/local/apache2/htdocs/index.html:ro \
    httpd:2.4

# https://hub.docker.com/r/amazon/aws-cli
# alias aws='docker run --rm -v ~/.aws/credentials:/root/.aws/credentials amazon/aws-cli'
# 위와 같이 등록하여 활용도 가능
docker run --rm -v ~/.aws/credentials:/root/.aws/credentials \
    amazon/aws-cli ec2 describe-instances --region ap-northeast-2

# 별도의 AWS 관련 설정 없으신 분들은 아래 명령어로 진행
docker run --rm amazon/aws-cli --version

# entrypoin 수정 가능
docker run --rm -it --entrypoint sh amazon/aws-cli

docker network rm -f run