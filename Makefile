all: build

build:
	@docker build -t hrektts/mdbook:latest .

release: build
	@docker build -t hrektts/mdbook:$(shell cat Dockerfile | \
		grep version | \
		sed -e 's/[^"]*"\([^"]*\)".*/\1/') .
