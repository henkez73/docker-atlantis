FROM runatlantis/atlantis:latest

LABEL maintainer="woodonggyu"

ARG TERRAGRUNT_VERSION=v0.38.7
ENV TERRAGRUNT_VERSION=$TERRAGRUNT_VERSION

RUN curl -s -Lo terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 &&  \
    chmod +x terragrunt &&  \
    mv terragrunt /usr/local/bin

apk add --no-cache \
        python3 \
        py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install \
        awscli \
    && rm -rf /var/cache/apk/*