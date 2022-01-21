.PHONY: all

IMAGES = flint-centos7.tar.gz flint-debian.tar.gz flint-ubuntu.tar.gz

all: $(IMAGES)

flint-centos7.tar.gz: centos7/Dockerfile centos7/Flint.tar.gz
	docker build -t "flint:centos7" centos7
	docker save "flint:centos7" | gzip > $@

flint-debian.tar.gz: debian/Dockerfile debian/Flint.tar.gz
	docker build -t "flint:debian" debian
	docker save "flint:debian" | gzip > $@

flint-ubuntu.tar.gz: ubuntu/Dockerfile ubuntu/Flint.tar.gz
	docker build -t "flint:ubuntu" ubuntu
	docker save "flint:ubuntu" | gzip > $@

centos7/Flint.tar.gz: Flint.tar.gz
	install -m 644 $< $@

debian/Flint.tar.gz: Flint.tar.gz
	install -m 644 $< $@

ubuntu/Flint.tar.gz: Flint.tar.gz
	install -m 644 $< $@

Flint.tar.gz:
	cd Flint && git archive --format=tar.gz --prefix=Flint/ HEAD > ../Flint.tar.gz
