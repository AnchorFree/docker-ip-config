NAME = anchorfree/ip-config
VERSION = 0.1

.PHONY: all build tag_latest release

all: build tag_latest release

build:
	docker build -t $(NAME):$(VERSION) --rm .

tag_latest:
	docker tag $(NAME):$(VERSION) $(NAME):latest

release:
	@if ! docker images $(NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME) version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	docker push $(NAME):$(VERSION) 
	docker push $(NAME):latest
	@echo "*** Don't forget to assign production tag as soon as you feel it is ready: make prod"

prod:
	docker tag $(NAME):$(VERSION) $(NAME):prod
	docker push $(NAME):prod
	docker rmi $(NAME):prod

blue:
	docker tag $(NAME):$(VERSION) $(NAME):blue
	docker push $(NAME):blue

green:
	docker tag $(NAME):$(VERSION) $(NAME):green
	docker push $(NAME):green
