FROM hrektts/ubuntu:16.04.20170619
LABEL maintainer "mps299792458@gmail.com" \
      com.katsutoshihorie.version="0.0.21"

ENV PATH=/root/.cargo/bin:${PATH}
ENV MDBOOK_VERSION="0.0.21"

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    curl \
 && wget -qO - https://sh.rustup.rs | sh -s -- -y --default-toolchain nightly \
 && cargo install mdbook --vers ${MDBOOK_VERSION} \
 && DEBIAN_FRONTEND=noninteractive apt-get --purge remove -y \
    build-essential \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /data
VOLUME ["/data"]
