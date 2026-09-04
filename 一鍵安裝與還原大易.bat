@echo off
chcp 65001 >nul
title Rime 小狼毫 大易輸入法一鍵安裝程式
echo ========================================================
echo   Rime 小狼毫 大易輸入法 (全量完整碼表 + 微軟標準選字鍵)
echo ========================================================
echo.

set TARGET_DIR=%APPDATA%\Rime

if not exist "%TARGET_DIR%" (
    echo [建立目錄] %TARGET_DIR%
    mkdir "%TARGET_DIR%"
)

echo [複製檔案] 正在複製設定與字典檔至 %TARGET_DIR%...
copy /Y "%~dp0dayi4.schema.yaml" "%TARGET_DIR%\" >nul
copy /Y "%~dp0dayi4.dict.yaml" "%TARGET_DIR%\" >nul
copy /Y "%~dp0default.custom.yaml" "%TARGET_DIR%\" >nul
copy /Y "%~dp0weasel.custom.yaml" "%TARGET_DIR%\" >nul

echo [重新部署] 正在重新編譯與部署小狼毫...
if exist "C:\Program Files\Rime\weasel-0.17.4\WeaselDeployer.exe" (
    "C:\Program Files\Rime\weasel-0.17.4\WeaselDeployer.exe" /deploy
) else if exist "C:\Program Files (x86)\Rime\weasel\WeaselDeployer.exe" (
    "C:\Program Files (x86)\Rime\weasel\WeaselDeployer.exe" /deploy
) else if exist "%ProgramFiles%\Rime\weasel\WeaselDeployer.exe" (
    "%ProgramFiles%\Rime\weasel\WeaselDeployer.exe" /deploy
) else (
    echo 提示：請至 Windows 右下角通知區的小狼毫圖示右鍵點選「重新部署」。
)

echo.
echo ========================================================
echo   安裝與部署完成！
echo   請按 Win + Space 或 Ctrl + Shift 切換至小狼毫即可使用。
echo ========================================================
echo.
pause
