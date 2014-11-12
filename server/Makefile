current_dir = $(shell pwd)

deploy:
	git pull
	npm install
	cd $(current_dir)/public && jekyll build
	(forever restart -l forever.log -o output.log -e err.log $(current_dir)/app.js &) || (forever start -l forever.log -o output.log -e err.log $(current_dir)/app.js &)