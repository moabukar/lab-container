IMAGE_NAME = moabukar/devops-toolbox
VERSION = v1.0.0
LATEST = latest

.PHONY: build
build:
	docker build -t $(IMAGE_NAME):$(LATEST) .


.PHONY: run
run:
	docker run --rm -it $(IMAGE_NAME):$(LATEST) zsh

.PHONY: test
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


.PHONY: push
push:
	docker tag $(IMAGE_NAME):$(LATEST) $(IMAGE_NAME):$(VERSION)
	docker push $(IMAGE_NAME):$(VERSION)
	docker push $(IMAGE_NAME):$(LATEST)

.PHONY: clean
clean:
	docker image prune -f

.PHONY: deploy-k8s
deploy-k8s:
	kubectl run toolbox --image=$(IMAGE_NAME):$(LATEST) -- sleep infinity

# Access running container in Kubernetes
.PHONY: exec-k8s
exec-k8s:
	kubectl exec -it toolbox -- zsh
