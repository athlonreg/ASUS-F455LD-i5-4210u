# Changelog
- 2018.6.8
  - Update AppleALC version to 1.2.8
  - Update Lilu version to 1.2.4
  - Update CLOVER version to 4522
  - Update apfs.efi based on macOS Mojave beta 1
  - Update drivers64UEFI base on Clover_v2.4k_r4522
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


