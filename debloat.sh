#!/bin/bash


read -r -p "Disable Firevault? [Y/n] " input
 
case $input in
    [yY][eE][sS]|[yY])
 echo Yes
       ;;
    [nN][oO]|[nN])
 echo No
       ;;
    *)
 echo Going to next prompt...
 ;;
esac
echo Disabling FileVault
sudo /usr/bin/fdesetup disable
clear

read -r -p "Disable Animations? [Y/n] " input
 
case $input in
    [yY][eE][sS]|[yY])
 echo Yes
       ;;
    [nN][oO]|[nN])
 echo No
       ;;
    *)
 echo Going to next prompt...
 ;;
esac
echo Disabling Animations
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

read -r -p "Disable SMB Browsing? [Y/n] " input
 
case $input in
    [yY][eE][sS]|[yY])
 echo Yes
       ;;
    [nN][oO]|[nN])
 echo No
       ;;
    *)
 echo Going to next prompt...
 ;;
esac
echo Disabling SMB browing
sudo defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE
clear

read -r -p "Remove voice files? [Y/n] " input
 
case $input in
    [yY][eE][sS]|[yY])
 echo Yes
       ;;
    [nN][oO]|[nN])
 echo No
       ;;
    *)
 echo Going to next prompt...
 ;;
esac
echo Removing Voice files
cd /System/Library/Speech/
sudo rm -rf Voices/*
clear

read -r -p "Remove system logs? [Y/n] " input
 
case $input in
    [yY][eE][sS]|[yY])
 echo Yes
       ;;
    [nN][oO]|[nN])
 echo No
       ;;
    *)
 echo Going to next prompt...
 ;;
esac
echo Removing system logs
sudo rm -rf /private/var/log/*
clear

read -r -p "Remove temporary files? [Y/n] " input
 
case $input in
    [yY][eE][sS]|[yY])
 echo Yes
       ;;
    [nN][oO]|[nN])
 echo No
       ;;
    *)
 echo Going to next prompt...
 ;;
esac
echo Removing temp files
cd /private/var/tmp/
sudo rm -rf TM*
clear

read -r -p "Remove iTunes backups? [Y/n] " input
 
case $input in
    [yY][eE][sS]|[yY])
 echo Yes
       ;;
    [nN][oO]|[nN])
 echo No
       ;;
    *)
 echo Going to next prompt...
 ;;
esac
echo Removing iPhone and iPad backups
sudo rm -rf ~/Library/Application Support/MobileSync/Backup/*
clear

read -r -p "Remove Cached files? [Y/n] " input
 
case $input in
    [yY][eE][sS]|[yY])
 echo Yes
       ;;
    [nN][oO]|[nN])
 echo No
       ;;
    *)
 echo Going to next prompt...
 ;;
esac
echo Clearing cached files
sudo rm -rf ~/Library/Caches/*

read -r -p "Disable Bonjour? [Y/n] " input
 
case $input in
    [yY][eE][sS]|[yY])
 echo Yes
       ;;
    [nN][oO]|[nN])
 echo No
       ;;
    *)
 echo Going to next prompt...
 ;;
esac
echo Disabling bonjour
sudo bash <(curl -Ls http://git.io/6YzLCw)
sudo bash <(curl -Ls http://git.io/q9j5Zw)
clear

read -r -p "Remove over 100 Daemons and Agents? (WARNING, REMOVES ICLOUD AND MORE!) [Y/n] " input
 
case $input in
    [yY][eE][sS]|[yY])
 echo Yes
       ;;
    [nN][oO]|[nN])
 echo No
       ;;
    *)
 echo Going to next prompt...
 ;;
esac

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

read -r -p "Remove apps associated with removes services and daemons? [Y/n] " input
 
case $input in
    [yY][eE][sS]|[yY])
 echo Yes
       ;;
    [nN][oO]|[nN])
 echo No
       ;;
    *)
 echo Going to next prompt...
 ;;
esac
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

sleep 2
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
