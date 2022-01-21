.PHONY: all

IMAGES = flint-centos7.tar.gz flint-ubuntu.tar.gz

all: $(IMAGES)

flint-centos7.tar.gz: centos7/Dockerfile centos7/Flint.tar.gz
	docker build -t "flint:centos7" centos7
	docker save "flint:centos7" | gzip > $@

flint-ubuntu.tar.gz: ubuntu/Dockerfile ubuntu/Flint.tar.gz
	docker build -t "flint:ubuntu" ubuntu
	docker save "flint:ubuntu" | gzip > $@

centos7/Flint.tar.gz: Flint.tar.gz
	install -m 644 $< $@

ubuntu/Flint.tar.gz: Flint.tar.gz
	install -m 644 $< $@
