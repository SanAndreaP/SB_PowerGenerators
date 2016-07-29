@echo off
set sb_location="H:\Steam\steamapps\common\Starbound"
if exist powergenerators.pak ( del /f powergenerators.pak )
call %sb_location%\win32\asset_packer.exe mod_powergen powergenerators.pak
xcopy powergenerators.pak "%sb_location%\mods\" /C /F /R /Y
pause