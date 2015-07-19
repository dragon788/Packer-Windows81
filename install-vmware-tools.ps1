# from /Applications/VMware Fusion.app/Contents/Library/isoimages/windows.iso

&"c:\7-zip\7z.exe" x "C:\Windows\Temp\windows.iso" -oc:\windows\temp\vmware -aoa | Out-Host
&C:\Windows\Temp\vmware\setup64.exe /S /v`"/qn REBOOT=R`" | Out-Host

exit 0
