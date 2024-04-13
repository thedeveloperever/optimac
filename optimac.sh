#!/bin/bash

sipstatus=$(csrutil status)

if [[ "$sipstatus" == *"enabled"* ]]; then
    echo "Please disable SIP in order to continue."
    sleep 3
    exit
else
    echo "SIP is disabled, Continuing script."
    sleep 1
fi

echo "Disabling all animations."
sudo defaults write com.apple.finder DisableAllAnimations -bool true
sudo defaults write com.apple.Dock launchanim -bool false
sudo defaults write com.apple.Dock autohide-delay -int 0
echo "[Complete] Disabled animations."

echo "Disabling the SMB1 protocol."
sudo defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE
echo "[Complete] Disabled the SMB1 protocol."

echo "Disabling useless services and telemetry."
DAE="com.apple.telnetd com.apple.tftpd com.apple.ftp-proxy com.apple.analyticsd com.apple.amp.mediasharingd com.apple.mediaanalysisd com.apple.mediaremoteagent com.apple.photoanalysisd com.apple.java.InstallOnDemand com.apple.voicememod com.apple.geod com.apple.locate com.apple.locationd com.apple.netbiosd com.apple.recentsd com.apple.suggestd com.apple.spindump com.apple.metadata.mds.spindump com.apple.ReportPanic com.apple.ReportCrash com.apple.ReportCrash.Self com.apple.DiagnosticReportCleanup"
for val in $DAE; do
  sudo launchctl disable system/$val
  launchctl disable system/$val
done
echo "[Complete] Disabled useless services and telemetry."

echo "Disabling automatic updates to prevent reverting the script. You still can update manually."
UPDATES="AutomaticDownload AutomaticCheckEnabled CriticalUpdateInstall ConfigDataInstall"
for val in $UPDATES; do
  sudo defaults write com.apple.SoftwareUpdate $val -int 0
done
echo "[Complete] Disabled automatic updates and cache clearing."
clear

read -e -p "(y/N) Reboot now? " yn
if [ "$yn" = "y" ]; then
  echo "Rebooting..."
  sleep 3
  sudo reboot
else
  echo "Defaulting to no."
  Sleep 3
  exit
fi
