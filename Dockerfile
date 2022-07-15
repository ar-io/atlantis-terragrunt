FROM ghcr.io/runatlantis/atlantis:dev

RUN apk add aws-cli jq

RUN wget https://github.com/gruntwork-io/terragrunt/releases/download/v0.38.5/terragrunt_linux_amd64 && chmod +x terragrunt_linux_amd64 && mv terragrunt_linux_amd64 /usr/bin/terragrunt

WORKDIR /home/atlantis

CMD ["server"]
