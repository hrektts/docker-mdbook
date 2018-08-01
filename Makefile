all: build

build:
	@docker build -t hrektts/mdbook:latest .

release: build
	@docker build -t hrektts/mdbook:$(shell cat Dockerfile | \
		grep "ARG MDBOOK_VERSION" | \
		sed -e 's/[^"]*"\([^"]*\)".*/\1/') .
