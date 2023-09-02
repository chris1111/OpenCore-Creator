#!/bin/bash
# script OpenCore-Creator
# http://hackintosh-montreal.com
# (c) Copyright 2019 2022 chris1111 
# Vars
# Set Icon directory and file 
export ICNS=$(dirname "${0}")
iconfile="$ICNS/applet.icns"
version="1.0"

PARENTDIR=$(dirname "$0")
cd "$PARENTDIR"
#   Slick Progress Bar
sleep 1 & PID=$! #Progress Bar

echo "`tput setaf 7``tput sgr0``tput bold``tput setaf 26`
                **************************************************** 
                **************   OpenCore Creator   ************** 
                ****************************************************
`tput sgr0` `tput setaf 7``tput sgr0`"
echo " "
echo " "
printf "["
# While process is running...
while kill -0 $PID 2> /dev/null; do 
    printf  "♾🔨♾🔨♾🔨♾🔨"
    sleep 0.2
done

printf '\e[8;47;82t'

nameh=`users`
function echob() {
  echo "`tput bold`$1`tput sgr0`"
}
function head
{
clear
echo "              = = = = = = = = = = = = = = = = = = = = = = = = =  "

tput blink                    
echo "                        Installer OpenCore Creator" 
tput sgr0

echo "              = = = = = = = = = = = = = = = = = = = = = = = = =  "
}
function menu
{
echo "                Welcome "`tput setaf 7``tput sgr0``tput bold``tput setaf 26`$nameh`tput sgr0` `tput setaf 7``tput sgr0`", Installer OpenCore Creator"
echo " "
echo "                       `tput setaf 26`
                Credit: OpenCore Team, Apple"
echo " "
echo "                        
                 `tput setaf 7``tput sgr0``tput bold``tput setaf 26`Type: ⬇`tput sgr0` `tput setaf 7``tput sgr0`︎"
echo "               =========================================== "
echo "                     ✅  1 = `tput setaf 7``tput sgr0``tput bold``tput setaf 26`Build OpenCore`tput sgr0` `tput setaf 7``tput sgr0`"
echo "               =========================================== "
echo "                     ✅  2 = `tput setaf 7``tput sgr0``tput bold``tput setaf 26`Check update OpenCore`tput sgr0` `tput setaf 7``tput sgr0`"
echo "               =========================================== "
echo "                     ✅  3 = `tput setaf 7``tput sgr0``tput bold``tput setaf 26`Make Update OpenCore`tput sgr0` `tput setaf 7``tput sgr0`"
echo "               =========================================== "
echo "                     ✅  4 = `tput setaf 7``tput sgr0``tput bold``tput setaf 26`Build Kexts OpenCore`tput sgr0` `tput setaf 7``tput sgr0`"
echo "               =========================================== "  
echo "                     ✅  5 = `tput setaf 7``tput sgr0``tput bold``tput setaf 26`OpenCore Package`tput sgr0` `tput setaf 7``tput sgr0`" 
echo "               =========================================== "
echo "                     ✅  6 = `tput setaf 7``tput sgr0``tput bold``tput setaf 26`Manuel OpenCore`tput sgr0` `tput setaf 7``tput sgr0`"
echo "               =========================================== "
echo "                     ✅  P = `tput setaf 7``tput sgr0``tput bold``tput setaf 26`Terminal Profiles`tput sgr0` `tput setaf 7``tput sgr0`"  
echo "               =========================================== "
echo "                     ✅  V = `tput setaf 7``tput sgr0``tput bold``tput setaf 26`See Commits OpenCore`tput sgr0` `tput setaf 7``tput sgr0`"  
echo "               =========================================== "
echo "                     ❎  X = `tput setaf 7``tput sgr0``tput bold``tput setaf 26`Quit (Exit)`tput sgr0` `tput setaf 7``tput sgr0`" 
echo "               =========================================== "

echo "              = = = = = = = = = = = = = = = = = = = = = = = = =  "

tput blink                    
echo "                         Installer OpenCore Creator" 
tput sgr0

echo "              = = = = = = = = = = = = = = = = = = = = = = = = =  "

read -n 1 option
}
function OPENCORE
{
head
echo " "

response=$(osascript -e 'tell app "System Events" to display dialog "
Welcome OpenCore Creator
This program allows you to build OpenCore.
You need Xcode and Command Line tool installed.
The output folder will be in
➤ $HOME/Github/OpenCorePkg

Working from macOS Catalina to macOS Sonoma 14

\n\nCancel Quit" buttons {"Cancel","OpenCore"} default button 2 with title "'"$apptitle"' '"$version"'" with icon POSIX file "'"$iconfile"'"  ')

answer=$(echo $response | grep "OpenCore")

# Cancel is user does not select OpenCore Kexts
if [ ! "$answer" ] ; then
  osascript -e 'display notification "Program closing" with title "'"$apptitle"'" subtitle "User cancelled"'
echo "              = = = = = = = = = = = = = = = = = = = = = = = = =  "

tput blink                    
echo "                      User Cancel OpenCore Creator" 
tput sgr0

echo "              = = = = = = = = = = = = = = = = = = = = = = = = =  "
  exit 0
fi

echo "Build OpenCore"
Sleep 4
file=/usr/local/bin/nasm
if [ -e "$file" ]; then
    echo "nasm exists no need password"
Sleep 2
else 
    echo "
=======================================
Build OpenCore must be done as root
Enter your password:
======================================= "
sudo mkdir -p /usr/local/bin
sudo cp -Rp ./NASM/iasl /usr/local/bin
sudo cp -Rp ./NASM/mtoc /usr/local/bin
sudo cp -Rp ./NASM/nasm /usr/local/bin
sudo cp -Rp ./NASM/ndisasm /usr/local/bin

fi

if [ "/$HOME/Github/OpenCorePkg" ]; then
	rm -rf "/$HOME/Github/OpenCorePkg"
fi

sleep 1
echo "
Clone Build "
mkdir -p $HOME/Github
Sleep 1
cd $HOME/Github
Sleep 1
git clone https://github.com/acidanthera/OpenCorePkg.git
sleep 1
echo "Build OpenCore " 
Sleep 1
cd $HOME/Github/OpenCorePkg
./build_oc.tool
Sleep 1
Open $HOME/Github/OpenCorePkg/Binaries
echo "======================================="
echo "Build OpenCore Done!  "
echo "======================================="
echo " "
}
function CHECKUPDATE
{
head
echo " "
echo "OpenCore Check-Update"
Sleep 3
echo "[ Fetch ⬇︎ ]"
cd ~/Github/OpenCorePkg
if [[ -d .git ]]; then
  git fetch --all
  git pull origin master
  Sleep 2
else
  echo "Error: This directory is not a Git. Unable to verify update!"
fi
echo " "
}
function UPDATE
{
head
echo " "
echo "OpenCore Update"
Sleep 3
echo "[Git Pull OpenCorePkg ⬇︎ ]"
cd ~/Github/OpenCorePkg
if [[ -d .git ]]; then
  git fetch --all
  git pull origin master
rm -rf $HOME/Github/OpenCorePkg/Binaries/*.zip
./build_oc.tool
else
  echo "Error: This directory is not a Git. Unable to verify update!"
fi

Open $HOME/Github/OpenCorePkg/Binaries
echo "======================================="
echo "Update OpenCore Done!  "
echo "======================================="
echo " "
}
function KEXTS
{
head
echo " "
response=$(osascript -e 'tell app "System Events" to display dialog "
Welcome OpenCore Creator
This program allows you to build kexts for OpenCore.
You need Xcode and Command Line tool installed.
The output folder will be in
➤ $HOME/Github/Build-Kexts

Working from macOS Catalinato macOS Sonoma 14

\n\nCancel Quit" buttons {"Cancel","OpenCore Kexts"} default button 2 with title "'"$apptitle"' '"$version"'" with icon POSIX file "'"$iconfile"'"  ')

answer=$(echo $response | grep "OpenCore Kexts")

# Cancel is user does not select OpenCore Kexts
if [ ! "$answer" ] ; then
  osascript -e 'display notification "Program closing" with title "'"$apptitle"'" subtitle "User cancelled"'
echo "              = = = = = = = = = = = = = = = = = = = = = = = = =  "

tput blink                    
echo "                      User Cancel OpenCore Créateur" 
tput sgr0

echo "              = = = = = = = = = = = = = = = = = = = = = = = = =  "
  exit 0
fi


echo "Build Kexts"
Sleep 4
file=/usr/local/bin/nasm
if [ -e "$file" ]; then
    echo "nasm exists no need password"
Sleep 2
else 
    echo "
=======================================
Build Kexts must be done as root
Enter your password: 
======================================= "
sudo mkdir -p /usr/local/bin
sudo cp -Rp ./NASM/iasl /usr/local/bin
sudo cp -Rp ./NASM/mtoc /usr/local/bin
sudo cp -Rp ./NASM/nasm /usr/local/bin
sudo cp -Rp ./NASM/ndisasm /usr/local/bin

fi


echo "Build Kexts"

if [ "/$HOME/Github/Build-Kexts" ]; then
	rm -rf "/$HOME/Github/Build-Kexts"
fi


sleep 1
echo "
Clone Build "
mkdir -p $HOME/Github/Build-Kexts


cd $HOME/Github/Build-Kexts
git clone https://github.com/acidanthera/MacKernelSDK
git clone https://github.com/acidanthera/VirtualSMC.git
git clone https://github.com/acidanthera/Lilu.git
git clone https://github.com/acidanthera/AppleALC.git 
git clone https://github.com/acidanthera/WhateverGreen.git
git clone https://github.com/acidanthera/AirportBrcmFixup.git
git clone https://github.com/acidanthera/NVMeFix.git
git clone https://github.com/acidanthera/BrightnessKeys.git
git clone https://github.com/acidanthera/IntelMausi.git
git clone https://github.com/acidanthera/BrcmPatchRAM.git
git clone https://github.com/acidanthera/VoodooPS2.git
git clone https://github.com/acidanthera/RestrictEvents.git
git clone https://github.com/0xFireWolf/RealtekCardReader.git
git clone https://github.com/0xFireWolf/RealtekCardReaderFriend.git
git clone https://github.com/acidanthera/CryptexFixup.git
cp -r ./MacKernelSDK ./Lilu
echo "
Build Lilu Debug " 
Sleep 3 
xcodebuild -project $HOME/Github/Build-Kexts/Lilu/Lilu.xcodeproj -configuration Debug ARCHS=x86_64 ONLY_ACTIVE_ARCH=YES CONFIGURATION_BUILD_DIR=$HOME/Github/Build-Kexts
Sleep 1
cp -r $HOME/Github/Build-Kexts/Lilu.kext $HOME/Github/Build-Kexts/WhateverGreen
cp -r ./MacKernelSDK ./WhateverGreen
cp -r $HOME/Github/Build-Kexts/Lilu.kext $HOME/Github/Build-Kexts/AirportBrcmFixup
cp -r ./MacKernelSDK ./AirportBrcmFixup
cp -r $HOME/Github/Build-Kexts/Lilu.kext $HOME/Github/Build-Kexts/IntelMausi
cp -r ./MacKernelSDK ./IntelMausi
cp -r $HOME/Github/Build-Kexts/Lilu.kext $HOME/Github/Build-Kexts/BrcmPatchRAM
cp -r ./MacKernelSDK ./BrcmPatchRAM
cp -r $HOME/Github/Build-Kexts/Lilu.kext $HOME/Github/Build-Kexts/NVMeFix
cp -r ./MacKernelSDK ./NVMeFix
cp -r $HOME/Github/Build-Kexts/Lilu.kext $HOME/Github/Build-Kexts/BrightnessKeys
cp -r ./MacKernelSDK ./BrightnessKeys
cp -r $HOME/Github/Build-Kexts/Lilu.kext $HOME/Github/Build-Kexts/VoodooPS2
cp -r ./MacKernelSDK ./VoodooPS2
cp -r $HOME/Github/Build-Kexts/Lilu.kext $HOME/Github/Build-Kexts/RestrictEvents
cp -r ./MacKernelSDK ./RestrictEvents
cp -r $HOME/Github/Build-Kexts/Lilu.kext $HOME/Github/Build-Kexts/RealtekCardReader
cp -r ./MacKernelSDK ./RealtekCardReader
cp -r $HOME/Github/Build-Kexts/Lilu.kext $HOME/Github/Build-Kexts/RealtekCardReaderFriend
cp -r ./MacKernelSDK ./RealtekCardReaderFriend
cp -r $HOME/Github/Build-Kexts/Lilu.kext $HOME/Github/Build-Kexts/VirtualSMC
cp -r ./MacKernelSDK ./VirtualSMC
cp -r $HOME/Github/Build-Kexts/Lilu.kext $HOME/Github/Build-Kexts/AppleALC
cp -r ./MacKernelSDK ./AppleALC
cp -r $HOME/Github/Build-Kexts/Lilu.kext $HOME/Github/Build-Kexts/CryptexFixup
cp -r ./MacKernelSDK ./CryptexFixup
sleep 2
mkdir -p $HOME/Github/Build-Kexts/Build
echo "
Build WhateverGreen " 
xcodebuild -project $HOME/Github/Build-Kexts/WhateverGreen/WhateverGreen.xcodeproj -alltargets -configuration Release
Sleep 2
echo "
Build AirportBrcmFixup " 
xcodebuild -project $HOME/Github/Build-Kexts/AirportBrcmFixup/AirportBrcmFixup.xcodeproj -alltargets -configuration Release
Sleep 2
echo "
Build IntelMausi " 
xcodebuild -project $HOME/Github/Build-Kexts/IntelMausi/IntelMausiEthernet.xcodeproj -alltargets -configuration Release
Sleep 2
echo "
Build BrcmPatchRAM " 
xcodebuild -project $HOME/Github/Build-Kexts/BrcmPatchRAM/BrcmPatchRAM.xcodeproj -alltargets -configuration Release
Sleep 2
echo "
Build NVMeFix " 
xcodebuild -project $HOME/Github/Build-Kexts/NVMeFix/NVMeFix.xcodeproj -alltargets -configuration Release
Sleep 2
echo "
Build BrightnessKeys " 
xcodebuild -project $HOME/Github/Build-Kexts/BrightnessKeys/BrightnessKeys.xcodeproj -alltargets -configuration Release
Sleep 2
echo "
Build RestrictEvents "
xcodebuild -project $HOME/Github/Build-Kexts/RestrictEvents/RestrictEvents.xcodeproj -alltargets -configuration Release
Sleep 2
echo "
Build VoodooPS2 " 
xcodebuild -project $HOME/Github/Build-Kexts/VoodooPS2/VoodooPS2Controller.xcodeproj -alltargets -configuration Release
Sleep 2
echo "
Build CryptexFixup " 
xcodebuild -project $HOME/Github/Build-Kexts/CryptexFixup/CryptexFixup.xcodeproj -alltargets -configuration Release
Sleep 2
echo "
Build Lilu Release "
Sleep 2
xcodebuild -project $HOME/Github/Build-Kexts/Lilu/Lilu.xcodeproj -alltargets -configuration Release
echo "
Build RealtekCardReader "
Sleep 2
xcodebuild -project $HOME/Github/Build-Kexts/RealtekCardReader/RealtekCardReader.xcodeproj -alltargets -configuration Release
echo "
Build RealtekCardReaderFriend "
Sleep 2
xcodebuild -project $HOME/Github/Build-Kexts/RealtekCardReaderFriend/RealtekCardReaderFriend.xcodeproj -alltargets -configuration Release
echo "
Build VirtualSMC "
Sleep 2
xcodebuild -project $HOME/Github/Build-Kexts/VirtualSMC/VirtualSMC.xcodeproj -configuration Release ARCHS=x86_64 ONLY_ACTIVE_ARCH=YES CONFIGURATION_BUILD_DIR=$HOME/Github/Build-Kexts/VirtualSMC
mkdir -p $HOME/Github/Build-Kexts/VirtualSMC/OUT
Sleep 1
tar xf $HOME/Github/Build-Kexts/VirtualSMC/VirtualSMC-*-RELEASE.zip --directory $HOME/Github/Build-Kexts/VirtualSMC/OUT
echo "
Build AppleALC
Wait! Build AppleALC takes a long time. . ."
Sleep 3
xcodebuild -project $HOME/Github/Build-Kexts/AppleALC/AppleALC.xcodeproj -alltargets -configuration Release
Sleep 2
rm -rf $HOME/Github/Build-Kexts/AirportBrcmFixup/Lilu.kext
rm -rf $HOME/Github/Build-Kexts/AppleALC/Lilu.kext
rm -rf $HOME/Github/Build-Kexts/BrcmPatchRAM/Lilu.kext
rm -rf $HOME/Github/Build-Kexts/BrightnessKeys/Lilu.kext
rm -rf $HOME/Github/Build-Kexts/IntelMausi/Lilu.kext
rm -rf $HOME/Github/Build-Kexts/Lilu/Lilu.kext
rm -rf $HOME/Github/Build-Kexts/NVMeFix/Lilu.kext
rm -rf $HOME/Github/Build-Kexts/RestrictEvents/Lilu.kext
rm -rf $HOME/Github/Build-Kexts/VirtualSMC/Lilu.kext
rm -rf $HOME/Github/Build-Kexts/VoodooPS2/Lilu.kext
rm -rf $HOME/Github/Build-Kexts/CryptexFixup/Lilu.kext
rm -rf $HOME/Github/Build-Kexts/WhateverGreen/Lilu.kext
rm -rf $HOME/Github/Build-Kexts/RealtekCardReader/Lilu.kext
rm -rf $HOME/Github/Build-Kexts/RealtekCardReaderFriend/Lilu.kext
rm -rf $HOME/Github/Build-Kexts/Lilu.kext
rm -rf $HOME/Github/Build-Kexts/*.zip
rm -rf $HOME/Github/Build-Kexts/MacKernelSDK
rm -rf $HOME/Github/Build-Kexts/AirportBrcmFixup/MacKernelSDK
rm -rf $HOME/Github/Build-Kexts/AppleALC/MacKernelSDK
rm -rf $HOME/Github/Build-Kexts/BrcmPatchRAM/MacKernelSDK
rm -rf $HOME/Github/Build-Kexts/BrightnessKeys/MacKernelSDK
rm -rf $HOME/Github/Build-Kexts/IntelMausi/MacKernelSDK
rm -rf $HOME/Github/Build-Kexts/Lilu/MacKernelSDK
rm -rf $HOME/Github/Build-Kexts/NVMeFix/MacKernelSDK
rm -rf $HOME/Github/Build-Kexts/RestrictEvents/MacKernelSDK
rm -rf $HOME/Github/Build-Kexts/VirtualSMC/MacKernelSDK
rm -rf $HOME/Github/Build-Kexts/VoodooPS2/MacKernelSDK
rm -rf $HOME/Github/Build-Kexts/CryptexFixup/MacKernelSDK
rm -rf $HOME/Github/Build-Kexts/WhateverGreen/MacKernelSDK
rm -rf $HOME/Github/Build-Kexts/RealtekCardReader/MacKernelSDK
rm -rf $HOME/Github/Build-Kexts/RealtekCardReaderFriend/MacKernelSDK
rm -rf $HOME/Github/Build-Kexts/MacKernelSDK

echo "Create Build final "
Sleep 2
cp -r $HOME/Github/Build-Kexts/VirtualSMC/OUT/dSYM/* $HOME/Github/Build-Kexts/Build
cp -r $HOME/Github/Build-Kexts/VirtualSMC/OUT/Kexts/* $HOME/Github/Build-Kexts/Build
cp -r $HOME/Github/Build-Kexts/VirtualSMC/OUT/Tools/ $HOME/Github/Build-Kexts/Build/Tools
cp -r $HOME/Github/Build-Kexts/VirtualSMC/VirtualSMC-*-RELEASE.zip $HOME/Github/Build-Kexts/Build
cp -r $HOME/Github/Build-Kexts/AirportBrcmFixup/build/Release/* $HOME/Github/Build-Kexts/Build
cp -r $HOME/Github/Build-Kexts/AppleALC/build/Release/* $HOME/Github/Build-Kexts/Build
cp -r $HOME/Github/Build-Kexts/BrcmPatchRAM/build/Products/Release/* $HOME/Github/Build-Kexts/Build
cp -r $HOME/Github/Build-Kexts/BrightnessKeys/build/Release/* $HOME/Github/Build-Kexts/Build
cp -r $HOME/Github/Build-Kexts/IntelMausi/build/Release/* $HOME/Github/Build-Kexts/Build
cp -r $HOME/Github/Build-Kexts/Lilu/build/Release/* $HOME/Github/Build-Kexts/Build
cp -r $HOME/Github/Build-Kexts/RealtekCardReader/build/Release/* $HOME/Github/Build-Kexts/Build
cp -r $HOME/Github/Build-Kexts/RealtekCardReaderFriend/build/Release/* $HOME/Github/Build-Kexts/Build
cp -r $HOME/Github/Build-Kexts/NVMeFix/build/Release/* $HOME/Github/Build-Kexts/Build
cp -r $HOME/Github/Build-Kexts/RestrictEvents/build/Release/* $HOME/Github/Build-Kexts/Build
cp -r $HOME/Github/Build-Kexts/CryptexFixup/build/Release/* $HOME/Github/Build-Kexts/Build
cp -r $HOME/Github/Build-Kexts/VoodooPS2/build/Products/Release/dSYM/* $HOME/Github/Build-Kexts/Build
cp -r $HOME/Github/Build-Kexts/VoodooPS2/build/Products/Release/*.zip $HOME/Github/Build-Kexts/Build
cp -r $HOME/Github/Build-Kexts/VoodooPS2/build/Products/Release/*.kext $HOME/Github/Build-Kexts/Build
cp -r $HOME/Github/Build-Kexts/WhateverGreen/build/Release/* $HOME/Github/Build-Kexts/Build
cd $HOME/Github/Build-Kexts
ls | sort
find . -name '.DS_Store' -type f -delete

echo "======================================="
echo "Build Kexts Done!  "
echo "======================================="
Sleep 1
Open $HOME/Github/Build-Kexts/Build
echo " "
}
function OPENCOREPACKAGE
{
head
echo " "
echo "OpenCore Package"
Sleep 1
rm -rf $HOME/Desktop/OpenCorePackage
Sleep 2
cp -rp ./OpenCorePackage $HOME/Desktop/OpenCorePackage
echo " "
echo "`tput setaf 7``tput sgr0``tput bold``tput setaf 26`Desktop OpenCore Package.`tput sgr0` `tput setaf 7``tput sgr0`"
echo " "
}
function MANUEL
{
head
echo " "
echo "Manuel OpenCore"
Sleep 1
Open $HOME/Github/OpenCorePkg/Docs/Configuration.pdf
echo " "
echo "`tput setaf 7``tput sgr0``tput bold``tput setaf 26`Manuel OpenCore.`tput sgr0` `tput setaf 7``tput sgr0`"
echo " "
}
function PROFILE
{
head
echo " "
echo "Terminal Profiles"
Sleep 1

osascript <<EOD

set Term to choose from list {"Pro", "Homebrew", "Basic", "Grass", "Man Page", "Novel", "Ocean", "Red Sands", "Silver Aerogel", "Solid Colors"} with title "Setup Terminal Profiles" with prompt "Which profiles do you want to use?" default items "Pro" OK button name {"Profiles"} cancel button name {"Cancel"}


if Term is false then
	display dialog "Quit Terminal Profiles" with icon note buttons {"Exit"} default button {"Exit"}
	error number -128
end if

if Term is {"Pro"} then
	do shell script "defaults write com.apple.terminal 'Default Window Settings' Pro"
	do shell script "defaults write com.apple.terminal 'Startup Window Settings' Pro"
	delay 1
	do shell script "killall Finder"
	
else if Term is {"Homebrew"} then
	do shell script "defaults write com.apple.terminal 'Default Window Settings' Homebrew"
	do shell script "defaults write com.apple.terminal 'Startup Window Settings' Homebrew"
	delay 1
	do shell script "killall Finder"
	
else if Term is {"Basic"} then
	do shell script "defaults write com.apple.terminal 'Default Window Settings' Basic"
	do shell script "defaults write com.apple.terminal 'Startup Window Settings' Basic"
	delay 1
	do shell script "killall Finder"
	
else if Term is {"Grass"} then
	do shell script "defaults write com.apple.terminal 'Default Window Settings' Grass"
	do shell script "defaults write com.apple.terminal 'Startup Window Settings' Grass"
	delay 1
	do shell script "killall Finder"
	
else if Term is {"Man Page"} then
	do shell script "defaults write com.apple.terminal 'Default Window Settings' 'Man Page'"
	do shell script "defaults write com.apple.terminal 'Startup Window Settings' 'Man Page'"
	delay 1
	do shell script "killall Finder"
	
else if Term is {"Novel"} then
	do shell script "defaults write com.apple.terminal 'Default Window Settings' Novel"
	do shell script "defaults write com.apple.terminal 'Startup Window Settings' Novel"
	delay 1
	do shell script "killall Finder"
	
else if Term is {"Ocean"} then
	do shell script "defaults write com.apple.terminal 'Default Window Settings' Ocean"
	do shell script "defaults write com.apple.terminal 'Startup Window Settings' Ocean"
	delay 1
	do shell script "killall Finder"
	
else if Term is {"Red Sands"} then
	do shell script "defaults write com.apple.terminal 'Default Window Settings' 'Red Sands'"
	do shell script "defaults write com.apple.terminal 'Startup Window Settings' 'Red Sands'"
	delay 1
	do shell script "killall Finder"
	
else if Term is {"Silver Aerogel"} then
	do shell script "defaults write com.apple.terminal 'Default Window Settings' 'Silver Aerogel'"
	do shell script "defaults write com.apple.terminal 'Startup Window Settings' 'Silver Aerogel'"
	delay 1
	do shell script "killall Finder"
	
else if Term is {"Solid Colors"} then
	do shell script "defaults write com.apple.terminal 'Default Window Settings' 'Solid Colors'"
	do shell script "defaults write com.apple.terminal 'Startup Window Settings' 'Solid Colors'"
	delay 1
	do shell script "killall Finder"
	
end if



EOD

echo "`tput setaf 7``tput sgr0``tput bold``tput setaf 26`The Profile Terminal will be changed the next time you open OpenCore Creator.
Click Terminate to exit`tput sgr0` `tput setaf 7``tput sgr0`"
Sleep 2

osascript -e 'tell application "Terminal" to quit'
echo " "
}
function COMMITS
{
head
echo " "
echo "Commits OpenCore"
Sleep 1
open -a safari 'https://github.com/acidanthera/OpenCorePkg/commits/master'
echo " "
echo "`tput setaf 7``tput sgr0``tput bold``tput setaf 26`See Commits OpenCore.`tput sgr0` `tput setaf 7``tput sgr0`"
echo " "
}
function Quit
{
clear
echo " "
echo "
Quit Installer OpenCore Creator"
osascript -e 'tell app "Terminal" to display dialog "
Quit OpenCore Creator" with icon POSIX file "'"$iconfile"'" buttons {"Exit"} default button 1 with title " OpenCore Creator"'

echo " "
say Thanks to using OpenCoreCreator!
osascript -e 'display notification "" with title "Closing OpenCore Creator" subtitle "Thanks to using OpenCoreCreator"'
echo " "



exit 123456

}
while [ 1 ]
do
head
menu
case $option in


1|1)
echo
OPENCORE ;;
2|2)
echo
CHECKUPDATE ;;
3|3)
echo
UPDATE ;;
4|4)
echo
KEXTS ;;
5|5)
echo
OPENCOREPACKAGE ;;
6|6)
echo
MANUEL ;;
p|P)
echo
PROFILE ;;
v|V)
echo
COMMITS ;;
x|X)
echo
Quit ;;

*)
echo ""
esac
echo
echob "`tput setaf 7``tput sgr0``tput bold``tput setaf 26`Type any key to return in the menu`tput sgr0` `tput setaf 7``tput sgr0`"
echo
read -n 1 line
clear
done

exit
