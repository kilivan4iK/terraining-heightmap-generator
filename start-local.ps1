$ErrorActionPreference = 'Stop'

$projectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $projectRoot

if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
  $defaultNodePath = 'C:\Program Files\nodejs'
  if (Test-Path (Join-Path $defaultNodePath 'node.exe')) {
    $env:Path = "$defaultNodePath;$env:Path"
  } else {
    throw "Node.js is not available in PATH. Install Node.js and try again."
  }
}

if (-not (Get-Command npm -ErrorAction SilentlyContinue)) {
  throw "npm is not available. Reinstall Node.js (with npm) and try again."
}

if (-not (Test-Path (Join-Path $projectRoot 'node_modules'))) {
  & npm install
}

Write-Host 'Starting local dev server: http://localhost:3000'
Start-Process 'http://localhost:3000'
& npm run dev -- --host 127.0.0.1 --port 3000
