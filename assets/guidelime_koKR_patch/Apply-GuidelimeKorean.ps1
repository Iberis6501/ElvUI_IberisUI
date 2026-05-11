# Apply-GuidelimeKorean.ps1
#
# IberisUI: Guidelime/Localization.lua의 koKR 블록을 strings_koKR.lua 내용으로 교체합니다.
#
# 동작:
#   1. 설치된 모든 WoW 클라이언트(_retail_/_classic_/_classic_era_/_anniversary_/_ptr_/_beta_)의
#      Interface\AddOns\Guidelime\Localization.lua를 자동 탐색
#   2. Localization.lua.iberis.bak 백업이 없으면 생성 (있으면 건너뜀 — 원본 한 번만 보관)
#   3. `elseif locale == "koKR" then` ~ 다음 `elseif locale ==` 또는 `end\nreturn L` 사이를
#      strings_koKR.lua 내용으로 교체
#   4. UTF-8 (BOM 없음, LF 기준)으로 저장
#
# 패처 재실행은 idempotent — 같은 결과를 줍니다.
# Guidelime이 업데이트되어 Localization.lua가 덮어쓰여졌으면 이 스크립트를 다시 실행하세요.

[CmdletBinding()]
param(
    [string]$WoWRoot = "C:\Program Files (x86)\World of Warcraft",
    [string]$StringsFile
)

$ErrorActionPreference = "Stop"

# $PSScriptRoot가 param 기본값 평가 시점에 비어있을 수 있어 본문에서 해석
if (-not $StringsFile) {
    $scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
    $StringsFile = Join-Path $scriptDir "strings_koKR.lua"
}

function Write-Info($msg)  { Write-Host "[INFO] $msg" -ForegroundColor Cyan }
function Write-Ok($msg)    { Write-Host "[ OK ] $msg" -ForegroundColor Green }
function Write-Warn2($msg) { Write-Host "[WARN] $msg" -ForegroundColor Yellow }
function Write-Err2($msg)  { Write-Host "[FAIL] $msg" -ForegroundColor Red }

if (-not (Test-Path -LiteralPath $StringsFile)) {
    Write-Err2 "strings_koKR.lua 파일을 찾을 수 없습니다: $StringsFile"
    exit 1
}

# UTF-8 (no BOM) 인코더
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

# 주입할 koKR 본문 읽기
$kokrBody = [System.IO.File]::ReadAllText($StringsFile, $utf8NoBom)
# 줄바꿈 LF로 통일
$kokrBody = $kokrBody -replace "`r`n", "`n" -replace "`r", "`n"
# 끝의 공백/개행 제거 후 마무리 개행 한 줄 보장
$kokrBody = $kokrBody.TrimEnd("`n", " ", "`t") + "`n"

Write-Info "WoW 루트: $WoWRoot"
Write-Info "번역 소스: $StringsFile ($($kokrBody.Length) 문자)"

# 클라이언트 폴더 자동 탐색
$clients = Get-ChildItem -LiteralPath $WoWRoot -Directory -Force -ErrorAction SilentlyContinue |
    Where-Object { $_.Name -like "_*_" }

if (-not $clients) {
    Write-Err2 "WoW 클라이언트 폴더(_xxx_)를 찾지 못했습니다."
    exit 1
}

$patched = 0
$skipped = 0

foreach ($client in $clients) {
    $locFile = Join-Path $client.FullName "Interface\AddOns\Guidelime\Localization.lua"
    if (-not (Test-Path -LiteralPath $locFile)) {
        Write-Info "$($client.Name): Guidelime 미설치 — 건너뜀"
        $skipped++
        continue
    }

    Write-Info "$($client.Name): $locFile 처리 중"

    $original = [System.IO.File]::ReadAllText($locFile, $utf8NoBom)
    $content = $original -replace "`r`n", "`n" -replace "`r", "`n"

    # 백업 (최초 1회만)
    $backup = "$locFile.iberis.bak"
    if (-not (Test-Path -LiteralPath $backup)) {
        [System.IO.File]::WriteAllText($backup, $original, $utf8NoBom)
        Write-Ok  "백업 생성: $backup"
    } else {
        Write-Info "기존 백업 유지: $backup"
    }

    # koKR 블록 위치 찾기
    $startPattern = "(?m)^elseif\s+locale\s*==\s*""koKR""\s+then\s*$"
    $startMatch = [regex]::Match($content, $startPattern)

    if (-not $startMatch.Success) {
        Write-Warn2 "koKR 블록을 찾지 못했습니다. 이 Guidelime 버전은 자동 패치 대상이 아닙니다."
        $skipped++
        continue
    }

    # koKR 블록의 끝 = 다음 elseif locale == 또는 마지막 'end' (return L 직전) 라인
    $blockBodyStart = $startMatch.Index + $startMatch.Length
    $tail = $content.Substring($blockBodyStart)

    $nextElseIf = [regex]::Match($tail, "(?m)^elseif\s+locale\s*==\s*""[^""]+""\s+then\s*$")
    $endMatch   = [regex]::Match($tail, "(?m)^end\s*$")

    $blockBodyEndRel = -1
    if ($nextElseIf.Success -and (-not $endMatch.Success -or $nextElseIf.Index -lt $endMatch.Index)) {
        $blockBodyEndRel = $nextElseIf.Index
    } elseif ($endMatch.Success) {
        $blockBodyEndRel = $endMatch.Index
    }

    if ($blockBodyEndRel -lt 0) {
        Write-Warn2 "koKR 블록의 끝을 찾지 못했습니다."
        $skipped++
        continue
    }

    # 새 본문 = elseif 라인 + LF + (kokrBody) + LF
    $injected = "`n" + $kokrBody + "`n"
    $newContent = $content.Substring(0, $blockBodyStart) + $injected + $content.Substring($blockBodyStart + $blockBodyEndRel)

    if ($newContent -eq $content) {
        Write-Info "변경 없음 (이미 최신 번역 상태)"
    } else {
        [System.IO.File]::WriteAllText($locFile, $newContent, $utf8NoBom)
        Write-Ok "패치 적용 완료"
        $patched++
    }
}

Write-Host ""
Write-Ok "처리 완료: 패치 $patched 개, 건너뜀 $skipped 개"
if ($patched -gt 0) {
    Write-Info "게임에서 /reload 또는 재접속하면 한글 UI가 적용됩니다."
}
