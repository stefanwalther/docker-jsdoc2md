# -------------------------------------------------------------------
#                               BASE NODE
# -------------------------------------------------------------------
FROM node:24-alpine AS base

RUN apk add --no-cache bash

WORKDIR /usr/local/jsdoc2md

COPY ./package.json ./package-lock.json ./

RUN npm ci --omit=dev

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

WORKDIR /opt/jsdoc2md

# -------------------------------------------------------------------
#                                TEST
# -------------------------------------------------------------------
FROM base AS test

COPY ./test /opt/jsdoc2md/test
RUN /opt/jsdoc2md/test/test.sh

# -------------------------------------------------------------------
#                               RELEASE
# -------------------------------------------------------------------
FROM base AS release

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/bin/sh"]
