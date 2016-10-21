FROM hrektts/ubuntu:16.04.20161010
MAINTAINER mps299792458@gmail.com

ENV PATH=/root/.cargo/bin:${PATH}

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential curl \
 && wget -qO - https://sh.rustup.rs | sh -s -- -y --default-toolchain nightly \
 && cargo install mdbook \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /data
VOLUME ["/data"]
