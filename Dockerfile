# -------------------------------------------------------------------
#                               BASE NODE
# -------------------------------------------------------------------
FROM node:8.5.0-alpine as BASE

RUN apk update
RUN apk add bash

WORKDIR /opt/jsdoc2md

COPY ./package.json .

RUN npm install -s

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

COPY ./jsdoc.json $WORKDIR

# -------------------------------------------------------------------
#                                TEST
# -------------------------------------------------------------------
FROM BASE as TEST

WORKDIR /opt/jsdoc2md

RUN mkdir /opt/jsdoc2md/test
COPY ./test /opt/jsdoc2md/test
RUN /opt/jsdoc2md/test/test.sh

# -------------------------------------------------------------------
#                               RELEASE
# -------------------------------------------------------------------
FROM BASE as RELEASE

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/bin/sh"]
