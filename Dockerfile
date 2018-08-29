FROM rust:1.28-slim
ARG MDBOOK_VERSION="0.2.1"
LABEL maintainer="mps299792458@gmail.com" \
      version=$MDBOOK_VERSION

RUN cargo install mdbook --vers ${MDBOOK_VERSION}

WORKDIR /data
VOLUME ["/data"]
