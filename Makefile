
DOCKER = docker
IMAGE = isp


build:
	$(DOCKER) build -t $(IMAGE) .

run:
	$(DOCKER) run -v "$(PWD):/home" -it --rm $(IMAGE)
