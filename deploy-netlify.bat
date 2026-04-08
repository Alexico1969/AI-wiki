@echo off
cd /d "%~dp0"

echo Building project...
call npm run build
if errorlevel 1 (
  echo.
  echo Build failed. Deployment stopped.
  pause
  exit /b 1
)

echo.
echo Deploying to Netlify...
call netlify deploy --prod --dir=dist
if errorlevel 1 (
  echo.
  echo Deployment failed.
  pause
  exit /b 1
)

echo.
echo Done.
pause