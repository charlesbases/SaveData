@echo off

set "source_folder=%USERPROFILE%\AppData\Roaming\Sekiro\76561198314144001"
set "backup_folder=%USERPROFILE%\AppData\Roaming\Sekiro\76561198314144001_bk"

rd /s /q "%source_folder%"

xcopy "%backup_folder%" "%source_folder%" /E /I /H /K /Y