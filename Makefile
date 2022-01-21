install: 
	bundle install 
	brew bundle --file=./Brewfile

project:
	xcodegen generate --spec project.yml 
	bundle exec pod install

clean: 
	rm -rf ./DerivedData/
	bundle exec pod deintegrate 