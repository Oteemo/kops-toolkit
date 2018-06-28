FROM alpine:3.7
LABEL maintainer=gmead@oteemo.com

RUN apk add --no-cache curl unzip

RUN curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64 \
 && chmod +x kops \
 && mv kops /usr/local/bin/kops

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin/kubectl

RUN curl -Lo helm.tar.gz https://storage.googleapis.com/kubernetes-helm/helm-v2.9.1-linux-amd64.tar.gz \
 && tar -xvf helm.tar.gz \
 && chmod +x linux-amd64/helm \
 && mv linux-amd64/helm /usr/local/bin/helm

RUN curl -Lo helmfile https://github.com/roboll/helmfile/releases/download/$(curl -s https://api.github.com/repos/roboll/helmfile/releases/latest | grep tag_name | cut -d '"' -f 4)/helmfile_linux_amd64 \
 && chmod +x helmfile \
 && mv helmfile /usr/local/bin/helmfile

RUN curl -Lo terraform.zip https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip \
 && unzip terraform.zip \
 && chmod +x terraform \
 && mv terraform /usr/local/bin/terraform

RUN curl -Lo cfssl https://pkg.cfssl.org/R1.2/cfssl_linux-amd64 \
 && chmod +x cfssl \
 && mv cfssl /usr/local/bin/cfssl

RUN rm -rf /var/cache/apk/*
