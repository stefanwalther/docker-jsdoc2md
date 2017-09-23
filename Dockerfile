# -------------------------------------------------------------------
#                               BASE NODE
# -------------------------------------------------------------------
FROM node:8.4.0 as BASE

WORKDIR /opt/jsdoc2md

RUN npm install -g jsdoc-to-markdown

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# -------------------------------------------------------------------
#                                TEST
# -------------------------------------------------------------------

FROM BASE as TEST

RUN mkdir /opt/jsdoc2md/test
COPY ./test /opt/jsdoc2md/test
RUN ./test/test.sh

# -------------------------------------------------------------------
#                               RELEASE
# -------------------------------------------------------------------
FROM BASE as RELEASE

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/bin/sh"]
