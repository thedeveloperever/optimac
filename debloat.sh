#!/bin/bash

while true
do
 read -r -p "Do you wish to continue? This script can remove services that may be required by your work or school, and could be harmful if you don't know what you are doing. [Y/n] " input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
 break
 ;;
     [nN][oO]|[nN])
 echo "No"
 break
        ;;
     *)
 echo "Invalid input..."
 ;;
 esac
done

clear

while true
do
 read -r -p "Disable FireVault? [Y/n] " input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
 break
 ;;
     [nN][oO]|[nN])
 echo "No"
 break
        ;;
     *)
 echo "Invalid input..."
 ;;
 esac
done
echo Disabling FileVault…
sudo /usr/bin/fdesetup disable
clear
echo Disabled FireVault!
sleep 1
clear

while true
do
 read -r -p "Disable Animations? [Y/n] " input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
 break
 ;;
     [nN][oO]|[nN])
 echo "No"
 break
        ;;
     *)
 echo "Invalid input..."
 ;;
 esac
done
echo Disabling Animations…
sudo defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
sudo defaults write -g QLPanelAnimationDuration -float 0
sudo defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
sudo defaults write com.apple.finder DisableAllAnimations -bool true
sudo defaults write com.apple.dock launchanim -bool false
sudo defaults write com.apple.dock expose-animation-duration -float 0.1
sudo defaults write com.apple.Dock autohide-delay -float 0
echo Tweaking Keyboard
sudo defaults write NSGlobalDomain KeyRepeat -int 0
clear
echo Disabled Animations!
sleep 1
clear
while true
do
 read -r -p "Disable SMP Browsing? [Y/n] " input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
 break
 ;;
     [nN][oO]|[nN])
 echo "No"
 break
        ;;
     *)
 echo "Invalid input..."
 ;;
 esac
done
echo Disabling SMB browsing…
sudo defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE
clear
echo Disabled SMB browsing!
sleep 1
clear

while true
do
 read -r -p "Remove Voice Files? [Y/n] " input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
 break
 ;;
     [nN][oO]|[nN])
 echo "No"
 break
        ;;
     *)
 echo "Invalid input..."
 ;;
 esac
done
echo Removing Voice files…
cd /System/Library/Speech/
sudo rm -rf Voices/*
clear
echo Removed Voice files!
sleep 1
clear

while true
do
 read -r -p "Remove System Logs? [Y/n] " input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
 break
 ;;
     [nN][oO]|[nN])
 echo "No"
 break
        ;;
     *)
 echo "Invalid input..."
 ;;
 esac
done
echo Removing system logs…
sudo rm -rf /private/var/log/*
clear
echo Removed System logs!
sleep 1
clear
while true
do
 read -r -p "Remove Temporary Files? [Y/n] " input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
 break
 ;;
     [nN][oO]|[nN])
 echo "No"
 break
        ;;
     *)
 echo "Invalid input..."
 ;;
 esac
done
echo Removing temporary files…
cd /private/var/tmp/
sudo rm -rf TM*
clear
echo Removed temporary files!
sleep 1
clear

while true
do
 read -r -p "Remove iTunes Backups? [Y/n] " input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
 break
 ;;
     [nN][oO]|[nN])
 echo "No"
 break
        ;;
     *)
 echo "Invalid input..."
 ;;
 esac
done
echo Removing iPhone and iPad backups…
sudo rm -rf ~/Library/Application Support/MobileSync/Backup/*
sleep 1
clear
echo Removed iPhone and iPad backups!

while true
do
 read -r -p "Remove Cached Files? [Y/n] " input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
 break
 ;;
     [nN][oO]|[nN])
 echo "No"
 break
        ;;
     *)
 echo "Invalid input..."
 ;;
 esac
done
clear
sleep 1
echo Clearing cached files…
sudo rm -rf ~/Library/Caches/*
clear
sleep 1
echo Cleared cached files!
clear

while true
do
 read -r -p 'Optimize Boot configurations? [Y/n] ' input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
 break
 ;;
     [nN][oO]|[nN])
 echo "No"
 break
        ;;
     *)
 echo "Invalid input..."
 ;;
 esac
done

clear
echo Optimizing boot configurations…
sleep 1
clear
sudo defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
sudo defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
sudo defaults write -g QLPanelAnimationDuration -float 0
sudo defaults write com.apple.dock autohide-time-modifier -float 0
sudo defaults write com.apple.dock launchanim -bool false
sudo sysctl debug.lowpri_throttle_enabled=0
sleep 1
clear
echo Optimized Boot Configurations!
sleep 1
clear

while true
do
 read -r -p 'Disable IPv6? [Y/n] ' input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
 break
 ;;
     [nN][oO]|[nN])
 echo "No"
 break
        ;;
     *)
 echo "Invalid input..."
 ;;
 esac
done
clear
echo Disabling IPv6…
sudo networksetup -setv6off Wi-Fi
sudo networksetup -setv6off Ethernet
clear
echo Disabled IPv6!
sleep 1
clear

while true
do
 read -r -p 'Remove Phone applications and daemons? [Y/n] ' input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
 break
 ;;
     [nN][oO]|[nN])
 echo "No"
 break
        ;;
     *)
 echo "Invalid input..."
 ;;
 esac
done
clear
sleep 1
echo Removing phone daemons…
sleep 1
clear
sudo launchctl remove com.apple.CallHistoryPluginHelper
sudo launchctl remove com.apple.AddressBook.abd
sudo launchctl remove com.apple.ap.adprivacyd
sleep 1
echo Removed phone daemons!
clear

while true
do
 read -r -p 'Disable Crash reports? [Y/n] ' input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
 break
 ;;
     [nN][oO]|[nN])
 echo "No"
 break
        ;;
     *)
 echo "Invalid input..."
 ;;
 esac
done
clear

echo Disabling Crash Reports…
sleep 1
clear
sudo launchctl remove com.apple.ReportPanic
sudo launchctl remove com.apple.ReportCrash
sudo launchctl remove com.apple.ReportCrash.Self
sudo launchctl remove com.apple.DiagnosticReportCleanup.plist
sudo launchctl remove com.apple.ap.adprivacyd
clear
echo Disabled Crash Reports!
sleep 1
clear

while true
do
 read -r -p 'Disable Siri, knowledge and help? [Y/n] ' input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
 break
 ;;
     [nN][oO]|[nN])
 echo "No"
 break
        ;;
     *)
 echo "Invalid input..."
 ;;
 esac
done
clear
sleep 1
echo Disabling Siri, knowledge, and help daemons…
clear
sudo launchctl remove com.apple.siriknowledged
sudo launchctl remove com.apple.helpd
sudo launchctl remove com.apple.mobiledeviceupdater
sudo launchctl remove com.apple.screensharing.MessagesAgent
sudo launchctl remove com.apple.TrustEvaluationAgent
clear
echo Disabled Siri, knowledge, and help daemons!
sleep 1
clear

while true
do
 read -r -p 'Disable spindump? [Y/n] ' input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
 break
 ;;
     [nN][oO]|[nN])
 echo "No"
 break
        ;;
     *)
 echo "Invalid input..."
 ;;
 esac
done
clear
sleep 1
echo Disabling spindump…
sudo launchctl unload -wF com.apple.spindump.plist
sudo launchctl unload -wF com.apple.metadata.mds.spindump.plist
clear
echo Disabled spindump!
sleep 1
clear

while true
do
 read -r -p 'Disable FTP? [Y/n] ' input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
 break
 ;;
     [nN][oO]|[nN])
 echo "No"
 break
        ;;
     *)
 echo "Invalid input..."
 ;;
 esac
done
clear
echo Disabling FTP…
sleep 1
clear
sudo launchctl unload -wF com.apple.ftp-proxy.plist
clear
echo Disabled FTP!
sleep 1
clear

while true
do
 read -r -p 'Remove over 100 daemons and agents? (WARNING, REMOVES ICLOUD AND MORE!) [Y/n] ' input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
 break
 ;;
     [nN][oO]|[nN])
 echo "No"
 break
        ;;
     *)
 echo "Invalid input..."
 ;;
 esac
done



TODISABLE=('com.apple.findmymacmessenger.plist' 'com.apple.apsd.plist' 'com.apple.netbiosd.plist' 'com.apple.locationd.plist' 'com.apple.preferences.timezone.admintool' 'com.apple.preferences.timezone.auto' 'com.apple.remotepairtool' 'com.apple.rpmuxd' 'com.apple.security.FDERecoveryAgent' 'com.apple.icloud.findmydeviced' 'com.apple.findmymacmessenger' 'com.apple.familycontrols' 'com.apple.findmymac' 'com.apple.SubmitDiagInfo' 'com.apple.screensharing' 'com.apple.appleseed.fbahelperd' 'com.apple.apsd' 'com.apple.AOSNotificationOSX' 'com.apple.FileSyncAgent.sshd' 'com.apple.ManagedClient.cloudconfigurationd' 'com.apple.ManagedClient.enroll' 'com.apple.ManagedClient' 'com.apple.ManagedClient.startup' 'com.apple.iCloudStats' 'com.apple.locationd' 'com.apple.mbicloudsetupd' 'com.apple.laterscheduler' 'com.apple.awacsd' 'com.apple.eapolcfg_auth' 'com.apple.familycontrols' 'com.apple.DictationIM.plist' 'com.apple.bird.plist' 'com.apple.parentalcontrols.check.plist' 'com.apple.SocialPushAgent.plist' 'com.apple.soagent.plist' 'com.apple.spindump_agent.plist' 'com.apple.IMLoggingAgent.plist' 'com.apple.imagent.plist' 'com.apple.spindump_agent.plist' 'com.apple.AirPlayUIAgent.plist' 'com.apple.gamed.plist' 'com.apple.notificationcenterui.plist' 'com.apple.CalendarAgent.plist' 'com.apple.metadata.mds.plist' 'com.apple.quicklook.*' 'com.apple.security.keychainsyncingoveridsproxy' 'com.apple.personad' 'com.apple.passd' 'com.apple.screensharing.MessagesAgent' 'com.apple.CommCenter-osx' 'com.apple.Maps.mapspushd' 'com.apple.Maps.pushdaemon' 'com.apple.photoanalysisd' 'com.apple.telephonyutilities.callservicesd' 'com.apple.AirPlayUIAgent' 'com.apple.AirPortBaseStationAgent' 'com.apple.CalendarAgent' 'com.apple.DictationIM' 'com.apple.iCloudUserNotifications' 'com.apple.familycircled' 'com.apple.familycontrols.useragent' 'com.apple.familynotificationd' 'com.apple.gamed' 'com.apple.icloud.findmydeviced.findmydevice-user-agent' 'com.apple.icloud.fmfd' 'com.apple.imagent' 'com.apple.cloudfamilyrestrictionsd-mac' 'com.apple.cloudpaird' 'com.apple.cloudphotosd' 'com.apple.DictationIM' 'com.apple.assistant_service' 'com.apple.CallHistorySyncHelper' 'com.apple.CallHistoryPluginHelper' 'com.apple.AOSPushRelay' 'com.apple.IMLoggingAgent' 'com.apple.geodMachServiceBridge' 'com.apple.syncdefaultsd' 'com.apple.security.cloudkeychainproxy3' 'com.apple.security.idskeychainsyncingproxy' 'com.apple.security.keychain-circle-notification' 'com.apple.sharingd' 'com.apple.appleseed.seedusaged' 'com.apple.cloudd' 'com.apple.assistantd' 'com.apple.parentalcontrols.check' 'com.apple.parsecd' 'com.apple.identityservicesd' 'com.apple.DictationIM.plist' 'com.apple.locationmenu.plist' 'com.apple.java.updateSharing.plist' 'com.apple.appstoreupdateagent.plist' 'com.apple.softwareupdate_notify_agent.plist' 'com.apple.ScreenReaderUIServer.plist' 'com.apple.speech.*' 'com.apple.AirPlayXPCHelper.plist ' 'com.apple.mbicloudsetupd.plist' 'com.apple.softwareupdate*' 'com.apple.SubmitDiagInfo.plist' 'com.apple.CrashReporterSupportHelper.plist' 'com.apple.ReportCrash.Root.plist' 'com.apple.GameController.gamecontrollerd.plist' 'com.apple.ftp-proxy.plist' 'com.apple.metadata.mds.spindump.plist' 'com.apple.CallHistoryPluginHelper' 'com.apple.AddressBook.abd' 'com.apple.ap.adprivacyd' 'com.apple.ReportPanic' 'com.apple.ReportCrash' 'com.apple.ReportCrash.Self' 'com.apple.DiagnosticReportCleanup.plist' 'com.apple.siriknowledged' 'com.apple.helpd' 'com.apple.mobiledeviceupdater' 'com.apple.screensharing.MessagesAgent' 'com.apple.TrustEvaluationAgent' 'com.apple.iTunesHelper.launcher' 'com.apple.softwareupdate_notify_agent' 'com.apple.appstoreagent' 'com.apple.familycircled')

for agent in "${TODISABLE[@]}"
do
    {
        launchctl unload -w /System/Library/LaunchAgents/${agent}.plist
    } &> /dev/null
   rm -rf ${agent}.plist 
done

# Daemons to disable
TODISABLE=('com.apple.findmymacmessenger.plist' 'com.apple.apsd.plist' 'com.apple.netbiosd.plist' 'com.apple.locationd.plist' 'com.apple.preferences.timezone.admintool' 'com.apple.preferences.timezone.auto' 'com.apple.remotepairtool' 'com.apple.rpmuxd' 'com.apple.security.FDERecoveryAgent' 'com.apple.icloud.findmydeviced' 'com.apple.findmymacmessenger' 'com.apple.familycontrols' 'com.apple.findmymac' 'com.apple.SubmitDiagInfo' 'com.apple.screensharing' 'com.apple.appleseed.fbahelperd' 'com.apple.apsd' 'com.apple.AOSNotificationOSX' 'com.apple.FileSyncAgent.sshd' 'com.apple.ManagedClient.cloudconfigurationd' 'com.apple.ManagedClient.enroll' 'com.apple.ManagedClient' 'com.apple.ManagedClient.startup' 'com.apple.iCloudStats' 'com.apple.locationd' 'com.apple.mbicloudsetupd' 'com.apple.laterscheduler' 'com.apple.awacsd' 'com.apple.eapolcfg_auth' 'com.apple.familycontrols' 'com.apple.DictationIM.plist' 'com.apple.bird.plist' 'com.apple.parentalcontrols.check.plist' 'com.apple.SocialPushAgent.plist' 'com.apple.soagent.plist' 'com.apple.spindump_agent.plist' 'com.apple.IMLoggingAgent.plist' 'com.apple.imagent.plist' 'com.apple.spindump_agent.plist' 'com.apple.AirPlayUIAgent.plist' 'com.apple.gamed.plist' 'com.apple.notificationcenterui.plist' 'com.apple.CalendarAgent.plist' 'com.apple.metadata.mds.plist' 'com.apple.quicklook.*' 'com.apple.security.keychainsyncingoveridsproxy' 'com.apple.personad' 'com.apple.passd' 'com.apple.screensharing.MessagesAgent' 'com.apple.CommCenter-osx' 'com.apple.Maps.mapspushd' 'com.apple.Maps.pushdaemon' 'com.apple.photoanalysisd' 'com.apple.telephonyutilities.callservicesd' 'com.apple.AirPlayUIAgent' 'com.apple.AirPortBaseStationAgent' 'com.apple.CalendarAgent' 'com.apple.DictationIM' 'com.apple.iCloudUserNotifications' 'com.apple.familycircled' 'com.apple.familycontrols.useragent' 'com.apple.familynotificationd' 'com.apple.gamed' 'com.apple.icloud.findmydeviced.findmydevice-user-agent' 'com.apple.icloud.fmfd' 'com.apple.imagent' 'com.apple.cloudfamilyrestrictionsd-mac' 'com.apple.cloudpaird' 'com.apple.cloudphotosd' 'com.apple.DictationIM' 'com.apple.assistant_service' 'com.apple.CallHistorySyncHelper' 'com.apple.CallHistoryPluginHelper' 'com.apple.AOSPushRelay' 'com.apple.IMLoggingAgent' 'com.apple.geodMachServiceBridge' 'com.apple.syncdefaultsd' 'com.apple.security.cloudkeychainproxy3' 'com.apple.security.idskeychainsyncingproxy' 'com.apple.security.keychain-circle-notification' 'com.apple.sharingd' 'com.apple.appleseed.seedusaged' 'com.apple.cloudd' 'com.apple.assistantd' 'com.apple.parentalcontrols.check' 'com.apple.parsecd' 'com.apple.identityservicesd' 'com.apple.DictationIM.plist' 'com.apple.locationmenu.plist' 'com.apple.java.updateSharing.plist' 'com.apple.appstoreupdateagent.plist' 'com.apple.softwareupdate_notify_agent.plist' 'com.apple.ScreenReaderUIServer.plist' 'com.apple.speech.*' 'com.apple.AirPlayXPCHelper.plist ' 'com.apple.mbicloudsetupd.plist' 'com.apple.softwareupdate*' 'com.apple.SubmitDiagInfo.plist' 'com.apple.CrashReporterSupportHelper.plist' 'com.apple.ReportCrash.Root.plist' 'com.apple.GameController.gamecontrollerd.plist' 'com.apple.ftp-proxy.plist' 'com.apple.metadata.mds.spindump.plist' 'com.apple.CallHistoryPluginHelper' 'com.apple.AddressBook.abd' 'com.apple.ap.adprivacyd' 'com.apple.ReportPanic' 'com.apple.ReportCrash' 'com.apple.ReportCrash.Self' 'com.apple.DiagnosticReportCleanup.plist' 'com.apple.siriknowledged' 'com.apple.helpd' 'com.apple.mobiledeviceupdater' 'com.apple.screensharing.MessagesAgent' 'com.apple.TrustEvaluationAgent' 'com.apple.iTunesHelper.launcher' 'com.apple.softwareupdate_notify_agent' 'com.apple.appstoreagent' 'com.apple.familycircled')

for daemon in "${TODISABLE[@]}"
do
    {
        launchctl unload -w /System/Library/LaunchDaemons/${daemon}.plist
    } &> /dev/null
    rm -rf ${daemon}.plist
done     
clear

echo Disabled All of the useless daemons and services!
sleep 1
clear
while true
do
 read -r -p "Remove apps associated with unloaded services and daemons? [Y/n] " input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
 break
 ;;
     [nN][oO]|[nN])
 echo "No"
 break
        ;;
     *)
 echo "Invalid input..."
 ;;
 esac
done
echo Removing apps associated with removed services and daemons.

sudo rm -rf /Applications/Facetime.app
sudo rm -rf /Applications/Maps.app
sudo rm -rf /Applications/Find My.app
sudo rm -rf '/Applications/Address Book.app'
sudo rm -rf /Applications/Calendar.app
sudo rm -rf /Applications/Calculator.app
sudo rm -rf /Applications/Dictionary.app
sudo rm -rf /Applications/Photos.app
sudo rm -rf /Applications/Reminders.app
sudo rm -rf '/Applications/App Store.app'
sudo rm -rf /Applications/iTunes.app
sudo rm -rf /Applications/Mail.app
sudo rm -rf /Applications/Books.app
sudo rm -rf '/Applications/Photo Booth.app'
sudo rm -rf /Applications/Podcasts.app
sudo rm -rf /Applications/Notes.app
sudo rm -rf /Applications/Contacts.app
sudo rm -rf /Applications/Dashboard.app
sudo rm -rf '/Applications/Time Machine.app'
sudo rm -rf /Applications/Stickies.app
sudo rm -rf '/Applications/Mission Control.app'
sudo rm -rf /Applications/Chess.app
sudo rm -rf '/Applications/Font Book.app'
sudo rm -rf /Applications/Automator.app
sudo rm -rf /Applications/Messages.app
sudo rm -rf /Applications/iBooks.app
sudo rm -rf '/Applications/Game Center.app'
sudo rm -rf '/Applications/DVD Player.app'
sudo rm -rf '/Applications/Image Capture.app'
sudo rm -rf '/Applications/Utilities/AirPort Utility.app'
sudo rm -rf /Applications/Utilities/Grapher.app
sudo rm -rf '/Applications/Utilities/VoiceOver Utility.app'
sudo rm -rf '/Applications/Utilities/Migration Assistant.app'
sudo rm -rf '/Applications/Utilities/Keychain Access.app'
sudo rm -rf '/Applications/Utilities/Script Editor.app'
sudo rm -rf /Applications/Utilities/Grab.app
sudo rm -rf /Applications/Utilities/Console.app
sudo rm -rf '/Applications/Utilities/Bluetooth File Exchange.app'

sudo rm -rf /System/Applications/Facetime.app
sudo rm -rf /System/Applications/Maps.app
sudo rm -rf /System/Applications/Find My.app
sudo rm -rf '/System/Applications/Address Book.app'
sudo rm -rf /System/Applications/Calendar.app
sudo rm -rf /System/Applications/Calculator.app
sudo rm -rf /System/Applications/Dictionary.app
sudo rm -rf /System/Applications/Photos.app
sudo rm -rf /System/Applications/Reminders.app
sudo rm -rf '/System/Applications/App Store.app'
sudo rm -rf /System/Applications/iTunes.app
sudo rm -rf /System/Applications/Mail.app
sudo rm -rf /System/Applications/Books.app
sudo rm -rf '/System/Applications/Photo Booth.app'
sudo rm -rf /System/Applications/Podcasts.app
sudo rm -rf /System/Applications/Notes.app
sudo rm -rf /System/Applications/Contacts.app
sudo rm -rf /System/Applications/Dashboard.app
sudo rm -rf '/System/Applications/Time Machine.app'
sudo rm -rf /System/Applications/Stickies.app
sudo rm -rf '/System/Applications/Mission Control.app'
sudo rm -rf /System/Applications/Chess.app
sudo rm -rf '/System/Applications/Font Book.app'
sudo rm -rf /System/Applications/Automator.app
sudo rm -rf /System/Applications/Messages.app
sudo rm -rf /System/Applications/iBooks.app
sudo rm -rf '/System/Applications/Game Center.app'
sudo rm -rf '/System/Applications/DVD Player.app'
sudo rm -rf '/System/Applications/Image Capture.app'
sudo rm -rf '/System/Applications/Utilities/AirPort Utility.app'
sudo rm -rf /System/Applications/Utilities/Grapher.app
sudo rm -rf '/System/Applications/Utilities/VoiceOver Utility.app'
sudo rm -rf '/System/Applications/Utilities/Migration Assistant.app'
sudo rm -rf '/System/Applications/Utilities/Keychain Access.app'
sudo rm -rf '/System/Applications/Utilities/Script Editor.app'
sudo rm -rf /System/Applications/Utilities/Grab.app
sudo rm -rf /System/Applications/Utilities/Console.app
sudo rm -rf '/System/Applications/Utilities/Bluetooth File Exchange.app'


sleep 1
clear
echo Removed all of the apps associated with removed daemons and services!
clear
sleep 3
echo Your computer will reboot soon.
sleep 1
echo 10
sleep 1
echo 9
sleep 1
echo 8
sleep 1
echo 7
sleep 1
echo 6
sleep 1
echo 5
sleep 1
echo 4
sleep 1
echo 3
sleep 1
echo 2
sleep 1
echo 1
sudo reboot
