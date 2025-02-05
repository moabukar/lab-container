FROM alpine:3.19 AS builder

WORKDIR /build

ARG TERRAFORM_VERSION="1.3.9"
ARG VAULT_VERSION="1.12.4"
ARG HELM_VERSION="3.11.2"
ARG KUBECTL_VERSION="v1.26.1"
ARG KIND_VERSION="v0.17.0"
ARG TRAEFIK_VERSION="2.9.6"
ARG TASK_VERSION="3.19.0"

RUN apk update && apk add --no-cache \
      bash \
      curl \
      wget \
      unzip \
      git \
      tar \
      ca-certificates \
      upx \
      binutils  # `strip` and `upx` to reduce binary sizes

COPY build/binaries.sh /build/binaries.sh

RUN chmod +x /build/binaries.sh && /build/binaries.sh

RUN strip --strip-unneeded /usr/local/bin/* || true
RUN upx --best --lzma /usr/local/bin/* || true

################################################################################
# Final image
################################################################################
FROM alpine:3.19

LABEL maintainer="moabukar" \
      description="A lightweight DevOps toolbox container."

WORKDIR /labs
ENV PATH="/labs/bin:$PATH"

RUN apk update && apk add --no-cache \
      bash \
      ca-certificates \
      python3 \
      py3-pip \
      aws-cli \
      zsh \
      jq \
      fzf \
      eza

COPY --from=builder /build/bin/ /usr/local/bin/

COPY zshrc /root/.zshrc

SHELL ["/bin/zsh", "-c"]

CMD ["zsh"]
