
DOCKER = sudo docker
IMAGE = isp


build:
	$(DOCKER) build -t $(IMAGE) .

run:
	$(DOCKER) run -it --rm $(IMAGE)
