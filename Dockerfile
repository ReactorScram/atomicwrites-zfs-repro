FROM rust:1.81.0-alpine as builder
WORKDIR /usr/src/atomicwrites-zfs-repro
COPY . .
RUN cat /etc/resolv.conf && cargo install --path .

FROM debian:bullseye-slim
COPY --from=builder /usr/local/cargo/bin/atomicwrites-zfs-repro /usr/local/bin/atomicwrites-zfs-repro
CMD ["atomicwrites-zfs-repro"]
