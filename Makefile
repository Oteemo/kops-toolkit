bootstrap:
	bundle install --path vendor/bundle

test: bootstrap
	bundle exec rspec

build: bootstrap
	docker build --no-cache --tag oteemo:kops-toolkit --squash .
