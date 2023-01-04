NAME     := webdb-sample
VERSION  := v20230104
LDFLAGS  := "-s -w"

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
