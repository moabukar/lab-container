IMAGE_NAME = moabukar/coderco-toolbox
VERSION = v1.0.0
LATEST = latest

build:
	docker build -t $(IMAGE_NAME):$(LATEST) .

run:
	docker run --rm -it $(IMAGE_NAME):$(LATEST) zsh

test:
	docker run --rm $(IMAGE_NAME):$(LATEST) sh -c ' \
		echo "Checking installed tools..."; \
		terraform --version && \
		vault --version && \
		aws --version && \
		kubectl version --client && \
		helm version && \
		kind version && \
		traefik version && \
		task --version && \
		docker version \
	'

push:
	docker tag $(IMAGE_NAME):$(LATEST) $(IMAGE_NAME):$(VERSION)
	docker push $(IMAGE_NAME):$(VERSION)
	docker push $(IMAGE_NAME):$(LATEST)

clean:
	docker image prune -f

deploy-k8s:
	kubectl run toolbox --image=$(IMAGE_NAME):$(LATEST) -- sleep infinity

exec-k8s:
	kubectl exec -it toolbox -- zsh
