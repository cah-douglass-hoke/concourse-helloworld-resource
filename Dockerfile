FROM alpine:3.7
ADD assets /opt/resource
RUN chmod +x /opt/resource/*
ENTRYPOINT ["/bin/bash"]
