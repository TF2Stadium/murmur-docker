FROM busybox:latest

ENV version=1.4.287

# Download statically compiled murmur and install it to /opt/murmur
ADD https://github.com/mumble-voip/mumble/releases/download/${version}/murmur-static_x86-${version}.tar.bz2 /opt/
RUN bzcat /opt/murmur-static_x86-${version}.tar.bz2 | tar -x -C /opt -f - && \
    rm /opt/murmur-static_x86-${version}.tar.bz2 && \
    mv /opt/murmur-static_x86-${version} /opt/murmur

COPY murmur.ini /etc/murmur.ini
COPY start-murmur.sh /start-murmur.sh

EXPOSE 64738/tcp 64738/udp
VOLUME ["/data"]

ENTRYPOINT ["/start-murmur.sh"]
