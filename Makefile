DOCKER_IMAGE=martinkuchta/home-dashboard:latest

.PHONY: push-docker-image
push-docker-image: docker-image
	docker push ${DOCKER_IMAGE}

.PHONY: docker-image
docker-image:
	docker build . -t ${DOCKER_IMAGE}


