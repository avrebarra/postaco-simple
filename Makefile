PROJECTNAME := postaco

# -------------------------------------------------

## build project
build:
	rm -rf docs
	postaco build -src ./src -out=docs

serve:
	serve dist

.PHONY: help
all: help
help: Makefile
	@echo
	@echo " Choose a command run with parameter options: "
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo
