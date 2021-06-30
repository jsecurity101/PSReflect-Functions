function RegLoadKeyW
{
    <#
    .SYNOPSIS

    

    .PARAMETER KeyName

    

    .PARAMETER DesiredAccess

    
    
    .NOTES

    Author: Jonathan Johnson (@jsecurity101)
    License: BSD 3-Clause
    Required Dependencies: PSReflect
    Optional Dependencies: None

     (func advapi32 RegLoadKeyW ([IntPtr]) @(
      [IntPtr], # HKEY    hKey
      [string], # LPCWSTR lpSubKey
      [string]  # LPCWSTR lpFile
    ) -EntryPoint RegLoadKeyW)
    .LINK

    https://msdn.microsoft.com/en-us/library/windows/hardware/ff566425(v=vs.85).aspx

    .EXAMPLE
    
    

    #>

    #$hKey = "\Registry\HKEY_LOCAL_MACHINE"
    #$lpSubKey = "\SOFTWARE\test"
    #$lpFile = "C:\Users\Admin\Desktop\test.reg"

    $RESULT = $advapi32::RegLoadKeyW([IntPtr]0x80000002, 'PsReflect', 'C:\Users\Admin\Desktop\test')

    if(-not $RESULT) 
    {
        Write-Debug "RegLoadKeyW Error: $(([ComponentModel.Win32Exception] $LastError).Message)"
    }
    Write-Output $RESULT

    # free our memory after allocation
    #[System.Runtime.InteropServices.Marshal]::FreeHGlobal($objectAttribute.ObjectName)
}