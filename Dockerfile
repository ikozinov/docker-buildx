FROM multiarch/qemu-user-static:x86_64-aarch64 as qemu

FROM docker
COPY --from=docker/buildx-bin /buildx /usr/libexec/docker/cli-plugins/docker-buildx
COPY --from=qemu /usr/bin/qemu-aarch64-static /usr/bin

RUN docker buildx version
