#!/bin/bash

sipstatus=$(csrutil status)

if [[ $sipstatus == "System Integrity Protection status: enabled." ]]; then
    echo "Please disable SIP in order to continue."
    sleep 1
    exit
else
    echo "SIP is disabled, Continuing script."
    sleep 1
fi

if [[ $EUID -ne 0 ]]; then
    echo "This script requires root. Please enter your password or press CTRL-C if you do not consent."
    exec sudo "$0" "$@"
fi

echo "Disabling all animations."
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.Dock launchanim -bool false
defaults write com.apple.Dock autohide-delay -int 0
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write com.apple.Safari WebKitInitialTimedLayoutDelay 0.25
echo "[Complete] Disabled animations."

echo "Disabling the SMB1 protocol."
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE
echo "[Complete] Disabled the SMB1 protocol."

echo "Disabling search indexing."
mdutil -i off -a
echo "[Complete] Disabled search indexing."

echo "Disabling automatic app startup."
defaults write com.apple.loginwindow TALLogoutSavesState -bool false
echo "[Complete] Disabled automatic app startup."

echo "Disabling hidden library folder."
chflags nohidden ~/Library
echo "[Complete] Disabled hidden library folder."

echo "Disabling useless services and telemetry."
DAE="com.apple.telnetd com.apple.tftpd com.apple.ftp-proxy com.apple.analyticsd com.apple.amp.mediasharingd com.apple.mediaanalysisd com.apple.mediaremoteagent com.apple.photoanalysisd com.apple.java.InstallOnDemand com.apple.voicememod com.apple.geod com.apple.locate com.apple.locationd com.apple.netbiosd com.apple.recentsd com.apple.suggestd com.apple.spindump com.apple.metadata.mds.spindump com.apple.ReportPanic com.apple.ReportCrash com.apple.ReportCrash.Self com.apple.DiagnosticReportCleanup"
for val in $DAE; do
    launchctl disable system/$val
done
echo "[Complete] Disabled useless services and telemetry."

echo "Disabling automatic updates to prevent reverting the script. You still can update manually."
UPDATES="AutomaticDownload AutomaticCheckEnabled"
for val in $UPDATES; do
    defaults write com.apple.SoftwareUpdate $val -int 0
done
echo "[Complete] Disabled automatic updates."
clear

echo -n "Do you want to reboot? (y/N): "
read yn

if [[ "$yn" == "y" || "$yn" == "Y" ]]; then
    echo "Rebooting the system..."
    reboot
elif [[ "$yn" == "n" || "$yn" == "N" ]]; then
    echo "Script closing..."
    exit 0
else
    echo "Defaulting to no. Script closing..."
    exit 0
fi

echo "Exiting root..."
exit
