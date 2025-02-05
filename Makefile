# Image details
IMAGE_NAME = moabukar/coderco-toolbox
VERSION = v1.0.0
LATEST = latest

# Build the Docker image (force rebuild)
.PHONY: build
build:
	docker build -t $(IMAGE_NAME):$(LATEST) .

# Run the container interactively
.PHONY: run
run:
	docker run --rm -it $(IMAGE_NAME):$(LATEST) zsh

# Run a simple test to check installed tools inside the container
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

# Push image to Docker Hub
.PHONY: push
push:
	docker tag $(IMAGE_NAME):$(LATEST) $(IMAGE_NAME):$(VERSION)
	docker push $(IMAGE_NAME):$(VERSION)
	docker push $(IMAGE_NAME):$(LATEST)

# Remove dangling images
.PHONY: clean
clean:
	docker image prune -f

# Deploy as a Kubernetes pod for testing
.PHONY: deploy-k8s
deploy-k8s:
	kubectl run toolbox --image=$(IMAGE_NAME):$(LATEST) -- sleep infinity

# Access running container in Kubernetes
.PHONY: exec-k8s
exec-k8s:
	kubectl exec -it toolbox -- zsh
