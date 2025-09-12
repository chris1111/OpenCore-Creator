## OpenCore-Creator

<img width="256" alt="icon_512x512" src="https://github.com/chris1111/OpenCore-Creator/blob/master/AppIcon.iconset/icon_512x512.png">

#### Latest Update 12 Sept 2025 
- Add Xcode source AppleScriptObjC Project.
- OpenCore X64 only, IA32 is broken for building in Xcode 16
- Not working Xcode 26

## List Update: ⬇︎
<details> 
  <summary>View list Update</summary>

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

#### Download Release V9 ☞ [OpenCore Creator-V9.dmg ](https://github.com/chris1111/OpenCore-Creator/releases/tag/V9)

#### Move the App to the Applications



