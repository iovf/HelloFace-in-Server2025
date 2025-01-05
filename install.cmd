set MT=e:\iso\222
@echo off

dism /image:%MT% /add-package /packagepath:Package\Microsoft-Windows-Client-Features-Package07~31bf3856ad364e35~amd64~~10.0.26100.1.mum
dism /image:%MT% /add-package /packagepath:Package\Microsoft-Windows-Hello-Face-Package~31bf3856ad364e35~amd64~~10.0.26100.1.mum
dism /image:%MT% /add-package /packagepath:Package\Microsoft-Windows-Client-Desktop-Required-Package01~31bf3856ad364e35~amd64~~10.0.26100.1.mum


reg load  HKLM\SYSTEM2 %MT%\windows\system32\config\system
reg load  HKLM\DEFAULT2 %MT%\windows\system32\config\DEFAULT
reg load  HKLM\DRIVERS2 %MT%\windows\system32\config\DRIVERS
reg load  HKLM\COMPONENTS2 %MT%\windows\system32\config\COMPONENTS
reg load  HKLM\SOFTWARE2 %MT%\windows\system32\config\SOFTWARE
reg load  HKLM\userdata2 %MT%\Users\Default\NTUSER.DAT

reg.exe import Package\reg.reg

reg unload  HKLM\SYSTEM2
reg unload  HKLM\DEFAULT2 
reg unload  HKLM\DRIVERS2
reg unload  HKLM\SOFTWARE2 
reg unload  HKLM\COMPONENTS2 
reg unload  HKLM\userdata2 

xcopy File %MT% /e /i /h /y
del %MT%\windows\inf\bthpan.inf /q
del %MT%\windows\inf\bthprint.inf /q
del %MT%\windows\inf\bthspp.inf /q
del %MT%\windows\inf\circlass.inf /q
del %MT%\windows\inf\hidbth.inf /q
del %MT%\windows\inf\hidi2c.inf /q
del %MT%\windows\inf\hidir.inf /q
del %MT%\windows\inf\hidirkbd.inf /q
del %MT%\windows\inf\hidspi_km.inf /q
del %MT%\windows\inf\mdmbtmdm.inf /q
del %MT%\windows\inf\mdmirmdm.inf /q
del %MT%\windows\inf\mdmnokia.inf /q
del %MT%\windows\inf\msdri.inf /q
del %MT%\windows\inf\netirda.inf /q
del %MT%\windows\inf\usbcir.inf /q

dism /image:%MT% /add-driver /driver:inf /forceunsigned