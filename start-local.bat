@echo off
setlocal
cd /d "%~dp0"

where node >nul 2>&1
if errorlevel 1 (
  if exist "C:\Program Files\nodejs\node.exe" (
    set "PATH=C:\Program Files\nodejs;%PATH%"
  ) else (
    echo Node.js is not available in PATH. Install Node.js and try again.
    exit /b 1
  )
)

where npm >nul 2>&1
if errorlevel 1 (
  echo npm is not available. Reinstall Node.js (with npm) and try again.
  exit /b 1
)

if not exist "node_modules" (
  call npm install
  if errorlevel 1 exit /b 1
)

echo Starting local dev server: http://localhost:3000
start "" "http://localhost:3000"
call npm run dev -- --host 127.0.0.1 --port 3000
