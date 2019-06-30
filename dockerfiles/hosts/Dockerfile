FROM alpine:3.4

RUN apk add --no-cache bash

COPY entry.sh /entry.sh
RUN chmod a+x /entry.sh

ENTRYPOINT ["/entry.sh"]