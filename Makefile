.PHONY: build clean deploy gomodgen

build: gomodgen
	./gobuild.sh

clean:
	rm -rf ./bin ./vendor Gopkg.lock

deploy: clean build test
	sls deploy --verbose

test:
	go test ./model
	go test ./service

gomodgen:
	chmod u+x gomod.sh
	./gomod.sh

destroy:
	sls remove