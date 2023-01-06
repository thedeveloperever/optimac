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
echo "[Complete] Disabled animations."

echo "Disabling the SMB protocol."
sudo defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE
sudo touch /etc/nsmb.conf
echo "[default]" | sudo tee -a /etc/nsmb.conf
echo "protocol_vers_map=6" | sudo tee -a /etc/nsmb.conf
echo "port445=no_netbios" | sudo tee -a /etc/nsmb.conf
echo "smb_neg=smb2_only" | sudo tee -a /etc/nsmb.conf
echo "[Complete] Disabled SMB."

echo "Disabling Crash Reporting, Diagnostics, FTP, Spindump, Helpd, and Location Services."
DAE="com.apple.analyticsd com.apple.VoiceOver com.apple.amp.mediasharingd com.apple.mediaanalysisd com.apple.mediaremoteagent com.apple.photoanalysisd com.apple.java.InstallOnDemand com.apple.voicememod com.apple.geod 
com.apple.locate com.apple.locationd com.apple.netbiosd com.apple.recentsd com.apple.suggestd com.apple.ftp-proxy com.apple.TrustEvaluationAgent com.apple.spindump com.apple.metadata.mds.spindump com.apple.ReportPanic 
com.apple.ReportCrash com.apple.ReportCrash.Self com.apple.DiagnosticReportCleanup"
for val in $DAE; do
  sudo launchctl disable system/$val
done
echo "[Complete] Disabled useless services."

echo "Removing extra DMG files and partially downloaded files."
sudo rm /Users/$(whoami)/Downloads/*.dmg
sudo rm /Users/$(whoami)/Downloads/*.crdownload
sudo rm /Users/$(whoami)/Downloads/*.part

echo "[Complete] Your system is now slimmed down. Please reboot soon."
