# Changelog
- 2019.3.31
  - Update CLOVER version to 4903
  - Update drivers64UEFI based on Clover_v2.4k_r4903
  - Update AppleALC to 1.3.6
  - Update Lilu to 1.3.5
  - Update WhateverGreen to 1.2.7
  - Update CPUFriend to 1.1.6
  - Update ATH9KFixup to 1.3.3
  - Remove useless plugins of FakeSMC
  - Update FakePCIID version to 1.3.15
  - Update AppleBacklightFixup to 1.0.2

- 2018.10.13
  - Update CLOVER version to 4704
  - Update drivers64UEFI based on Clover_v2.4k_r4704
  - Update AppleALC to 1.3.2
  - Update Lilu to 1.2.7
  - Update WhateverGreen to 1.2.2
  - Update SMBIOS info
  - Update FakeSMC to 6.26-357
  - Update CPUFriend to 1.1.5
  - Update CodecCommander to 2.7.1
  - Added AppleBacklightFixup to use ACPIBacklight instead of IntelBacklight
  - Update ACPIBatteryManager to 1.90
  - Added config-mbp11,1、config-mba6,1
  - Update SSDT-RMCF from RehabMan's repository OS-X-Clover-Laptop-Config
  - Fixed ALCPlugFix for CX20751 LayoutID 3 and LayoutID 28
  - Added all plugins of FakeSMC to detect more sensor status info

- 2018.8.28
  - Update CLOVER version to 4662
  - Update drivers64UEFI based on Clover_v2.4k_r4662
  - Update AppleALC to 1.3.1
  - Update Lilu to 1.2.6
  - Update SMBIOS info
  - Added NoTouchID.kext to disable TouchID verify
  - Update SSDT-PCI-List and SSDT-RMCF

- 2018.8.5
  - Update CLOVER version to 4636
  - Update drivers64UEFI based on Clover_v2.4k_r4636
  - Update ATH9KFixup to support Mojave
  - Update CPUFriend to 1.1.4
  - Update WhateverGreen to 1.2.1
  - Clear unless device info in PCI-List
  - Use new way provided by WhateverGreen for framebuffer patch to replace KextToPatch
  - Update CPU info to i7
  - Update CPU Frequency to 2.7GHz
  - Update IGPU to Intel Iris Plus Graphics 655
  - Update SMBIOS to MacBook Pro15,2
  
  ![](https://raw.githubusercontent.com/athlonreg/BlogImages/master/Images/60/8d18a5fd6a30ada82cad14044f33df.jpg)

- 2018.7.20
  - Update CLOVER version to 4614
  - Update drivers64UEFI based on Clover_v2.4k_r4614
  - Added SSDT-ALS0.aml
  - Update AppleALC to 1.3.0
  - Update Lilu to 1.2.5
  - Merge all PCI SSDT to SSDT-PCI-List.aml
  - Merge IGFX and Shiki to WhateverGreen
  - Added SSDT-FnKey.aml
  - Added config-mbp151 and config-mbp152 to support future update
  - Clear one key hidpi script
  - Added working device desc
  
- 2018.6.29
  - Update CLOVER version to 4586
  - Update drivers64UEFI based on Clover_v2.4k_r4586
  - Delete some useless files in drivers64UEFI
  - Change Clover GUI themes to mNight credits [lihaoyun6](https://github.com/lihaoyun6)
  - Added mNight Clover GUI themes credits [lihaoyun6](https://github.com/lihaoyun6)

- 2018.6.18
  - Update AppleALC to compatable only for CX20751 layout-id 28
  - Update Lilu version to 1.2.4 for new api
  - Update CPUFriend version to 1.1.4
  - Update CLOVER version to 4558
  - Added ApfsDriverLoader.efi instead of apfs.efi
  - Update drivers64UEFI base on Clover_v2.4k_r4558
  - Remove unuse drivers in drivers64UEFI
  - Fixed some PCI device display to Driver Installed: Yes
  - Remove docs dir
  - Remove Tools dir
  - Remove unuse SSDT in ACPI/patched
  - Update one key hidpi

- 2018.6.8
  - Update AppleALC version to 1.2.8
  - Update Lilu version to 1.2.4
  - Update CLOVER version to 4522
  - Update apfs.efi based on macOS Mojave beta 1
  - Update drivers64UEFI based on Clover_v2.4k_r4522
  - Support macOS Mojave

- 2018.6.2
  - Update AppleALC version to 1.2.7
  - Update Shiki version to 2.2.7
  - Update CLOVER version to 4512 

- 2018.5.27
  - Fixed PCI Device Desc 
  - Update CLOVER version to 4499 
  - Added CsmVideoDxe-64.efi into drivers64UEFI 

- 2018.5.17 / Added PCI Device Desc 
  - Added HDEF Device Desc 
  - Added HDAU Device Desc 
  - Added Ethernet Device Desc 
  - Added SATA Device Desc 
  - Added EHC1 Device Desc 
  - Added XHCI Device Desc 
  - Added SBUS Device Desc 
  - Added IGPU Device Desc 
  - Added Airport Device Desc 
  - Added IMEI Device Desc 

  ![](http://ovefvi4g3.bkt.clouddn.com/15265693466666.jpg)

- 2018.5.4
  - Update CLOVER version to 4458
  - Update VRAM patch without changing graphics connector data
  - Change ig-platform-id to 0x0a260006 from 0x0a260005
  - Add ALCPlugFix-LayoutID=3.zip for cx20751/2 that Line In node is 0x18 

- 2018.4.22
  - Update AppleALC version to 1.2.7
  - Update FakePCIID version to 1.3.12
  - Update RTL8111 version to 2.2.2
  - Change ig-platform-id to 0x0a260005
  - Implement backlight by DSDT
  - Update CLOVER version to 4445

- 2018.4.11
  - Update Shiki version to 2.2.6
  - Update IntelGraphicsFixup to version to 1.2.7
  - Update ATH9KFixup and ATH9KInjector
  - Remove HibernationFixup 

- 2018.4.7
  - Update CLOVER to 4429
  - Update AppleALC to 1.2.5
  - Update Lilu to 1.2.3
  - Update FakeSMC to 6.26-344-g1cf53906.1787
  - Remove CodecCommander
  - Fix ACLPlugFix for CX20751
  - Fix a issue about display's color is too purple after enable HiDPI by `one key hidpi`
  - Improve the shell `one key hidpi`

- 2018.3.30
  - Update APFS.efi extract from macOS High Sierra 10.13.4
  - Change audio card from VoodooHDA to AppleALC by hotpatch
  - Update AppleALC version to 1.2.4
  - Update Shiki version to 2.2.5

- 2018.3.19
  - Change VRAM from 1536MB to 2048MB
  - Change graphics from Intel HD Graphics 4400 1536 MB to Intel HD Graphics 5000 2048 MB in About This Mac
  - Change audio card from AppleALC to VoodooHDA by hotpatch
  - Update Lilu version to 1.2.2
  - Update AppleALC version to 1.2.3
  - Update Shiki version to 2.2.4
  - Update IntelGrphicsFixup version to 1.2.6
  - Update CPUFriend version to 1.1.2
  - Add HibernationFixup version 1.2.0
  - Add ATH9KFixup version 1.2.0
  - Merge all acpi sets with static


