## OpenCore-Creator
### You need Command Line Tool and Xcode installed to using this.
- Download Command Line tool : Terminal ➲ xcode-select --install
- Download Xcode : Terminal ➲ gcc
- Latest Update: Release V-3 Nov 2020 Compile more kext
### List of kexts:⬇︎

- AirportBrcmFixup.kext
- AppleALC.kext
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
- Lilu.kext
- NVMeFix.kext
- SMCBatteryManager.kext
- SMCDellSensors.kext
- SMCLightSensor.kext
- SMCProcessor.kext
- SMCSuperIO.kext
- VirtualSMC.kext
- VoodooPS2Controller.kext
- WhateverGreen.kext


- An easy builder of OpenCore (VirtualSMC / Other kext)
- Everything is create on a RAMDISK no fille on the system exepted nasm, the output is move on Desktop.
- Works in macOS Catalina 10.15, macOS Big Sur 11, macOS Monterey 12
- NOTE: Make sur Desktop/OpenCore folder not exist because the script will delete it and replace; if you have it rename or move it.

#### Credit: ☞ [acidanthera](https://github.com/acidanthera)
#### Download Release V3 ☞ [OpenCore Creator-V3.dmg ](https://github.com/chris1111/OpenCore-Creator/releases/tag/V3)

#### Open .dmg image then Move the App on Desktop
![Webp net-gifmaker](https://user-images.githubusercontent.com/6248794/88553305-200dcf80-cff3-11ea-97f6-c3dba49d363d.gif)

![Capture 0](https://user-images.githubusercontent.com/6248794/88550729-fef7af80-cfef-11ea-83e6-af116472889f.png)

![Capture 1](https://user-images.githubusercontent.com/6248794/88550516-b93ae700-cfef-11ea-92ff-2c2a9ab3acdb.png)

### How to Build
- Type 1 for build OpenCore
- Type 2 for build package Virtualsmc
- Type V for See OpenCore Commits
- Type X for EXIT

![Capture d’écran, le 2020-08-02 à 19 00 36](https://user-images.githubusercontent.com/6248794/89134373-a8f4a180-d4f2-11ea-8b1d-c2ca1b10ff97.png)
