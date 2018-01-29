FROM rust:1.23
LABEL maintainer="mps299792458@gmail.com" \
      version="0.0.28"

ENV MDBOOK_VERSION="0.0.28"

RUN cargo install mdbook --vers ${MDBOOK_VERSION}

WORKDIR /data
VOLUME ["/data"]
