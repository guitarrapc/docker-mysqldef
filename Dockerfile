FROM alpine:3.10 as builder

ENV VERSION 0.5.7
RUN set -ex \
    && apk add --no-cache curl tar \
    && curl -fSL https://github.com/k0kubun/sqldef/releases/download/v$VERSION/mysqldef_linux_amd64.tar.gz -o mysqldef.tar.gz \
    && tar -zxf mysqldef.tar.gz

FROM scratch
COPY --from=builder /mysqldef /usr/local/bin/mysqldef
ENTRYPOINT ["mysqldef"]