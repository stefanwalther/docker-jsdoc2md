# -------------------------------------------------------------------
#                               BASE NODE
# Todo: The user should be changed
# Todo: Update to newest images
# -------------------------------------------------------------------
FROM node:8.17.0-alpine as BASE

RUN apk update
RUN apk add bash

WORKDIR /opt/jsdoc2md

COPY ./package.json .

#RUN npm install -s -g babel-core babel-plugin-transform-async-to-generator babel-preset-es2015 jsdoc-babel jsdoc-to-markdown
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
# Todo: to reduce the size, we could work from alpine again
#   optionally we could just uninstall bash
# -------------------------------------------------------------------
FROM BASE as RELEASE

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/bin/sh"]
