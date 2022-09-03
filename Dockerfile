FROM runatlantis/atlantis:latest

LABEL maintainer="woodonggyu"

ARG TERRFORM_VERSION=1.2.8
ENV TERRAFORM_VERION=$TERRFORM_VERSION

RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERION}/terraform_${TERRAFORM_VERION}_linux_amd64.zip
RUN unzip terraform_${TERRAFORM_VERION}_linux_amd64.zip && rm terraform_${TERRAFORM_VERION}_linux_amd64.zip
RUN mv -f terraform /usr/local/bin/terraform

ARG TERRAGRUNT_VERSION=v0.38.7
ENV TERRAGRUNT_VERSION=$TERRAGRUNT_VERSION

RUN curl -s -Lo terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 &&  \
    chmod +x terragrunt &&  \
    mv terragrunt /usr/local/bin

RUN apk add --no-cache \
        python3 \
        py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install \
        awscli \
    && rm -rf /var/cache/apk/*

COPY config/repos.yaml /etc/atlantis/repos.yaml
COPY config/config.yaml /etc/atlantis/config.yaml