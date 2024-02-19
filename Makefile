run:
	webdev serve

dev:
	webdev serve --debug-extension --auto=refresh

deps:
	dart pub get

.PHONY: build
build:
	webdev build -n unsound -- --delete-conflicting-outputs

.PHONY: test
test:
	dart run test --platform chrome

format:
	dart format .