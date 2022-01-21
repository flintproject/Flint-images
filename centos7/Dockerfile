FROM centos:7
WORKDIR /tmp
ADD Flint.tar.gz /tmp
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7-aarch64
RUN yum update -y
RUN yum install -y git centos-release-scl make rpm-build rpmdevtools libtool cmake wget gtk3-devel sqlite-devel libuuid-devel libxml2-devel patch zlib-devel gnuplot
RUN yum install -y devtoolset-8
RUN rpmdev-setuptree
RUN echo "source /opt/rh/devtoolset-8/enable" >> ~/.bashrc
SHELL ["/bin/bash", "-c"]
RUN install -m 644 /tmp/Flint/rpm/config.mk.el7 /tmp/Flint/rpm/config.mk
RUN make -C /tmp/Flint/rpm download
ENV QA_SKIP_RPATHS=1
RUN make -C /tmp/Flint/rpm all
RUN rpm -Uvh --replacepkgs /tmp/Flint/rpm/rpm/flint-*.rpm
CMD ["/usr/bin/flint"]
