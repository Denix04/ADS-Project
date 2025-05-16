BUNDLE_PATH = vendor/bundle
MAIN = src/app.rb  # Change this to your script

.PHONY: install run clean

install:
	@bundle install --path $(BUNDLE_PATH)

run:
	@bundle exec ruby $(MAIN)

clean:
	@rm -rf .bundle vendor Gemfile.lock 
