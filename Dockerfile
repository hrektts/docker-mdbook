FROM rust:1.27-slim
ARG MDBOOK_VERSION="0.1.5"
LABEL maintainer="mps299792458@gmail.com" \
      version=$MDBOOK_VERSION

RUN cargo install mdbook --vers ${MDBOOK_VERSION}

WORKDIR /data
VOLUME ["/data"]
