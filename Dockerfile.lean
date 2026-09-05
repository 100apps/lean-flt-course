FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive
ARG UBUNTU_MIRROR=http://mirrors.ustc.edu.cn/ubuntu
ARG LEAN_TOOLCHAIN=leanprover/lean4:v4.33.0

RUN sed -i "s|http://archive.ubuntu.com/ubuntu|${UBUNTU_MIRROR}|g; s|http://security.ubuntu.com/ubuntu|${UBUNTU_MIRROR}|g" \
      /etc/apt/sources.list.d/ubuntu.sources \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
       bash ca-certificates curl git build-essential zstd \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://elan.lean-lang.org/elan-init.sh \
    | sh -s -- -y --default-toolchain none

ENV PATH="/root/.elan/bin:${PATH}"
RUN elan toolchain install "${LEAN_TOOLCHAIN}"

ARG GH_VERSION=2.97.0
ARG GH_SHA256=a2c9b8497e1f85b1ad0dfcb78b5a622e098801b8e461e459e88e1ee12f018112
RUN curl -fsSL -o /tmp/gh.tar.gz \
      "https://github.com/cli/cli/releases/download/v${GH_VERSION}/gh_${GH_VERSION}_linux_amd64.tar.gz" \
    && printf '%s  %s\n' "${GH_SHA256}" /tmp/gh.tar.gz | sha256sum -c - \
    && tar -xzf /tmp/gh.tar.gz -C /tmp \
    && install "/tmp/gh_${GH_VERSION}_linux_amd64/bin/gh" /usr/local/bin/gh \
    && rm -rf /tmp/gh.tar.gz "/tmp/gh_${GH_VERSION}_linux_amd64"

WORKDIR /workspace

# The exact toolchain is selected by the bind-mounted lean-toolchain file.
CMD ["bash"]
