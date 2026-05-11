@echo off
chcp 65001 >nul
title IberisUI - 외부 애드온 한글 패치 일괄 적용

echo ==================================================
echo   [1/2] Guidelime UI 한글 패치
echo ==================================================
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0guidelime_koKR_patch\Apply-GuidelimeKorean.ps1"
echo.

echo ==================================================
echo   [2/2] TUGs 얼라이언스 60-70 가이드 한글 패치
echo ==================================================
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0tugs_koKR_patch\Apply-TUGsKorean.ps1"

echo.
echo --------------------------------------------------
echo   전체 패치 완료. 게임에서 /reload 하세요.
echo   아무 키나 누르면 창이 닫힙니다.
echo --------------------------------------------------
pause >nul
