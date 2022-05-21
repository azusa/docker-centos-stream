FROM centos:centos8.4.2105

RUN sed -i -e 's/^mirrorlist/#mirrorlist/g' -e 's/^#baseurl=http:\/\/mirror/baseurl=http:\/\/vault/g' /etc/yum.repos.d/CentOS-*repo

RUN dnf -y install centos-release-stream &&\
    dnf -y swap centos-{linux,stream}-repos &&\
    dnf -y distro-sync && \
    dnf -y update && \
    dnf clean all
