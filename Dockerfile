FROM ubuntu:22.04

USER root
WORKDIR /root

COPY ./mininet/ENTRYPOINT.sh /

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    dnsutils \
    ifupdown \
    iproute2 \
    iptables \
    iputils-ping \
    mininet \
    net-tools \
    openvswitch-switch \
    openvswitch-testcontroller \
    tcpdump \
    vim \
    x11-xserver-utils \
    xterm \
    && rm -rf /var/lib/apt/lists/* \
    && touch /etc/network/interfaces \
    && chmod +x /ENTRYPOINT.sh \
    && curl -LsSf https://astral.sh/uv/install.sh | sh

COPY . /root

ENV PATH="/root/.local/bin:${PATH}"
ENV PYTHONPATH=src

EXPOSE 6633 6653 6640

ENTRYPOINT ["/ENTRYPOINT.sh"]
