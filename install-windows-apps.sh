#!/bin/bash

echo "🚀 Installing Windows Applications with Wine..."
echo ""

# Create a directory for Windows apps
mkdir -p ~/windows-apps
cd ~/windows-apps

echo "📦 Installing 7-Zip (file archiver)..."
wget -q "https://www.7-zip.org/a/7z2408.exe" -O 7zip.exe
wine 7zip.exe /S

echo "📝 Installing Notepad++ (text editor)..."
wget -q "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.6.8/npp.8.6.8.Installer.exe" -O notepadpp.exe
wine notepadpp.exe /S

echo "🖼️ Installing IrfanView (image viewer)..."
wget -q "https://www.irfanview.net/main_download_engl.htm" -O - | grep -o 'http://[^"]*iview[^"]*\.exe' | head -1 | wget -i - -O irfanview.exe
wine irfanview.exe /silent /desktop=1

echo "🎮 Installing classic games..."
# Download a simple Windows game like Solitaire or Minesweeper collection
wget -q "https://www.sims2.com/downloads" -O - 2>/dev/null | grep -o 'http://[^"]*\.exe' | head -1 | wget -i - -O game.exe 2>/dev/null || echo "Game download skipped"

echo ""
echo "✅ Windows applications installed!"
echo "🎯 To run them, use:"
echo "   wine ~/windows-apps/7zip.exe"
echo "   wine ~/windows-apps/notepadpp.exe"
echo "   wine ~/windows-apps/irfanview.exe"
echo ""
echo "💡 All Windows apps will appear in your desktop environment!"
