# Release notes: https://github.com/runatlantis/atlantis/releases/tag/v0.28.3
ARG ATLANTIS_VERSION=${ATLANTIS_VERSION:-0.28.3}

FROM ghcr.io/runatlantis/atlantis:v${ATLANTIS_VERSION}

ARG TERRAGRUNT_VERSION=${TERRAGRUNT_VERSION:-v0.58.2}

# User root user to install additional packages
USER root

RUN wget https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 && chmod +x terragrunt_linux_amd64 && mv terragrunt_linux_amd64 /usr/bin/terragrunt

# include python3 for local-run commands
RUN apk add --no-cache python3 py3-pip

# Switch back to atlantis user
USER atlantis
WORKDIR /home/atlantis

CMD ["server"]
