@echo off
:: Check if running as administrator
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

@echo off
chcp 65001 > nul 2>&1

REM 设置文件列表，可以包含多个文件路径和文件夹路径，每个路径用空格分隔
set "file_list=%file_list% BepInEx\."


REM 循环遍历文件列表并删除文件
for %%F in (%file_list%) do (
    if exist "%%F" (
        del /s /q "%%F"
        echo 删除文件 '%%F' 成功。
    ) else (
        echo 文件 '%%F' 不存在，无需删除。
    )
)

REM 循环遍历文件夹列表并删除文件夹
for %%D in (%folder_list%) do (
    if exist "%%D" (
        rd /s /q "BepInEx\."
        echo 删除文件夹 'BepInEx' 成功。
    ) else (
        echo 文件夹 'BepInEx' 不存在，无需删除。
    )
)


REM 这里是脚本的其他部分，不会因为文件或文件夹不存在而受影响，可以继续运行。
pause
