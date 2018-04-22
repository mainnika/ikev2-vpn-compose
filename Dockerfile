FROM ubuntu:16.04

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install strongswan strongswan-plugin-eap-mschapv2 iptables uuid-runtime openssl \
    && rm -rf /var/lib/apt/lists/* # cache busted 20160406.1

COPY ipsec.conf /etc/ipsec.conf
COPY ipsec.secrets /etc/ipsec.secrets
COPY pki/certs/* /etc/ipsec.d/certs
COPY pki/private/* /etc/ipsec.d/private
COPY entrypoint.sh /

EXPOSE 500/udp 4500/udp

CMD /entrypoint.sh
