FROM alpine:3.4

RUN apk add --no-cache \
    bash \
    openssl \
 && wget -O /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(wget -O - https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 \
 && chmod +x /usr/local/bin/dumb-init

ENTRYPOINT [ "/usr/local/bin/dumb-init", "--" ]
CMD [ "kubectl", "version" ]
