OpenCore Creator:
	@echo "Xcode Building OpenCore Creator..."
	@$/xcodebuild -project "OpenCore Creator.xcodeproj" -alltargets -configuration Release


.PHONY: OpenCore Creator clean

