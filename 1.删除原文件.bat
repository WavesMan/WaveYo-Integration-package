@echo off
:: Check if running as administrator
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

@echo off
chcp 65001 > nul 2>&1

REM 设置文件列表，可以包含多个文件路径和文件夹路径，每个路径用空格分隔
set "file_list=%file_list% BepInEx\."
set "file_list=%file_list% BepInEx\cache\."

set "file_list=%file_list% BepInEx\config\."
set "file_list=%file_list% BepInEx\config\BrutalCompanyMinus\."
set "file_list=%file_list% BepInEx\config\EliteMasterEric-Coroner\."
set "file_list=%file_list% BepInEx\config\Translation\."
set "file_list=%file_list% BepInEx\config\zh-CN\."

set "file_list=%file_list% BepInEx\core\."

set "file_list=%file_list% BepInEx\patchers\."
set "file_list=%file_list% BepInEx\patchers\BepInEx.MonoMod.HookGenPatcher\."

set "file_list=%file_list% BepInEx\plugins\."
set "file_list=%file_list% BepInEx\plugins\HDLethalCompany\."
set "file_list=%file_list% BepInEx\plugins\LethalConfig\."
set "file_list=%file_list% BepInEx\plugins\MMHOOK\."
set "file_list=%file_list% BepInEx\plugins\MoreEmotes\."
set "file_list=%file_list% BepInEx\plugins\MoreShipUpgrades\."
set "file_list=%file_list% BepInEx\plugins\ShipLoot\."
set "file_list=%file_list% BepInEx\plugins\XUnity.AutoTranslator\."

REM 循环遍历文件列表并删除文件
for %%F in (%file_list%) do (
    if exist "%%F" (
        del /f /q "%%F"
        echo 删除文件 '%%F' 成功。
    ) else (
        echo 文件 '%%F' 不存在，无需删除。
    )
)

REM 循环遍历文件夹列表并删除文件夹
for %%D in (%folder_list%) do (
    if exist "%%D" (
        rd /s /q "%%D"
        echo 删除文件夹 '%%D' 成功。
    ) else (
        echo 文件夹 '%%D' 不存在，无需删除。
    )
)


REM 这里是脚本的其他部分，不会因为文件或文件夹不存在而受影响，可以继续运行。
pause

