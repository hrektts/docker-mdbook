FROM rust:1.22
LABEL maintainer="mps299792458@gmail.com" \
      version="0.0.26"

ENV MDBOOK_VERSION="0.0.26"

RUN cargo install mdbook --vers ${MDBOOK_VERSION}

WORKDIR /data
VOLUME ["/data"]
