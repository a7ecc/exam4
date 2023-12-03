@echo off
copy ps.exe "%temp%\ps.exe"
set tempname=thistesttt
set exename=telegram
set location=%appdata%\Telegram Desktop\Telegram.exe
set exename2=ps
set location2=%temp%\ps.exe
:first
if not exist "%temp%\%tempname%.bat" goto bat
if not exist "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\%tempname%.vbs" goto vbs
if not exist "%temp%\%tempname%.ps1" goto ps1
cd "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup"
%tempname%.vbs
exit
:bat
echo taskkill /f /im powershell.exe >%temp%\%tempname%.bat
echo powershell.exe -ExecutionPolicy Bypass -File "%temp%\%tempname%.ps1">>%temp%\%tempname%.bat
goto first
:vbs
echo Set WshShell = CreateObject("WScript.Shell") > "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\%tempname%.vbs" 
echo WshShell.Run """%temp%\%tempname%.bat""", 0 >> "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\%tempname%.vbs"
echo Set WshShell = Nothing >> "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\%tempname%.vbs"
goto first
:ps1
echo for (;;){If((Get-Process -Name LockDownBrowserLabOEM -ErrorAction SilentlyContinue)){Start-Sleep -Seconds 30 > %temp%\%tempname%.bat
echo If(!(Get-Process -Name %exename% -ErrorAction SilentlyContinue)){Invoke-Item '%location%'}If(!(Get-Process -Name %exename2% -ErrorAction SilentlyContinue)){Invoke-Item '%location2%'}$User32 = Add-Type -Debug:$False -MemberDefinition '[DllImport("user32.dll")] public static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter, int X,int Y, int cx, int cy, uint uFlags);' -Name "User32Functions" -namespace User32Functions -PassThru ; $Handle = (Get-Process -Name '%exename%').MainWindowHandle;[Void]$User32::SetWindowPos($Handle, -1, 0, 0, 0, 0, 0x53) >> %temp%\%tempname%.bat
echo $wshell = New-Object -ComObject wscript.shell >> %temp%\%tempname%.bat
echo $wshell.AppActivate('%exename%')}} >> %temp%\%tempname%.bat
goto first