FROM node:lts-alpine

RUN apk --no-cache add bash python3

ENV RUN_MODE=docker

COPY . /root/datahub

WORKDIR /root/datahub

RUN npm i --production --verbose

ENTRYPOINT ["./entrypoint.sh"]

ENV ENABLE_JAVASCRIPT=Y \
    ENABLE_REQUEST_PROXY=Y

CMD ["npm", "start:railway"]
