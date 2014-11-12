current_dir = $(shell pwd)

deploy:
	git pull
	npm install
	cd $(current_dir)/public && jekyll build
	-forever stop $(current_dir)/app.js
	forever start -l forever.log -o output.log -e err.log -a $(current_dir)/app.js &
