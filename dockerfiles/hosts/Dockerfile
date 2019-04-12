FROM alpine:3.4

RUN apk add --no-cache bash

COPY entry.sh /entry.sh
RUN chmod a+x /entry.sh

ARG IPV4ADDRESS=192.168.0
ARG PROJECTNAME=localhost
ARG TLD=dev

ENV IPV4ADDRESS ${IPV4ADDRESS}
ENV PROJECTNAME ${PROJECTNAME}
ENV TLD ${TLD}

ENTRYPOINT ["/entry.sh"]