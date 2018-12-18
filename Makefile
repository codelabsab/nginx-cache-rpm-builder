DOCKER_IMAGE = "nginx-cache-rpm-builder"

.PHONY: default build-in-docker clean

default: build-in-docker

build-in-docker:
	docker build -f docker/Dockerfile.builder -t $(DOCKER_IMAGE) .
	docker rm $(DOCKER_IMAGE) || exit 0
	docker run --name $(DOCKER_IMAGE) $(DOCKER_IMAGE)
	docker cp $(DOCKER_IMAGE):/root/rpmbuild/RPMS/ output

clean:
	-rm -rf output/RPMS
