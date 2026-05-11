# Apply-TUGsKorean.ps1
#
# IberisUI: GuideLime_TUGs_TBC 가이드 파일을 한국어 번역본으로 교체합니다.
#
# 동작:
#   1. guides/ 폴더 아래 번역 파일들을 _*_/Interface/AddOns/GuideLime_TUGs_TBC/TUGs/ 하위로 복사
#   2. 최초 1회 원본 파일을 *.iberis.bak 으로 백업
#   3. UTF-8 (BOM 없음)로 덮어쓰기
#
# 번역되지 않은 파일은 원본 그대로 둡니다 (영어).
# Guidelime이나 TUGs가 업데이트되면 이 스크립트를 다시 실행하세요.

[CmdletBinding()]
param(
    [string]$WoWRoot = "C:\Program Files (x86)\World of Warcraft",
    [string]$GuidesRoot
)

$ErrorActionPreference = "Stop"

if (-not $GuidesRoot) {
    $scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
    $GuidesRoot = Join-Path $scriptDir "guides"
}

function Write-Info($msg)  { Write-Host "[INFO] $msg" -ForegroundColor Cyan }
function Write-Ok($msg)    { Write-Host "[ OK ] $msg" -ForegroundColor Green }
function Write-Warn2($msg) { Write-Host "[WARN] $msg" -ForegroundColor Yellow }
function Write-Err2($msg)  { Write-Host "[FAIL] $msg" -ForegroundColor Red }

if (-not (Test-Path -LiteralPath $GuidesRoot)) {
    Write-Err2 "번역 가이드 폴더가 없습니다: $GuidesRoot"
    exit 1
}

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

Write-Info "WoW 루트: $WoWRoot"
Write-Info "번역 소스: $GuidesRoot"

# 번역 파일 enumerate (Alliance/Horde/Professions 하위 *.lua)
$sourceFiles = Get-ChildItem -LiteralPath $GuidesRoot -Recurse -Filter "*.lua" -File
if (-not $sourceFiles) {
    Write-Err2 "번역 파일이 없습니다."
    exit 1
}
Write-Info "총 $($sourceFiles.Count)개 번역 파일 감지"

# 설치된 클라이언트의 TUGs 폴더 찾기
$clients = Get-ChildItem -LiteralPath $WoWRoot -Directory -Force -ErrorAction SilentlyContinue |
    Where-Object { $_.Name -like "_*_" }

$tugsRoots = @()
foreach ($c in $clients) {
    $tugsRoot = Join-Path $c.FullName "Interface\AddOns\GuideLime_TUGs_TBC\TUGs"
    if (Test-Path -LiteralPath $tugsRoot) {
        $tugsRoots += [PSCustomObject]@{ Client = $c.Name; Path = $tugsRoot }
    }
}

if (-not $tugsRoots) {
    Write-Err2 "GuideLime_TUGs_TBC가 설치된 클라이언트를 찾지 못했습니다."
    exit 1
}

$totalPatched = 0
$totalSkipped = 0

foreach ($t in $tugsRoots) {
    Write-Info "[$($t.Client)] $($t.Path) 처리 중"

    foreach ($src in $sourceFiles) {
        $rel = $src.FullName.Substring($GuidesRoot.Length).TrimStart('\','/')
        $target = Join-Path $t.Path $rel

        if (-not (Test-Path -LiteralPath $target)) {
            Write-Warn2 "  대상 없음: $rel — 건너뜀"
            $totalSkipped++
            continue
        }

        $backup = "$target.iberis.bak"
        if (-not (Test-Path -LiteralPath $backup)) {
            Copy-Item -LiteralPath $target -Destination $backup -Force
            Write-Ok "  백업: $rel"
        }

        $newContent = [System.IO.File]::ReadAllText($src.FullName, $utf8NoBom)
        $newContent = $newContent -replace "`r`n", "`n" -replace "`r", "`n"

        $oldContent = [System.IO.File]::ReadAllText($target, $utf8NoBom)
        $oldContent = $oldContent -replace "`r`n", "`n" -replace "`r", "`n"

        if ($newContent -eq $oldContent) {
            Write-Info "  변경 없음: $rel"
        } else {
            [System.IO.File]::WriteAllText($target, $newContent, $utf8NoBom)
            Write-Ok "  패치: $rel"
            $totalPatched++
        }
    }
}

Write-Host ""
Write-Ok "처리 완료: 패치 $totalPatched 개, 건너뜀 $totalSkipped 개"
if ($totalPatched -gt 0) {
    Write-Info "게임에서 /reload 또는 재접속 후 가이드를 다시 불러오세요."
}
