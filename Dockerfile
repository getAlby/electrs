FROM rust:lastest as build
COPY ./ ./
WORKDIR /app
RUN cargo build --release
FROM debian:buster-slim
COPY --from=build /app/target/release/electrs .
CMD ["./electrs"]