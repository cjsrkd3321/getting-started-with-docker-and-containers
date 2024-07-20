FROM node:18-bullseye-slim

ENV YARN_CACHE_FOLDER=/cache/yarn

WORKDIR /app

# install dependencies
COPY web/package.json web/yarn.lock ./

# 아래 방식을 사용하면, 위 COPY가 변경되더라도
# 전체를 받아오는게 아닌, 일단 캐시된 디렉토리는 그대로 사용하고
# 변경된 부분만 네트워크 요청을 하도록 할 수 있음
RUN --mount=type=cache,target=/cache/yarn \
  yarn install

# copy app source
COPY web/ ./

ENV VITE_HOST=0.0.0.0
ENV VITE_PORT=5173
CMD ["yarn", "dev"]
