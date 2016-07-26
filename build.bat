@echo off
set sb_location="D:\Steam\steamapps\common\Starbound"
set /p verstr=Enter version string: 
del /f powergenerators.modpak
%sb_location%\win64\asset_packer.exe "Power Generators %verstr%" mod_powergen powergenerators.modpak
xcopy powergenerators.modpak "%sb_location%\giraffe_storage\mods" /C /F /R /Y
pause