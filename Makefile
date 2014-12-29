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

deploy:
	$(MAKE) clean
	$(MAKE) build
	git clone --branch gh-pages git@github.com:krasnoukhov/dotcom.git _deploy; true
	cd _deploy && git fetch origin
	cd _deploy && git reset --hard origin/gh-pages
	cp .gitignore _site
	cp .nojekyll _site
	cd _deploy && ls | xargs rm -rf
	mv _site/* _deploy
	cd _deploy && git add -A
	cd _deploy && git commit -m "Generated gh-pages"
	cd _deploy && git push origin gh-pages
	@echo
	@echo "Deployment finished"
