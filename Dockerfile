FROM ghcr.io/runatlantis/atlantis:v0.23.3

RUN apk add aws-cli jq

RUN wget https://github.com/gruntwork-io/terragrunt/releases/download/v0.45.1/terragrunt_linux_amd64 && chmod +x terragrunt_linux_amd64 && mv terragrunt_linux_amd64 /usr/bin/terragrunt

WORKDIR /home/atlantis

CMD ["server"]
