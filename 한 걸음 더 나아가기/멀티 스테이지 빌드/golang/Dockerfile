FROM golang:1.19

# 작업 디렉토리 지정
WORKDIR /app

# Go 모듈 다운로드
COPY go.mod go.sum ./
RUN go mod download

# .go 파일만 복사
COPY *.go ./

# Build
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-gs-ping

EXPOSE 8080

# Run
CMD [ "/docker-gs-ping" ]