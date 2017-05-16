FROM hrektts/ubuntu:16.04.20170417.1
LABEL maintainer "mps299792458@gmail.com" \
      com.katsutoshihorie.version="0.0.18-40f275b"

ENV PATH=/root/.cargo/bin:${PATH}

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    curl \
    git \
 && wget -qO - https://sh.rustup.rs | sh -s -- -y --default-toolchain nightly \
 && git clone --depth 1 https://github.com/azerupi/mdBook.git \
 && cd mdBook \
 && sed -i "s:^\(pulldown-cmark = \).*:\1\{ git = \"https\://github.com/google/pulldown-cmark.git\" \}:" Cargo.toml \
 && cargo update \
 && cargo build --release \
 && cargo install \
 && cargo clean \
 && cd .. \
 && rm -rf mdBook \
 && DEBIAN_FRONTEND=noninteractive apt-get --purge remove -y \
    build-essential \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /data
VOLUME ["/data"]
