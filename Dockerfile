FROM alpine:3.10.3
LABEL maintainer=sbrown@oteemo.com

RUN apk add --no-cache curl unzip jq ca-certificates bash git

RUN curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64 \
 && chmod +x kops \
 && mv kops /usr/local/bin/kops

RUN curl -LO curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
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

RUN curl -Lo kustomize.tar.gz https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv3.5.3/kustomize_v3.5.3_linux_amd64.tar.gz \
 && tar -xvf kustomize.tar.gz \
 && chmod +x kustomize \
 && mv kustomize /usr/local/bin/kustomize

 RUN curl -Lo argocd https://github.com/argoproj/argo-cd/releases/download/v1.3.6/argocd-linux-amd64 \
  && chmod +x argocd \
  && mv argocd /usr/local/bin/argocd

RUN curl -Lo conftest.tar.gz https://github.com/instrumenta/conftest/releases/download/v0.16.0/conftest_0.16.0_Linux_x86_64.tar.gz \
 && tar -xvf conftest.tar.gz \
 && chmod +x conftest \
 && mv conftest /usr/local/bin/conftest

RUN rm -rf /var/cache/apk/*
