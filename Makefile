MOD=github.com/rspier/rt-static

deps:
	go get -v $(MOD)/...

# will build into ~/go/bin
build:
	go build $(MOD)/...

DATAZIP=/big/rt-static/perl5.zip
SITE=perl5
PREFIX=/perl5
run:
	go run cmd/server/server.go \
		--logtostderr \
		--data "$(DATAZIP)" \
		--index "$(DATAZIP)" \
		--site "$(SITE)" \
		--prefix "$(PREFIX)"

VERSION=latest
docker-build:
	docker build -t rt-static-server:$(VERSION) .

docker-push:
# docker tag and docker push goes here
