@echo off
setlocal
cd /d "%~dp0"
where node >nul 2>nul
if errorlevel 1 (
  echo Install Node.js 22.12+ and run this command again.
  exit /b 1
)
if not exist "node_modules\vite\bin\vite.js" (
  where pnpm >nul 2>nul
  if errorlevel 1 (
    echo Install pnpm first: npm install --global pnpm@11.19.0
    exit /b 1
  )
  call pnpm install --frozen-lockfile
  if errorlevel 1 exit /b 1
)
node node_modules\vite\bin\vite.js --host 127.0.0.1 --port 5173 --strictPort
