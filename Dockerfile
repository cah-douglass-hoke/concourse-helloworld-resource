FROM alpine:3.14
RUN apk update && apk add --upgrade bash jq
ADD assets /opt/resource
RUN chmod +x /opt/resource/*
WORKDIR /
ENTRYPOINT ["/bin/bash"]
