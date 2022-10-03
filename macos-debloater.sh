#!/bin/bash

echo "Disabling all animations."
sudo defaults write com.apple.finder DisableAllAnimations -bool true
sudo defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
sudo defaults write com.apple.dock launchanim -bool false
sudo defaults write com.apple.dock expose-animation-duration -float 0.1
sudo defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
sudo defaults write com.apple.Dock autohide-delay -float 0
sudo defaults write QLPanelAnimationDuration -float 0
killall dock
echo "Success."

echo "Removing log files."
sudo rm -rf /private/var/log/*.log
sudo rm -rf /private/var/log/asl/*.asl

echo "

echo "Disabling the SMB protocol."
sudo defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE
touch /etc/nsmb.conf
echo "[default]" | sudo tee -a /etc/nsmb.conf
echo "protocol_vers_map=6" | sudo tee -a /etc/nsmb.conf
echo "port445=no_netbios" | sudo tee -a /etc/nsmb.conf
echo "smb_neg=smb2_only" | sudo tee -a /etc/nsmb.conf
echo "Success."

echo "Disabling Crash Reporting, Diagnostics, FTP, Spindump, Helpd, and Location Services." 
SERVICES="com.apple.analyticsd com.apple.VoiceOver com.apple.amp.mediasharingd com.apple.mediaanalysisd com.apple.mediaremoteagent com.apple.photoanalysisd com.apple.java.InstallOnDemand com.apple.voicememod com.apple.geod com.apple.locate com.apple.locationd com.apple.netbiosd com.apple.recentsd com.apple.suggestd com.apple.ftp-proxy com.apple.TrustEvaluationAgent com.apple.spindump com.apple.metadata.mds.spindump com.apple.ReportPanic com.apple.ReportCrash com.apple.ReportCrash.Self com.apple.DiagnosticReportCleanup"
for service in ${SERVICES[*]}
do
  sudo launchctl disable $SERVICE
  echo "[Complete] Disabled $SERVICE."
done
echo "Success."

echo "Rebooting in 5 Seconds."
sleep 5
sudo reboot
