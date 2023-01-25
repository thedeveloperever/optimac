#!/bin/bash

: '
Optimac.sh
Original Author: dotslashlevi on GitHub
The most up to date open-source macOS debloating and
telemetry removal script. This script is designed to disable animations,
disable the SMB protocol, disable crash reporting, diagnostics, FTP,
spindump, helpd, and location services.'

echo "Disabling all animations."
: 'Disables all finder animations, window animations, the docks launch animation, and  change the animation lengths.'
sudo defaults write com.apple.finder DisableAllAnimations -bool true
sudo defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
sudo defaults write com.apple.dock launchanim -bool false
sudo defaults write com.apple.dock expose-animation-duration -float 0.1
sudo defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
sudo defaults write com.apple.Dock autohide-delay -float 0
echo "[Complete] Disabled animations."

echo "Disabling the SMB1 protocol."
: 'SMB1 is so old, its just an attack vector tbh.'
sudo defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE
echo "[Complete] Disabled SMB1."

echo "Disabling extra daemons."
: 'Disables face recognition in media, crash reporting, analytics, automatic java installation, location services, FTP, and netbios.'
DAE="com.apple.analyticsd com.apple.amp.mediasharingd com.apple.mediaanalysisd com.apple.mediaremoteagent com.apple.photoanalysisd com.apple.java.InstallOnDemand com.apple.voicememod com.apple.geod com.apple.helpd com.apple.helpd.agent com.apple.helpd.agent.
com.apple.locate com.apple.locationd com.apple.netbiosd com.apple.recentsd com.apple.suggestd com.apple.ftp-proxy com.apple.spindump com.apple.metadata.mds.spindump com.apple.ReportPanic
com.apple.ReportCrash com.apple.ReportCrash.Self com.apple.DiagnosticReportCleanup"
for val in $DAE; do
  sudo launchctl disable system/$val
done
echo "[Complete] Disabled useless services."

echo "Disabling automatic update telemetry and cache clearing."
: 'Diable cache clearing in Macos Monterey and newer'
: 'Disable automatic updates using defaults write.'
sudo defaults write com.apple.SoftwareUpdate AutomaticCacheCleaningDisabled -bool true
sudo defaults write com.apple.SoftwareUpdate AutomaticDownload -int 0
sudo defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -int 0
sudo defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 0
sudo defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 0
sudo defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 0
echo "[Complete] Disabled automatic updates and cache clearing."

echo "[Complete] Script complete."

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
