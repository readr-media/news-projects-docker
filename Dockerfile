FROM node:9.2.0-alpine

ENV NODE_SOURCE /usr/src/

WORKDIR $NODE_SOURCE

RUN apk update \
        && apk add git \
        && git clone https://github.com/readr-media/news-projects.git \
        && cd news-projects \
        && cp -rf . .. \
        && cd .. \
        && rm -rf news-projects \
        && yarn install \
        && yarn run build

EXPOSE 3000
CMD ["yarn", "start"]