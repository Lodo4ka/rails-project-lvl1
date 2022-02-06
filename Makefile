install:
	bundle install

test:
	rake test

lint:
	bundle exec rake rubocop

.PHONY: test