all: push

# 0.0 shouldn't clobber any release builds
TAG = 0.1
PREFIX = aledbf/mkdocs

container:
	docker build -t $(PREFIX):$(TAG) .

push: container
	docker push $(PREFIX):$(TAG)
