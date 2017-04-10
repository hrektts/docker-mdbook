FROM hrektts/ubuntu:16.04.20170214
LABEL maintainer="mps299792458@gmail.com"

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
 && rm -rf /var/lib/apt/lists/*

WORKDIR /data
VOLUME ["/data"]
