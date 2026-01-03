FROM alpine:latest
RUN apk add --no-cache wget unzip
# V2Ray indir ve kur
RUN wget https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip v2ray-linux-64.zip -d /usr/local/bin && \
    chmod +x /usr/local/bin/v2ray
COPY config.json /config.json
# Render varsayılan portu 10000'dir
EXPOSE 10000
CMD ["/usr/local/bin/v2ray", "run", "-c", "/config.json"]
