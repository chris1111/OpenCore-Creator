## OpenCore-Creator
[![pages-build-deployment](https://github.com/chris1111/OpenCore-Creator/actions/workflows/pages/pages-build-deployment/badge.svg)](https://github.com/chris1111/OpenCore-Creator/actions/workflows/pages/pages-build-deployment) [![License: MIT](https://github.com/chris1111/OpenCore-Creator/blob/master/Icons/MIT.svg)](https://github.com/chris1111/OpenCore-Creator/blob/master/LICENSE)

<img width="256" alt="icon_512x512" src="https://github.com/chris1111/OpenCore-Creator/blob/master/AppIcon.iconset/icon_512x512.png">

#### Latest Update 27 Sept 2025 Add build timestamps

## List Update: ⬇︎
<details> 
  <summary>View list Update</summary>

- Update 17 Sept 2025 Add Release V10
- Fix Building IA32. Removed old build setup for OpenCore and updated terminal profile options. Add "Clear Dark"
- Add patch from Mike Beaton:
- Now working Xcode 16, Xcode 26

- Update 12 Sept 2025 Add Xcode source AppleScriptObjC Project. OpenCore X64 only, IA32 is broken for building in Xcode 16

- Update 28 Apr 2024 Release V8. Download then install mandatory binary's for building OpenCore if not exist. Update Icon program.

- Update 17 February 2024 Add (Option 0) Check OC Version. Fix using any time (Option 5) OpenCore Package

- Update 02 Sept 2023 Build more kexts
  
- Update 20 Mar 2022 Add OpenCore Creator+Duet-V5, fix Release V5 Open and close command in latest Monterey 12

- Update 12 Mar 2022 add Option 2 and 3 to make OpenCore Update, Option 5 OpenCore Package, Option P Terminal Profiles
 
</details>

-------------------------------------------------------

- An easy builder of OpenCore (VirtualSMC / Other kext)
- OpenCore is create in ➤  $HOME/Github / OpenCorePkg
- Kexts is create in ➤  $HOME/Github / Build-Kexts
- Works from macOS Big Sur 11 to macOS Tahoe 26
- OpenCore Package is now Included Status Menue [OpenCore Package](https://github.com/chris1111/OpenCore-Package)
- Terminal Profiler is now Included (Option P) [Terminal Profiler](https://github.com/chris1111/Terminal-Profiler)

#### Credit: ☞ [Acidanthera](https://github.com/acidanthera), [Apple](https://developer.apple.com/)
-------------------------------------------------------

#### Prerequisite: Command Line Tools (CLT) for Xcode or [Developer Apple Command Line Tools](https://developer.apple.com/download/all/)

- [x] `Download Command Line tool from terminal`

`xcode-select --install`

- [x] `Xcode`
- Download Xcode [Xcode App Store](https://apps.apple.com/us/app/xcode/id497799835?mt=12) After downloading ➦ Open Xcode at least once
  

#### Clone and Build: 

 `git clone https://github.com/chris1111/OpenCore-Creator.git && cd $HOME/OpenCore-Creator && make`

-------------------------------------------------------
### List of kexts: ⬇︎

<details> 
  <summary>View kexts list Update</summary>
  
- AirportBrcmFixup.kext
- AppleALC.kext
- BlueToolFixup.kext 
- BrcmBluetoothInjector.kext
- BrcmFirmwareData.kext
- BrcmFirmwareRepo.kext
- BrcmNonPatchRAM.kext
- BrcmNonPatchRAM2.kext
- BrcmPatchRAM.kext
- BrcmPatchRAM2.kext
- BrcmPatchRAM3.kext
- BrightnessKeys.kext
- IntelMausi.kext
- IntelSnowMausi.kext
- Lilu.kext
- RestrictEvents.kext
- NVMeFix.kext
- SMCBatteryManager.kext
- SMCDellSensors.kext
- SMCLightSensor.kext
- SMCProcessor.kext
- SMCSuperIO.kext
- VirtualSMC.kext
- VoodooPS2Controller.kext
- WhateverGreen.kext
- RealtekCardReader.kext
- RealtekCardReaderFriend.kext
- CryptexFixup.kext

</details>

-------------------------------------------------------

#### Download Release V10 ➥ [OpenCore Creator-V10.dmg](https://github.com/chris1111/OpenCore-Creator/releases/tag/V10)

#### Move the App to the Applications 
- Go to System Settings/Login Items & Extensions then add the app by the + button to make the app at login
<img width="479" height="423" alt="Screenshot 2025-09-12 at 5 09 33 PM" src="https://github.com/user-attachments/assets/b7fbc6f9-608b-4384-ab65-1073288d165c" />

#### Open OpenCore Creator.app from Applications then run it from Status Menu
<img width="311" height="80" alt="Screenshot 1" src="https://github.com/user-attachments/assets/cec6db7c-ae53-4b88-a16a-3e16d4c4aad8" />

#### Option OpenCore Creator: to build OpenCore
- Type 1 to build OpenCore
<img width="592" height="930" alt="Screenshot 2" src="https://github.com/user-attachments/assets/5997ee69-2891-4f77-acd3-f6fb19e656fb" />

#### Option OpenCore Package: to create a macOS installer of OpenCore
<img width="1049" height="841" alt="Screenshot 3" src="https://github.com/user-attachments/assets/fd42cf8d-b908-4821-a85f-ca1d24a7d95e" />






