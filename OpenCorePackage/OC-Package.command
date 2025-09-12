#!/bin/bash
# script for Installer OpenCorePackage
PARENTDIR=$(dirname "$0")
cd "$PARENTDIR"
find . -name '.DS_Store' -type f -delete

# shell script Notifications
osascript -e 'display notification "Installer OpenCorePackage" with title "Créatation"  sound name "default"'

# Delete build if exist
rm -rf ./OpenCore-Package
rm -rf ./OpenCore-Package
rm -rf ./OpenCore-Package.pkg

Sleep 1

mkdir -p ./OpenCore-Package/BUILD-PACKAGE


# Create the Packages with pkgbuild
pkgbuild --root ./OC-EFI --scripts ./ScriptEFI --identifier com.opencorePackage.OpenCorePackage.pkg --version 1.0 --install-location /Private/tmp/EFIROOTDIR ./OpenCore-Package/BUILD-PACKAGE/opencorePackage.pkg


Sleep 3
# Copy resources and distribution
cp -r ./Distribution ./OpenCore-Package/BUILD-PACKAGE/Distribution.xml
cp -rp ./Resources ./OpenCore-Package/BUILD-PACKAGE/


echo "
= = = = = = = = = = = = = = = = = = = = = = = = =
Creation du Packages finale avec productbuild "
Sleep 3

# Build the final Packages with Productbuild
productbuild --distribution "./OpenCore-Package/BUILD-PACKAGE/Distribution.xml"  \
--package-path "./OpenCore-Package/BUILD-PACKAGE/" \
--resources "./OpenCore-Package/BUILD-PACKAGE/Resources" \
"./OpenCore-Package.pkg"

rm -rf ./OpenCore-Package
