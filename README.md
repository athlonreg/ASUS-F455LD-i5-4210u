### Laptop Configuration

```
Computer model              Asus F455LD Notebook

CPU                         Intel Core i5-4210u

Operate System              Windows10 Education 64bit + macOS High Sierra 17B25c
                            + Windows7 Ultimate + ElementaryOS base on Ubuntu 16.04

Main board                  Asus X455LD Intel Haswell-ULT - Lynx Point-LP

Discret egraphics           Nvidia GeForce 820M 2G 

Integrated graphics         HD4400

Audio                       Realtek @ Intel Lynx Point-LP  High Definition Audio (CX20751)

Ethernet                    Realtek RTL8168/8111/8112 Gigabit Ethernet Controller / Asus

Wireless network adapter    Atheros AR956X
```

### Clover EFI bootloader
You can download the Clover EFI bootloader on [ASUS-F455LD-i5-4210u](https://github.com/athlonreg/ASUS-F455LD-i5-4210u/releases)。
    
And please respect the author’s work and please indicate the address of the original post if you want reprint the repo!

### Credits
- [syscl](https://github.com/syscl)
- [RehabMan](https://github.com/RehabMan)
- [PMheart](https://github.com/PMheart)
- [chunnann](https://github.com/chunnann)
- [vit9696](https://github.com/vit9696)
- so on ...

### Changelog
#### 2018.4.11
- Update Shiki version to 2.2.6

#### 2018.4.7
- Update CLOVER to 4429
- Update AppleALC to 1.2.5
- Update Lilu to 1.2.3
- Update FakeSMC to 6.26-344
- Remove CodecCommander
- Fix ACLPlugFix for CX20751
- Fix a issue about display's color is too purple after enable HiDPI by `one key hidpi`
- Improve the shell `one key hidpi`

#### 2018.3.31
- Change SMBIOS from MacBookPro11,1 to MacBookAir6,2
- Update CPUFriend.kext for new MacBookAir6,2 SMBIOS

#### 2018.3.30
- Update APFS.efi extract from macOS High Sierra 10.13.4
- Change audio card from VoodooHDA to AppleALC by hotpatch
- Update AppleALC version to 1.2.4
- Update Shiki version to 2.2.5

#### 2018.3.19
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


