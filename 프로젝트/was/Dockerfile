FROM node:22-alpine

WORKDIR /usr/src/app
COPY . .
RUN yarn install

ENTRYPOINT [ "yarn" ]
CMD ["start"]