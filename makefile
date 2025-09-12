OpenCore Creator:
	@echo "Building OpenCore Creator..."
	@$/xcodebuild -project "OpenCore Creator.xcodeproj" -alltargets -configuration Release
	@$/Open ./build/Release


.PHONY: OpenCore Creator clean

