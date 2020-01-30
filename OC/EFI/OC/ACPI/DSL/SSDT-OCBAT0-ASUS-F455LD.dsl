//
// _BIX to XBIX
// Find:    5F424958 00
// Replace: 58424958 00
//
// TACH to XACH
// Find:    54414348 09
// Replace: 58414348 09
//
// BIFA to XIFA
// Find:    42494641 00
// Replace: 58494641 00
//
// SMBR to XMBR
// Find:    534D4252 0B
// Replace: 584D4252 0B
//
// SMBW to XMBW
// Find:    534D4257 0D
// Replace: 584D4257 0D
//
// ECSB to XCSB
// Find:    45435342 07
// Replace: 58435342 07
//
DefinitionBlock ("", "SSDT", 2, "hack", "BAT0", 0x00000000)
{
    External (_SB.PCI0.LPCB.EC0, DeviceObj)
    External (_SB.PCI0.BAT0, DeviceObj)
    External (_SB.PCI0.BAT0._BIF, MethodObj)
    External (_SB.PCI0.BAT0.XBIX, MethodObj)
    External (_SB.PCI0.BAT0.BIXT, PkgObj)
    External (_SB.PCI0.BAT0.NBIX, PkgObj)
    External (_SB.PCI0.BAT0.PBIF, PkgObj)
    External (_SB.PCI0.LPCB.EC0.ADD2, FieldUnitObj)
    External (_SB.PCI0.LPCB.EC0.ADDR, FieldUnitObj)
    External (_SB.PCI0.LPCB.EC0.BATP, MethodObj)
    External (_SB.PCI0.LPCB.EC0.BCN2, FieldUnitObj)
    External (_SB.PCI0.LPCB.EC0.BCNT, FieldUnitObj)
    External (_SB.PCI0.LPCB.EC0.CMD2, FieldUnitObj)
    External (_SB.PCI0.LPCB.EC0.CMDB, FieldUnitObj)
    External (_SB.PCI0.LPCB.EC0.DA20, FieldUnitObj)
    External (_SB.PCI0.LPCB.EC0.DA21, FieldUnitObj)
    External (_SB.PCI0.LPCB.EC0.DAT0, FieldUnitObj)
    External (_SB.PCI0.LPCB.EC0.DAT1, FieldUnitObj)
    External (_SB.PCI0.LPCB.EC0.ECAV, MethodObj)
    External (_SB.PCI0.LPCB.EC0.GBTT, MethodObj)
    External (_SB.PCI0.LPCB.EC0.MUEC, MutexObj)
    External (_SB.PCI0.LPCB.EC0.PRT2, FieldUnitObj)
    External (_SB.PCI0.LPCB.EC0.PRTC, FieldUnitObj)
    External (_SB.PCI0.LPCB.EC0.RCBT, IntObj)
    External (_SB.PCI0.LPCB.EC0.RDBL, IntObj)
    External (_SB.PCI0.LPCB.EC0.RDBT, IntObj)
    External (_SB.PCI0.LPCB.EC0.RDQK, IntObj)
    External (_SB.PCI0.LPCB.EC0.RDWD, IntObj)
    External (_SB.PCI0.LPCB.EC0.SBBY, IntObj)
    External (_SB.PCI0.LPCB.EC0.SDBT, IntObj)
    External (_SB.PCI0.LPCB.EC0.SST2, FieldUnitObj)
    External (_SB.PCI0.LPCB.EC0.SSTS, FieldUnitObj)
    External (_SB.PCI0.LPCB.EC0.SWTC, MethodObj)
    External (_SB.PCI0.LPCB.EC0.WRBL, IntObj)
    External (_SB.PCI0.LPCB.EC0.WRBT, IntObj)
    External (_SB.PCI0.LPCB.EC0.WRQK, IntObj)
    External (_SB.PCI0.LPCB.EC0.WRWD, IntObj)
    External (BSLF, IntObj)
    External (_SB.PCI0.LPCB.EC0.XACH, MethodObj)
    External (_SB.PCI0.LPCB.EC0.XIFA, MethodObj)
    External (_SB.PCI0.LPCB.EC0.XMBR, MethodObj)
    External (_SB.PCI0.LPCB.EC0.XMBW, MethodObj)
    External (_SB.PCI0.LPCB.EC0.XCSB, MethodObj)
    
    Method (B1B2, 2, NotSerialized)
    {
        Return ((Arg0 | (Arg1 << 0x08)))
    }
    
    Scope (_SB.PCI0.LPCB.EC0)
    {
        Method (RE1B, 1, NotSerialized)
        {
            OperationRegion(ERAM, EmbeddedControl, Arg0, 1)
            Field(ERAM, ByteAcc, NoLock, Preserve) { BYTE, 8 }
            Return(BYTE)
        }
        Method (RECB, 2, Serialized)
        {
            ShiftRight(Arg1, 3, Arg1)
            Name(TEMP, Buffer(Arg1) { })
            Add(Arg0, Arg1, Arg1)
            Store(0, Local0)
            While (LLess(Arg0, Arg1))
            {
                Store(RE1B(Arg0), Index(TEMP, Local0))
                Increment(Arg0)
                Increment(Local0)
            }
            Return(TEMP)
        }
        
        Method (WE1B, 2, NotSerialized)
        {
            OperationRegion(ERAM, EmbeddedControl, Arg0, 1)
            Field(ERAM, ByteAcc, NoLock, Preserve) { BYTE, 8 }
            Store(Arg1, BYTE)
        }
        Method (WECB, 3, Serialized)
        {
            ShiftRight(Arg1, 3, Arg1)
            Name(TEMP, Buffer(Arg1) { })
            Store(Arg2, TEMP)
            Add(Arg0, Arg1, Arg1)
            Store(0, Local0)
            While (LLess(Arg0, Arg1))
            {
                WE1B(Arg0, DerefOf(Index(TEMP, Local0)))
                Increment(Arg0)
                Increment(Local0)
            }
        }
        
        OperationRegion (BAM0, EmbeddedControl, Zero, 0xFF)
            Field (BAM0, ByteAcc, Lock, Preserve)
            {
                Offset (0x93), 
                TH00,8,TH01,8,//TAH0,   16, 
                TH10,8,TH11,8,//TAH1,   16, 
                ,   8, 
                Offset (0xB4), 
                Offset (0xB6), 
                Offset (0xB8), 
                Offset (0xBA), 
                Offset (0xBC), 
                Offset (0xBE), 
                ,   16, 
                ,   16, 
                ,   16, 
                BC30,8,BC31,8,//B0C3,   16, 
                Offset (0xF4), 
                B0S0,8,B0S1,8,//B0SN,   16, 
                Offset (0xF8), 
                Offset (0xFA), 
                Offset (0xFC), 
                B1S0,8,B1S1,8//B1SN,   16
            }

            OperationRegion (BAM1, EmbeddedControl, 0x18, 0x28)
            Field (BAM1, ByteAcc, NoLock, Preserve)
            {
                ,   8, 
                ,   5, 
                    ,   1, 
                ,   1, 
                ,   1, 
                ,   8, 
                ,   8, 
                XXXX, 256, //BDAT,   256, Offset (0x04) ,RECB(0x04,256)
                ,   8, 
                    ,   1, 
                ,   7, 
                ,   8, 
                ,   8
            }
            
            Field (BAM1, ByteAcc, NoLock, Preserve)
            {
                Offset (0x04), 
                DT20,8,DT21,8,    //DT2B,   16
            }

            OperationRegion (BAM2, EmbeddedControl, 0x40, 0x28)
            Field (BAM2, ByteAcc, NoLock, Preserve)
            {
                ,   8, 
                ,   5, 
                    ,   1, 
                ,   1, 
                ,   1, 
                ,   8, 
                ,   8, 
                YYYY, 256, //BDA2,   256
                ,   8, 
                    ,   1, 
                ,   7, 
                ,   8, 
                ,   8
            }
    }

    Scope (_SB.PCI0.BAT0)
    {
        Method (_BIX, 0, NotSerialized)  // _BIX: Battery Information Extended
        {
            If (_OSI ("Darwin"))
            {
                If (!^^LPCB.EC0.BATP (Zero))
                {
                    Return (NBIX) /* \_SB_.PCI0.BAT0.NBIX */
                }

                If ((^^LPCB.EC0.GBTT (Zero) == 0xFF))
                {
                    Return (NBIX) /* \_SB_.PCI0.BAT0.NBIX */
                }

                _BIF ()
                BIXT [One] = DerefOf (PBIF [Zero])
                BIXT [0x02] = DerefOf (PBIF [One])
                BIXT [0x03] = DerefOf (PBIF [0x02])
                BIXT [0x04] = DerefOf (PBIF [0x03])
                BIXT [0x05] = DerefOf (PBIF [0x04])
                BIXT [0x06] = DerefOf (PBIF [0x05])
                BIXT [0x07] = DerefOf (PBIF [0x06])
                BIXT [0x0E] = DerefOf (PBIF [0x07])
                BIXT [0x0F] = DerefOf (PBIF [0x08])
                BIXT [0x10] = DerefOf (PBIF [0x09])
                BIXT [0x11] = DerefOf (PBIF [0x0A])
                BIXT [0x12] = DerefOf (PBIF [0x0B])
                BIXT [0x13] = DerefOf (PBIF [0x0C])
                If ((DerefOf (BIXT [One]) == One))
                {
                    BIXT [One] = Zero
                    Local0 = DerefOf (BIXT [0x05])
                    BIXT [0x02] = (DerefOf (BIXT [0x02]) * Local0)
                    BIXT [0x03] = (DerefOf (BIXT [0x03]) * Local0)
                    BIXT [0x06] = (DerefOf (BIXT [0x06]) * Local0)
                    BIXT [0x07] = (DerefOf (BIXT [0x07]) * Local0)
                    BIXT [0x0E] = (DerefOf (BIXT [0x0E]) * Local0)
                    BIXT [0x0F] = (DerefOf (BIXT [0x0F]) * Local0)
                    Divide (DerefOf (BIXT [0x02]), 0x03E8, Local0, BIXT [0x02])
                    Divide (DerefOf (BIXT [0x03]), 0x03E8, Local0, BIXT [0x03])
                    Divide (DerefOf (BIXT [0x06]), 0x03E8, Local0, BIXT [0x06])
                    Divide (DerefOf (BIXT [0x07]), 0x03E8, Local0, BIXT [0x07])
                    Divide (DerefOf (BIXT [0x0E]), 0x03E8, Local0, BIXT [0x0E])
                    Divide (DerefOf (BIXT [0x0F]), 0x03E8, Local0, BIXT [0x0F])
                }

                BIXT [0x08] = B1B2 (^^LPCB.EC0.BC30, ^^LPCB.EC0.BC31) /* \_SB.PCI0.LPCB.EC0.B0C3 */
                BIXT [0x09] = 0x0001869F
                Return (BIXT) /* \_SB_.PCI0.BAT0.BIXT */
            }
            Else
            {
                Return (\_SB.PCI0.BAT0.XBIX ())
            }
        }
    }

    Scope (_SB.PCI0.LPCB.EC0)
    {
        Method (TACH, 1, Serialized)
        {
            If (_OSI ("Darwin"))
            {
            If (ECAV ())
            {
                Switch (Arg0)
                {
                    Case (Zero)
                    {
                        Local0 = B1B2 (TH00, TH01) /* \_SB.PCI0.LPCB.EC0.TAH0 */
                        Break
                    }
                    Case (One)
                    {
                        Local0 = B1B2 (TH10, TH11) /* \_SB.PCI0.LPCB.EC0.TAH1 */
                        Break
                    }
                    Default
                    {
                        Return (Ones)
                    }

                }

                Local0 *= 0x02
                If ((Local0 != Zero))
                {
                    Divide (0x0041CDB4, Local0, Local1, Local0)
                    Return (Local0)
                }
                Else
                {
                    Return (Ones)
                }
            }
            Else
            {
                Return (Ones)
            }
            }
            Else
            {
                Return (\_SB.PCI0.LPCB.EC0.XACH (Arg0))
            }
        }
        
        Method (BIFA, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
            If (ECAV ())
            {
                If (BSLF)
                {
                    Local0 = B1B2 (B1S0, B1S1) /* \_SB.PCI0.LPCB.EC0.B1SN */
                }
                Else
                {
                    Local0 = B1B2 (B0S0, B0S1) /* \_SB.PCI0.LPCB.EC0.B0SN */
                }
            }
            Else
            {
                Local0 = Ones
            }

            Return (Local0)
            }
            Else
            {
                Return (\_SB.PCI0.LPCB.EC0.XIFA ())
            }
        }
        
        Method (SMBR, 3, Serialized)
        {
            If (_OSI ("Darwin"))
            {
            Local0 = Package (0x03)
                {
                    0x07, 
                    Zero, 
                    Zero
                }
            If (!ECAV ())
            {
                Return (Local0)
            }

            If ((Arg0 != RDBL))
            {
                If ((Arg0 != RDWD))
                {
                    If ((Arg0 != RDBT))
                    {
                        If ((Arg0 != RCBT))
                        {
                            If ((Arg0 != RDQK))
                            {
                                Return (Local0)
                            }
                        }
                    }
                }
            }

            Acquire (MUEC, 0xFFFF)
            Local1 = PRTC /* \_SB.PCI0.LPCB.EC0.PRTC */
            Local2 = Zero
            While ((Local1 != Zero))
            {
                Stall (0x0A)
                Local2++
                If ((Local2 > 0x03E8))
                {
                    Local0 [Zero] = SBBY /* \_SB.PCI0.LPCB.EC0.SBBY */
                    Local1 = Zero
                }
                Else
                {
                    Local1 = PRTC /* \_SB.PCI0.LPCB.EC0.PRTC */
                }
            }

            If ((Local2 <= 0x03E8))
            {
                Local3 = (Arg1 << One)
                Local3 |= One
                ADDR = Local3
                If ((Arg0 != RDQK))
                {
                    If ((Arg0 != RCBT))
                    {
                        CMDB = Arg2
                    }
                }

                WECB(0x04,256,Zero)
                PRTC = Arg0
                Local0 [Zero] = SWTC (Arg0)
                If ((DerefOf (Local0 [Zero]) == Zero))
                {
                    If ((Arg0 == RDBL))
                    {
                        Local0 [One] = BCNT /* \_SB.PCI0.LPCB.EC0.BCNT */
                        Local0 [0x02] = RECB(0x04,256) /* \_SB.PCI0.LPCB.EC0.BDAT */
                    }

                    If ((Arg0 == RDWD))
                    {
                        Local0 [One] = 0x02
                        Local0 [0x02] = B1B2 (\_SB.PCI0.LPCB.EC0.DT20, \_SB.PCI0.LPCB.EC0.DT21) /* \_SB.PCI0.LPCB.EC0.DT2B */
                    }

                    If ((Arg0 == RDBT))
                    {
                        Local0 [One] = One
                        Local0 [0x02] = DAT0 /* \_SB.PCI0.LPCB.EC0.DAT0 */
                    }

                    If ((Arg0 == RCBT))
                    {
                        Local0 [One] = One
                        Local0 [0x02] = DAT0 /* \_SB.PCI0.LPCB.EC0.DAT0 */
                    }
                }
            }

            Release (MUEC)
            Return (Local0)
            }
            Else
            {
                Return (\_SB.PCI0.LPCB.EC0.XMBR (Arg0, Arg1, Arg2))
            }
        }
        
        Method (SMBW, 5, Serialized)
        {
            If (_OSI ("Darwin"))
            {
            Local0 = Package (0x01)
                {
                    0x07
                }
            If (!ECAV ())
            {
                Return (Local0)
            }

            If ((Arg0 != WRBL))
            {
                If ((Arg0 != WRWD))
                {
                    If ((Arg0 != WRBT))
                    {
                        If ((Arg0 != SDBT))
                        {
                            If ((Arg0 != WRQK))
                            {
                                Return (Local0)
                            }
                        }
                    }
                }
            }

            Acquire (MUEC, 0xFFFF)
            Local1 = PRTC /* \_SB.PCI0.LPCB.EC0.PRTC */
            Local2 = Zero
            While ((Local1 != Zero))
            {
                Stall (0x0A)
                Local2++
                If ((Local2 > 0x03E8))
                {
                    Local0 [Zero] = SBBY /* \_SB.PCI0.LPCB.EC0.SBBY */
                    Local1 = Zero
                }
                Else
                {
                    Local1 = PRTC /* \_SB.PCI0.LPCB.EC0.PRTC */
                }
            }

            If ((Local2 <= 0x03E8))
            {
                WECB(0x04,256,Zero)
                Local3 = (Arg1 << One)
                ADDR = Local3
                If ((Arg0 != WRQK))
                {
                    If ((Arg0 != SDBT))
                    {
                        CMDB = Arg2
                    }
                }

                If ((Arg0 == WRBL))
                {
                    BCNT = Arg3
                    WECB(0x04,256,Arg4)
                }

                If ((Arg0 == WRWD))
                {
                    B1B2 (\_SB.PCI0.LPCB.EC0.DT20, \_SB.PCI0.LPCB.EC0.DT21) = Arg4
                }

                If ((Arg0 == WRBT))
                {
                    DAT0 = Arg4
                }

                If ((Arg0 == SDBT))
                {
                    DAT0 = Arg4
                }

                PRTC = Arg0
                Local0 [Zero] = SWTC (Arg0)
            }

            Release (MUEC)
            Return (Local0)
            }
            Else
            {
                Return (\_SB.PCI0.LPCB.EC0.XMBW (Arg0, Arg1, Arg2, Arg3, Arg4))
            }
        }
        
        Method (ECSB, 7, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
            Local1 = Package (0x05)
                {
                    0x11, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Buffer (0x20){}
                }
            If ((Arg0 > One))
            {
                Return (Local1)
            }

            If (ECAV ())
            {
                Acquire (MUEC, 0xFFFF)
                If ((Arg0 == Zero))
                {
                    Local0 = PRTC /* \_SB.PCI0.LPCB.EC0.PRTC */
                }
                Else
                {
                    Local0 = PRT2 /* \_SB.PCI0.LPCB.EC0.PRT2 */
                }

                Local2 = Zero
                While ((Local0 != Zero))
                {
                    Stall (0x0A)
                    Local2++
                    If ((Local2 > 0x03E8))
                    {
                        Local1 [Zero] = SBBY /* \_SB.PCI0.LPCB.EC0.SBBY */
                        Local0 = Zero
                    }
                    ElseIf ((Arg0 == Zero))
                    {
                        Local0 = PRTC /* \_SB.PCI0.LPCB.EC0.PRTC */
                    }
                    Else
                    {
                        Local0 = PRT2 /* \_SB.PCI0.LPCB.EC0.PRT2 */
                    }
                }

                If ((Local2 <= 0x03E8))
                {
                    If ((Arg0 == Zero))
                    {
                        ADDR = Arg2
                        CMDB = Arg3
                        If (((Arg1 == 0x0A) || (Arg1 == 0x0B)))
                        {
                            BCNT = DerefOf (Arg6 [Zero])
                            WECB(0x04,256,DerefOf (Arg6 [One]))
                        }
                        Else
                        {
                            DAT0 = Arg4
                            DAT1 = Arg5
                        }

                        PRTC = Arg1
                    }
                    Else
                    {
                        ADD2 = Arg2
                        CMD2 = Arg3
                        If (((Arg1 == 0x0A) || (Arg1 == 0x0B)))
                        {
                            BCN2 = DerefOf (Arg6 [Zero])
                            WECB(0x04,256,DerefOf (Arg6 [One]))
                        }
                        Else
                        {
                            DA20 = Arg4
                            DA21 = Arg5
                        }

                        PRT2 = Arg1
                    }

                    Local0 = 0x7F
                    If ((Arg0 == Zero))
                    {
                        While (PRTC)
                        {
                            Sleep (One)
                            Local0--
                        }
                    }
                    Else
                    {
                        While (PRT2)
                        {
                            Sleep (One)
                            Local0--
                        }
                    }

                    If (Local0)
                    {
                        If ((Arg0 == Zero))
                        {
                            Local0 = SSTS /* \_SB.PCI0.LPCB.EC0.SSTS */
                            Local1 [One] = DAT0 /* \_SB.PCI0.LPCB.EC0.DAT0 */
                            Local1 [0x02] = DAT1 /* \_SB.PCI0.LPCB.EC0.DAT1 */
                            Local1 [0x03] = BCNT /* \_SB.PCI0.LPCB.EC0.BCNT */
                            Local1 [0x04] = RECB(0x04,256) /* \_SB.PCI0.LPCB.EC0.BDAT */
                        }
                        Else
                        {
                            Local0 = SST2 /* \_SB.PCI0.LPCB.EC0.SST2 */
                            Local1 [One] = DA20 /* \_SB.PCI0.LPCB.EC0.DA20 */
                            Local1 [0x02] = DA21 /* \_SB.PCI0.LPCB.EC0.DA21 */
                            Local1 [0x03] = BCN2 /* \_SB.PCI0.LPCB.EC0.BCN2 */
                            Local1 [0x04] = RECB(0x04,256) /* \_SB.PCI0.LPCB.EC0.BDA2 */
                        }

                        Local0 &= 0x1F
                        If (Local0)
                        {
                            Local0 += 0x10
                        }

                        Local1 [Zero] = Local0
                    }
                    Else
                    {
                        Local1 [Zero] = 0x10
                    }
                }

                Release (MUEC)
            }

            Return (Local1)
            }
            Else
            {
                Return (\_SB.PCI0.LPCB.EC0.XCSB (Arg0, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6))
            }
        }
    }
}