.PHONY: help clean build deploy

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  clean      to remove the build from _site"
	@echo "  build      to create a new build in _site"
	@echo "  deploy     to commit and deploy changes to GitHub"

clean:
	rm -rf _site

build:
	bundle exec jekyll build

test:
	bundle exec htmlproof ./_site --favicon --validate_html --href_ignore http://www.krasnoukhov.com/404.html --verbose

deploy:
	$(MAKE) clean
	$(MAKE) build
	$(MAKE) test
	bundle exec octopress deploy
