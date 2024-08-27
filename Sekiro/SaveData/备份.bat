@echo off

set "source_folder=%USERPROFILE%\AppData\Roaming\Sekiro\76561198314144001"
set "backup_folder=%USERPROFILE%\AppData\Roaming\Sekiro\76561198314144001_bk"

rd /s /q "%backup_folder%"

xcopy "%source_folder%" "%backup_folder%" /E /I /H /K /Y