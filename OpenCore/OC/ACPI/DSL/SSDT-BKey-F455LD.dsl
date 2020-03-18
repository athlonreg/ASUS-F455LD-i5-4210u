//
// _Q0E to XQ0E
// Find:    5f51 3045
// Replace: 5851 3045
//
// _Q0F to XQ0F
// Find:    5f51 3046
// Replace: 5851 3046
//
DefinitionBlock ("", "SSDT", 2, "hack", "BrightFN", 0x00000000)
{
    External (_SB_.PCI0.LPCB.EC0_, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_.XQ0E, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC0_.XQ0F, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)
    External (_SB_.PCI0.LPCB.PS2M, DeviceObj)

    Scope (_SB.PCI0.LPCB.EC0)
    {
        Method (_Q0E, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.PS2K, 0x10) // Reserved
                Notify (\_SB.PCI0.LPCB.PS2M, 0x10) // Reserved
            }
            Else
            {
                \_SB.PCI0.LPCB.EC0.XQ0E ()
            }
        }

        Method (_Q0F, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.PS2K, 0x20) // Reserved
                Notify (\_SB.PCI0.LPCB.PS2M, 0x20) // Reserved
            }
            Else
            {
                \_SB.PCI0.LPCB.EC0.XQ0F ()
            }
        }
    }
}

