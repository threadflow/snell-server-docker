FROM jeanblanchard/alpine-glibc

ARG SNELL_VERSION="4.0.1"
# ARG SNELL_URI="https://github.com/surge-networks/snell/releases/download/v2.0.0/snell-server-v2.0.0-linux-amd64.zip"
#                https://github.com/surge-networks/snell/releases/download/v3.0.0rc2/snell-server-v3.0.0-linux-amd64.zip
#                https://github.com/surge-networks/snell/releases/download/v3.0.1/snell-server-v3.0.1-linux-amd64.zip
#                https://dl.nssurge.com/snell/snell-server-v4.0.0-linux-amd64.zip
ENV TZ=UTC

WORKDIR /tmp

COPY start.sh /start.sh
RUN apk add --update libstdc++ && rm -rf /var/cache/apk/* && \
    wget https://dl.nssurge.com/snell/snell-server-v${SNELL_VERSION}-linux-amd64.zip && \
    unzip snell-server-v${SNELL_VERSION}-linux-amd64.zip && \
    mv snell-server /usr/bin/ && rm snell-server-v${SNELL_VERSION}-linux-amd64.zip
    # wget ${SNELL_URI} && \
    # unzip snell-server-v${SNELL_VERSION}-linux-amd64.zip && \
    # mv snell-server /usr/bin/ && rm snell-server-v${SNELL_VERSION}-linux-amd64.zip

ENTRYPOINT /start.sh
