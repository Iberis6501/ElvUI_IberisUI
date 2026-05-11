@echo off
chcp 65001 >nul
title Guidelime 한글 패치 - IberisUI

powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Apply-GuidelimeKorean.ps1"

echo.
echo --------------------------------------------------
echo  완료. 아무 키나 누르면 창이 닫힙니다.
echo --------------------------------------------------
pause >nul
