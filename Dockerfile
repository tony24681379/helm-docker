FROM alpine:3.5

RUN apk add --update --no-cache ca-certificates curl

ENV VERSION v2.3.1
ENV FILENAME helm-${VERSION}-linux-amd64.tar.gz

RUN curl -o /tmp/${FILENAME} http://storage.googleapis.com/kubernetes-helm/${FILENAME}  \
  && tar -zxvf /tmp/${FILENAME} -C /tmp \
  && mv /tmp/linux-amd64/helm /bin/helm \
  && rm -rf /tmp

ENTRYPOINT ["/bin/helm"]