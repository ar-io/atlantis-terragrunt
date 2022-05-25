FROM runatlantis/atlantis

ENV AWS_CLI_VER=2.7.2

RUN apk update && apk add --no-cache curl zip &&  \
    curl -s https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWS_CLI_VER}.zip -o awscliv2.zip && \
    unzip awscliv2.zip && ./aws/install

RUN apk add jq

RUN wget https://github.com/gruntwork-io/terragrunt/releases/download/v0.28.24/terragrunt_linux_amd64 && chmod +x terragrunt_linux_amd64 && mv terragrunt_linux_amd64 /usr/bin/terragrunt

WORKDIR /home/atlantis

CMD ["server"]
