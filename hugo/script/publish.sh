# initiate dist directory if not exist
if [ ! -d dist ]; then
	git clone https://github.com/fakhrulKhir/fakhrulkhir.com.git public
else
	git pull origin master
fi

# generate static files
BUILD_ID=$(git describe --always) hugo --minify

if [ "$1" != "--build-only" ]; then
	# push static files to remote repo
	(
		cd public
		git add .
		git commit -m 'build'
		git push -u origin master
	)
fi