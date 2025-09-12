OpenCore Créateur:
	@echo "Building OpenCore Créateur..."
	@$/xcodebuild -project "OpenCore Créateur.xcodeproj" -alltargets -configuration Release
	@$/Open ./build/Release


.PHONY: OpenCore Créateur clean

