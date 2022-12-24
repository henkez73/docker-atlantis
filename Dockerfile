FROM ghcr.io/runatlantis/atlantis:dev-debian

LABEL maintainer="woodonggyu"

COPY usr/local/bin/terragrunt /usr/local/bin/terragrunt

COPY repos.yaml /etc/atlantis/repos.yaml

COPY config.yaml /etc/atlantis/config.yaml