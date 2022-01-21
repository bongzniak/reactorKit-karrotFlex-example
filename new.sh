# $1 is project name 
sed -i '' "s/appname/$1/g" project.yml
sed -i '' "s/appname/$1/g" Podfile
sed -i '' "s/appname/$1/g" Sources/*.swift
sed -i '' "s/appname/$1/g" Sources/*/*.swift
sed -i '' "s/appname/$1/g" fastlane/.env
sed -i '' "s/appname/$1/g" fastlane/Fastfile