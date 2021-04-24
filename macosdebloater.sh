#!/bin/bash

su root

echo Disabling Apple Push Notification Service daemon
# Disable Apple Push Notification Service daemon
# https://apple.stackexchange.com/questions/92214/how-to-disable-apple-push-notification-service-apsd-on-os-x-10-8
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.apsd.plist

echo Disabling CalendarAgent
# Disable CalendarAgent
launchctl unload -w /System/Library/LaunchAgents/com.apple.CalendarAgent.plist

echo Disabling NetBIOS
# Disable NetBIOS daemon (netbiosd)
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.netbiosd.plist

echo Disabling Location Services
# Disable Location Services (locationd)
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.locationd.plist

echo Disabling Notification Center
# Disable Notification Center
# https://apple.stackexchange.com/questions/106149/how-do-i-permanently-disable-notification-center-in-mavericks
sudo launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist

echo Disabling Quicklook
# Disable QuickLook
# https://superuser.com/questions/617658/quicklooksatellite-mac-os-high-cpu-use
sudo launchctl unload -w /System/Library/LaunchAgents/com.apple.quicklook.*

echo Disabling Spotlight
# Disable Spotlight
# http://osxdaily.com/2011/12/10/disable-or-enable-spotlight-in-mac-os-x-lion/
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist

echo Disabling Mavericks Unicast ARP Cache Validation Script
# Disabling Maverick's Unicast ARP Cache Validation Script (thanks, MMV!)
bash <(curl -Ls http://git.io/6YzLCw)

echo Disabling Bonjour
# Disable Bonjour Script (thanks MMV!)
bash <(curl -Ls http://git.io/q9j5Zw)

# Launch Agents

DISABLE_DIR=/System/Library/LaunchAgentsDisabled
sudo mkdir ${DISABLE_DIR}

echo Disabling Game Center
# Disable Game Center daemon (gamed)
sudo mv /System/Library/LaunchAgents/com.apple.gamed.plist ${DISABLE_DIR}

# Disable Airplay Mirroring
# http://www.ehcho.com/guide/disable-airplay-mirroring/
sudo mv /System/Library/LaunchAgents/com.apple.AirPlayUIAgent.plist ${DISABLE_DIR}


# IMPORTANT: You will need to disable SIP aka Rootless in order to fully execute this script, you can reenable it after.
# WARNING: It might disable things that you may not like. Please double check the services in the TODISABLE vars.

# Get active services: launchctl list | grep -v "\-\t0"
# Find a service: grep -lR [service] /System/Library/Launch* /Library/Launch* ~/Library/LaunchAgents

# Agents to disable
TODISABLE=('com.apple.security.keychainsyncingoveridsproxy' 'com.apple.personad' 'com.apple.passd' 'com.apple.screensharing.MessagesAgent' 'com.apple.CommCenter-osx' 'com.apple.Maps.mapspushd' 'com.apple.Maps.pushdaemon' 'com.apple.photoanalysisd' 'com.apple.telephonyutilities.callservicesd' 'com.apple.AirPlayUIAgent' 'com.apple.AirPortBaseStationAgent' 'com.apple.CalendarAgent' 'com.apple.DictationIM' 'com.apple.iCloudUserNotifications' 'com.apple.familycircled' 'com.apple.familycontrols.useragent' 'com.apple.familynotificationd' 'com.apple.gamed' 'com.apple.icloud.findmydeviced.findmydevice-user-agent' 'com.apple.icloud.fmfd' 'com.apple.imagent' 'com.apple.cloudfamilyrestrictionsd-mac' 'com.apple.cloudpaird' 'com.apple.cloudphotosd' 'com.apple.DictationIM' 'com.apple.assistant_service' 'com.apple.CallHistorySyncHelper' 'com.apple.CallHistoryPluginHelper' 'com.apple.AOSPushRelay' 'com.apple.IMLoggingAgent' 'com.apple.geodMachServiceBridge' 'com.apple.syncdefaultsd' 'com.apple.security.cloudkeychainproxy3' 'com.apple.security.idskeychainsyncingproxy' 'com.apple.security.keychain-circle-notification' 'com.apple.sharingd' 'com.apple.appleseed.seedusaged' 'com.apple.cloudd' 'com.apple.assistantd' 'com.apple.parentalcontrols.check' 'com.apple.parsecd' 'com.apple.identityservicesd')

for agent in "${TODISABLE[@]}"
do
    {
        sudo launchctl unload -w /System/Library/LaunchAgents/${agent}.plist
        launchctl unload -w /System/Library/LaunchAgents/${agent}.plist
    } &> /dev/null
    sudo mv /System/Library/LaunchAgents/${agent}.plist /System/Library/LaunchAgents/${agent}.plist.bak
    echo "[OK] Agent ${agent} disabled"
done

# Daemons to disable
TODISABLE=('com.apple.netbiosd' 'com.apple.preferences.timezone.admintool' 'com.apple.preferences.timezone.auto' 'com.apple.remotepairtool' 'com.apple.rpmuxd' 'com.apple.security.FDERecoveryAgent' 'com.apple.icloud.findmydeviced' 'com.apple.findmymacmessenger' 'com.apple.familycontrols' 'com.apple.findmymac' 'com.apple.SubmitDiagInfo' 'com.apple.screensharing' 'com.apple.appleseed.fbahelperd' 'com.apple.apsd' 'com.apple.AOSNotificationOSX' 'com.apple.FileSyncAgent.sshd' 'com.apple.ManagedClient.cloudconfigurationd' 'com.apple.ManagedClient.enroll' 'com.apple.ManagedClient' 'com.apple.ManagedClient.startup' 'com.apple.iCloudStats' 'com.apple.locationd' 'com.apple.mbicloudsetupd' 'com.apple.laterscheduler' 'com.apple.awacsd' 'com.apple.eapolcfg_auth' 'com.apple.familycontrols')

for daemon in "${TODISABLE[@]}"
do
    {
        sudo launchctl unload -w /System/Library/LaunchDaemons/${daemon}.plist
        launchctl unload -w /System/Library/LaunchDaemons/${daemon}.plist
    } &> /dev/null
    sudo mv /System/Library/LaunchDaemons/${daemon}.plist /System/Library/LaunchDaemons/${daemon}.plist.bak
    echo "[OK] Daemon ${daemon} disabled"
done

cd /
mkdir RemovedFiles
cd RemovedFiles
mkdir System-Library-LaunchAgents
FLA=/RemovedFiles/System-Library-LaunchAgents/
cd /System/Library/LaunchAgents/


echo Disabling Calendar
# Disable AddressBook and Calendar
mv com.apple.AddressBook*                      $FLA
mv com.apple.CalendarAgent.plist               $FLA

echo Disabling iCloud Services
# iCloud-related services
mv com.apple.iCloudUserNotifications.plist     $FLA
mv com.apple.icbaccountsd.plist                $FLA
mv com.apple.icloud.fmfd.plist                 $FLA
mv com.apple.cloud*                            $FLA

echo Disabling Facetime
# Disable Facetime
mv com.apple.imagent.plist                     $FLA
mv com.apple.IMLoggingAgent.plist              $FLA

echo Disabling Notification Center
# Disable Notification Center
mv com.apple.notificationcenterui.plist        $FLA
killall NotificationCenter


# spindump (see also code below)
mv com.apple.spindump_agent.plist              $FLA

echo Disabling Safari
# Disable Safari
mv com.apple.safaridavclient.plist             $FLA
mv com.apple.SafariNotificationAgent.plist     $FLA
# in future versions of OS X
mv com.apple.SafariCloudHistoryPushAgent.plist $FLA

echo Disabling AirPlay
# Disable Airplay
mv com.apple.AirPlayUIAgent.plist              $FLA
mv com.apple.AirPortBaseStationAgent.plist     $FLA
mv com.apple.bird.plist                        $FLA
mv com.apple.findmymacmessenger.plist          $FLA
mv com.apple.gamed.plist                       $FLA
mv com.apple.parentalcontrols.check.plist      $FLA
mv com.apple.soagent.plist                     $FLA
mv com.apple.SocialPushAgent.plist             $FLA
mv com.apple.DictationIM.plist                 $FLA
mv com.apple.Maps.pushdaemon.plist             $FLA
mv com.apple.locationmenu.plist                $FLA
mv com.apple.java.updateSharing.plist          $FLA
mv com.apple.appstoreupdateagent.plist         $FLA
mv com.apple.softwareupdate_notify_agent.plist $FLA
mv com.apple.ScreenReaderUIServer.plist        $FLA
mv com.apple.speech.*                          $FLA
launchctl unload -wF com.apple.AirPlayXPCHelper.plist

echo Removing All extra launch daemons

echo Disabling Notifications
# Disable Apple push notification
launchctl unload -wF com.apple.apsd.plist

echo Disabling FindMy
# Removing FindMy
launchctl unload -wF com.apple.icloud.findmydeviced.plist
launchctl unload -wF com.apple.cloudfamilyrestrictionsd-mac.plist 
launchctl unload -wF com.apple.mbicloudsetupd.plist
launchctl unload -wF com.apple.findmymac.plist
launchctl unload -wF com.apple.findmymacmessenger.plist
launchctl unload -wF com.apple.locationd.plist

echo Disabling Updates
# Remove Updates
launchctl unload -wF com.apple.softwareupdate*

echo Diagnostics Services
# Removing Diagnostics Services
launchctl unload -wF com.apple.SubmitDiagInfo.plist 
launchctl unload -wF com.apple.CrashReporterSupportHelper.plist 
launchctl unload -wF com.apple.ReportCrash.Root.plist 
launchctl unload -wF com.apple.GameController.gamecontrollerd.plist

echo Disabling FTP
# Not using FTP these days
launchctl unload -wF com.apple.ftp-proxy.plist

echo Disabling spindump
# Disable spindump (spindump is a tool used by various system components
# to create hang reports and notify the user of application hangs)
launchctl unload -wF com.apple.spindump.plist
launchctl unload -wF com.apple.metadata.mds.spindump.plist


echo Disabling IPv6
# Disable IPv6 - if not using it yet
# Run this for each network interface (assuming they are called Wi-Fi and Ethernet)
networksetup -setv6off Wi-Fi
networksetup -setv6off Ethernet

echo Disabling ContentCaching
 # ContentCaching
TODISABLE+=(
    'com.apple.AssetCache.builtin' \
    'com.apple.AssetCacheLocatorService' \
    'com.apple.AssetCacheManagerService' \
    'com.apple.AssetCacheTetheratorService'
    )

# Biokit, touchid
TODISABLE+=(
    'com.apple.biokitaggdd' \
    'com.apple.biometrickitd' \
    'com.apple.touchbarserver'
    ) 

echo Optimizing Boot Configurations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
defaults write -g QLPanelAnimationDuration -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock launchanim -bool false
sudo sysctl debug.lowpri_throttle_enabled=0

echo Removing Phone Daemons
sudo launchctl remove com.apple.CallHistoryPluginHelper
sudo launchctl remove com.apple.AddressBook.abd
sudo launchctl remove com.apple.ap.adprivacyd

echo Disabling Crash Reports
sudo launchctl remove com.apple.ReportPanic
sudo launchctl remove com.apple.ReportCrash
sudo launchctl remove com.apple.ReportCrash.Self
sudo launchctl remove com.apple.DiagnosticReportCleanup.plist
sudo launchctl remove com.apple.ap.adprivacyd

echo Disabling Siri and help daemons.
sudo launchctl remove com.apple.siriknowledged
sudo launchctl remove com.apple.helpd
sudo launchctl remove com.apple.mobiledeviceupdater
sudo launchctl remove com.apple.screensharing.MessagesAgent
sudo launchctl remove com.apple.TrustEvaluationAgent

echo Removing iTunes daemons
sudo launchctl remove com.apple.iTunesHelper.launcher
sudo launchctl remove com.apple.softwareupdate_notify_agent
sudo launchctl remove com.apple.appstoreagent
sudo launchctl remove com.apple.familycircled

echo Removing Safari
sudo launchctl remove com.apple.SafariCloudHistoryPushAgent
sudo launchctl remove com.apple.Safari.SafeBrowsing.Service
sudo launchctl remove com.apple.SafariNotificationAgent
sudo launchctl remove com.apple.SafariPlugInUpdateNotifier
sudo launchctl remove com.apple.SafariHistoryServiceAgent
sudo launchctl remove com.apple.SafariLaunchAgent
sudo launchctl remove com.apple.SafariPlugInUpdateNotifier
sudo launchctl remove com.apple.safaridavclient

echo Removing apps associated with removed services and daemons.
rm -rf /Applications/Facetime.app
rm -rf /Applications/Safari.app
rm -rf /Applications/Maps.app
rm -rf /Applications/FindMy.app
rm -rf /Applications/Address \Book.app
rm -rf /Applications/Calendar.app
rm -rf /Applications/Calculator.app
rm -rf /Applications/Dictionary.app
rm -rf /Applications/Photos.app
rm -rf /Applications/Reminders.app
rm -rf /Applications/App \Store.app
rm -rf /Applications/iTunes.app
