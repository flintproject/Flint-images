.PHONY: all

IMAGES = flint-centos7.tar.gz flint-debian.tar.gz flint-ubuntu.tar.gz

all: $(IMAGES)

flint-centos7.tar.gz: Dockerfile.centos7
	docker build -t "flint:centos7" - < $<
	docker save "flint:centos7" | gzip > $@

flint-debian.tar.gz: Dockerfile.debian
	docker build -t "flint:debian" - < $<
	docker save "flint:debian" | gzip > $@

flint-ubuntu.tar.gz: Dockerfile.ubuntu
	docker build -t "flint:ubuntu" - < $<
	docker save "flint:ubuntu" | gzip > $@
