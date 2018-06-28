bootstrap:
	bundle install --path vendor/bundle

test: bootstrap
	bundle exec rspec

build: bootstrap
	docker build -tag oteemo:kops-toolkit --squash .