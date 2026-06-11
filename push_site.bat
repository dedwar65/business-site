@echo off
setlocal

echo ============================================
echo  Pushing business-site to GitHub Pages
echo ============================================

cd /d "%~dp0"

git add -A
git status --short
git commit -m "Update portfolio: 6 report cards" 2>nul || echo (nothing new to commit)
git push origin main

echo.
echo Done. Site will update at decoryedwards.com in ~30 seconds.
pause
