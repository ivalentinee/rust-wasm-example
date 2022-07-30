FROM rust:1.62.0-slim-buster

WORKDIR /app

RUN apt update && \
    apt install -y curl openssl libssl-dev build-essential pkg-config && \
    rustup target add wasm32-unknown-unknown && \
    cargo install -f wasm-bindgen-cli

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

CMD ["node", "/app/out/browser/server.js"]
