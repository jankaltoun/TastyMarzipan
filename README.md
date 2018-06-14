# TastyMarzipan

This is a demo of a simple iOS/Mac app using UIKit with the same codebase for both platforms.

## Requirements

This demo requires you to add `UIKit.framework` to `./StolenFrameworks`.
You can find it in [@biscuitteh's awesome demo](https://github.com/biscuitehh/MarzipanPlatter/tree/master/Frameworks).

## Building and running the Mac app

*Archive*
`xcodebuild archive -workspace "HNClient.xcworkspace" -scheme HNClientMac -archivePath ./build/HNClient.xcarchive`

*Export archive*
`xcodebuild -exportArchive -archivePath ./build/HNClient.xcarchive -exportOptionsPlist ExportOptions.plist -exportPath ./build/`

*Run app*
`CFMZEnabled=1 ./build/HNClientMac.app/Contents/MacOS/HNClientMac`

# A big thanks to community

These awesome people pioneered this approach:

- @biscuitehh - https://github.com/biscuitehh/MarzipanPlatter
- @zhuowei - https://github.com/zhuowei/MarzipanTool
- @stroughtonsmith - https://twitter.com/stroughtonsmith