NAME     := webdb-sample
VERSION  := $(shell git describe --tags --always --abbrev=0)
LDFLAGS  := "-s -w"
TARGET   := github.com/kiririmode/webdb133/go-sample

.PHONY: license-check
license-check:
	go-licenses check $(TARGET)

.PHONY: credits
credits:
	../scripts/make_credits.sh CREDITS

.PHONY: build
build: credits
	goxz -d dist -n $(NAME) -pv $(VERSION) -build-ldflags $(LDFLAGS) -include CREDITS

.PHONY: install
install:
	go install github.com/google/go-licenses@v1.5.0
	go install github.com/Songmu/goxz/cmd/goxz@v0.9.1
