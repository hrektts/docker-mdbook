FROM rust:1.24
LABEL maintainer="mps299792458@gmail.com" \
      version="0.1.1"

ENV MDBOOK_VERSION="0.1.1"

RUN cargo install mdbook --vers ${MDBOOK_VERSION}

WORKDIR /data
VOLUME ["/data"]
