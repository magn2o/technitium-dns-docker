FROM mcr.microsoft.com/dotnet/core/runtime:2.2

LABEL maintainer="magn2o"

RUN \
    apt-get -y update && apt-get -y install curl dnsutils && \
    cd /tmp && curl -O https://download.technitium.com/dns/DnsServerPortable.tar.gz && \
    mkdir /app && tar -zxvf /tmp/DnsServerPortable.tar.gz -C /app && \
    rm -rf /tmp/DnsServerPortable.tar.gz /var/lib/apt/lists/*

EXPOSE 5380/tcp
EXPOSE 53/tcp
EXPOSE 53/udp

VOLUME /app/config

WORKDIR /app
ENTRYPOINT ["dotnet", "DnsServerApp.dll"]

HEALTHCHECK --interval=30s --timeout=5s --start-period=30s --retries=3 \
  CMD dig +time=3 +tries=1 @localhost google.com || exit 1
