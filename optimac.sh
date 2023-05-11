#!/bin/bash

: '
optimac.sh
Original Author: thenstop on GitHub
Info: The most up to date open-source macOS debloating and
telemetry removal script. This script is designed to disable animations,
disable SMB1, location services, and most of the telemetry in MacOS.'

echo "Disabling all animations."
: 'Disables all finder animations, window animations, the docks launch animation, and changes the animation lengths.'
sudo defaults write com.apple.finder DisableAllAnimations -bool true
sudo defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
sudo defaults write com.apple.dock launchanim -bool false
sudo defaults write com.apple.dock expose-animation-duration -float 0.001
sudo defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
sudo defaults write com.apple.Dock autohide-delay -float 0
echo "[Complete] Disabled animations."

echo "Disabling the SMB1 protocol."
: 'Disables the extremely insecure SMB1 protocol.'
sudo defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE
echo "[Complete] Disabled SMB1."

echo "Disabling extra daemons."
: 'Disables facial recognition in media, telemetry, location services, java installation on demand, and netbios.'
DAE="com.apple.analyticsd com.apple.amp.mediasharingd com.apple.mediaanalysisd com.apple.mediaremoteagent com.apple.photoanalysisd com.apple.java.InstallOnDemand com.apple.voicememod com.apple.geod com.apple.locate com.apple.locationd com.apple.netbiosd com.apple.recentsd com.apple.suggestd com.apple.spindump com.apple.metadata.mds.spindump com.apple.ReportPanic com.apple.ReportCrash com.apple.ReportCrash.Self com.apple.DiagnosticReportCleanup"
for val in $DAE; do
  sudo launchctl disable system/$val
done
echo "[Complete] Disabled useless services."

echo "Disabling automatic updates."
: 'Disable automatic updates using defaults write.'
UPDATES="AutomaticDownload AutomaticCheckEnabled CriticalUpdateInstall ConfigDataInstall"
for val in $UPDATES; do
  sudo defaults write com.apple.SoftwareUpdate $val -int 0
done
echo "[Complete] Disabled automatic updates and cache clearing."

clear

: 'Creates a yes/no prompt to reboot using if, else, and then'
read -e -p "(y/N) Reboot now? " yn
if [ "$yn" = "y" ]; then
  sleep 3
  echo "Rebooting..."
  sudo reboot
else
  sleep 3
  echo "Defaulting to no."
  exit
fi
