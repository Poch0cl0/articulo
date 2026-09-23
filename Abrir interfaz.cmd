@echo off
cd /d "%~dp0"
python -m motor.ui
if errorlevel 1 pause
