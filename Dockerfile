FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG TERRAFORM_VERSION
ARG TARGETOS
ARG TARGETARCH

ENV TERRAFORM_VERSION=${TERRAFORM_VERSION}

# Base tools + sudo
RUN apt-get update && apt-get install --yes --no-install-recommends \
      curl unzip git wget bash software-properties-common lsb-release bash-completion sudo \
  && rm -rf /var/lib/apt/lists/*

# Terraform (linux_amd64 or linux_arm64)
RUN curl -Lo /tmp/terraform.zip "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_${TARGETOS}_${TARGETARCH}.zip" \
 && unzip /tmp/terraform.zip -d /usr/local/bin \
 && rm /tmp/terraform.zip

# Create user and grant passwordless sudo
RUN adduser --disabled-password --gecos "" tfuser \
 && usermod --append --groups sudo tfuser \
 && echo 'tfuser ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/90-tfuser \
 && chmod 0440 /etc/sudoers.d/90-tfuser

USER tfuser
RUN echo 'if [ -f /etc/bash_completion ]; then . /etc/bash_completion; fi' >> /home/tfuser/.bashrc

CMD ["tail", "-f", "/dev/null"]
