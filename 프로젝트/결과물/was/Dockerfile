FROM node:22-alpine

WORKDIR /usr/src/app

# 패키지 캐시 되도록 변경
COPY package.json ./
RUN yarn install
COPY . .

EXPOSE 3000

ENTRYPOINT [ "yarn" ]
CMD ["start"]