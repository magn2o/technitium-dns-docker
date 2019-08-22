# Unofficial Docker container for [Technitium DNS Server](https://github.com/TechnitiumSoftware/DnsServer)

Simple and sweet, even includes a healthcheck. Works great on a Raspberry Pi, too!

## Usage

~~~
docker run \  
-d \
--name technitium-dns \
-p 5380:5380/tcp \
-p 53/53/tcp \
-p 53/53/udp \
-v [path]:/app/config
~~~
