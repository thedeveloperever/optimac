#!/bin/bash

echo "Disabling all animations."
sudo defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
sudo defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
sudo defaults write com.apple.finder DisableAllAnimations -bool true
sudo defaults write com.apple.dock launchanim -bool false
sudo defaults write com.apple.dock expose-animation-duration -float 0.1
sudo defaults write com.apple.Dock autohide-delay -float 0
sudo defaults write -g QLPanelAnimationDuration -float 0
echo "Success."

echo "Disabling the SMB protocol."
sudo defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE
touch /etc/nsmb.conf
echo "[default]" | sudo tee -a /etc/nsmb.conf
echo "protocol_vers_map=6" | sudo tee -a /etc/nsmb.conf
echo "port445=no_netbios" | sudo tee -a /etc/nsmb.conf
echo "smb_neg=smb2_only" | sudo tee -a /etc/nsmb.conf
echo "Success."

echo "Disabling Crash Reporting, Diagnostics, FTP, Spindump, Helpd, and Location Services." 
SERVICES="com.apple.geod com.apple.helpd com.apple.spindump com.apple.ftp-proxy com.apple.metadata.mds.spindump com.apple.ReportPanic com.apple.ReportCrash com.apple.ReportCrash.Self com.apple.DiagnosticReportCleanup"
for val in ${SER[*]}
do
  sudo launchctl disable $val
  echo "Success."
done

echo "Rebooting in 3 Seconds."
sleep 3
sudo reboot
