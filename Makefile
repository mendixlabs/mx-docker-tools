build:
ifdef version
	docker build ./src \
        --build-arg MX_VERSION=$(version) \
        -t mendixlabs/mx-docker-tools:$(version)
else
	@echo 'Parameter "version" should be defined. Example: make version=9.10.0.36429 build'
endif


