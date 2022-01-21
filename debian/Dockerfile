FROM debian:latest
WORKDIR /tmp
ADD Flint.tar.gz /tmp
COPY config.mk /tmp/Flint/posix/
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y -q \
    gcc g++ autoconf automake libtool cmake \
    pkgconf libgtk-3-dev libsqlite3-dev libxml2-dev patch zlib1g-dev gnuplot \
    wget \
    && rm -rf /var/lib/apt/lists/*
RUN make -C /tmp/Flint/posix download
RUN make -C /tmp/Flint/posix external
RUN make -C /tmp/Flint/posix install
RUN make -C /tmp/Flint/posix check
ENV PATH=/opt/flint/sequential-version/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
CMD ["flint"]
