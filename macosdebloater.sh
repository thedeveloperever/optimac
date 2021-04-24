#!/bin/bash

echo Disabling Apple Push Notification Service daemon
# Disable Apple Push Notification Service daemon
# https://apple.stackexchange.com/questions/92214/how-to-disable-apple-push-notification-service-apsd-on-os-x-10-8
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.apsd.plist

echo Disabling CalendarAgent
# Disable CalendarAgent
sudo launchctl unload -w /System/Library/LaunchAgents/com.apple.CalendarAgent.plist

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
sudo bash <(curl -Ls http://git.io/6YzLCw)

echo Disabling Bonjour
# Disable Bonjour Script (thanks MMV!)
sudo bash <(curl -Ls http://git.io/q9j5Zw)

# Launch Agents

echo Disabling Game Center
# Disable Game Center daemon (gamed)
sudo rm -rf /System/Library/LaunchAgents/com.apple.gamed.plist
# Disable Airplay Mirroring
# http://www.ehcho.com/guide/disable-airplay-mirroring/
sudo rm -rf /System/Library/LaunchAgents/com.apple.AirPlayUIAgent.plist


# IMPORTANT: You will need to disable SIP aka Rootless in order to fully execute this script, you can reenable it after.
# WARNING: It might disable things that you may not like. Please double check the services in the TODISABLE vars.

# Get active services: launchctl list | grep -v "\-\t0"
# Find a service: grep -lR [service] /System/Library/Launch* /Library/Launch* ~/Library/LaunchAgents

# Agents to disable
TODISABLE=('com.apple.security.keychainsyncingoveridsproxy' 'com.apple.personad' 'com.apple.passd' 'com.apple.screensharing.MessagesAgent' 'com.apple.CommCenter-osx' 'com.apple.Maps.mapspushd' 'com.apple.Maps.pushdaemon' 'com.apple.photoanalysisd' 'com.apple.telephonyutilities.callservicesd' 'com.apple.AirPlayUIAgent' 'com.apple.AirPortBaseStationAgent' 'com.apple.CalendarAgent' 'com.apple.DictationIM' 'com.apple.iCloudUserNotifications' 'com.apple.familycircled' 'com.apple.familycontrols.useragent' 'com.apple.familynotificationd' 'com.apple.gamed' 'com.apple.icloud.findmydeviced.findmydevice-user-agent' 'com.apple.icloud.fmfd' 'com.apple.imagent' 'com.apple.cloudfamilyrestrictionsd-mac' 'com.apple.cloudpaird' 'com.apple.cloudphotosd' 'com.apple.DictationIM' 'com.apple.assistant_service' 'com.apple.CallHistorySyncHelper' 'com.apple.CallHistoryPluginHelper' 'com.apple.AOSPushRelay' 'com.apple.IMLoggingAgent' 'com.apple.geodMachServiceBridge' 'com.apple.syncdefaultsd' 'com.apple.security.cloudkeychainproxy3' 'com.apple.security.idskeychainsyncingproxy' 'com.apple.security.keychain-circle-notification' 'com.apple.sharingd' 'com.apple.appleseed.seedusaged' 'com.apple.cloudd' 'com.apple.assistantd' 'com.apple.parentalcontrols.check' 'com.apple.parsecd' 'com.apple.identityservicesd')

for agent in "${TODISABLE[@]}"
do
    {
        launchctl unload -w /System/Library/LaunchAgents/${agent}.plist
    } &> /dev/null
   rm -rf ${agent}.plist 
    echo "[OK] Agent ${agent} disabled"
done

# Daemons to disable
TODISABLE=('com.apple.netbiosd' 'com.apple.preferences.timezone.admintool' 'com.apple.preferences.timezone.auto' 'com.apple.remotepairtool' 'com.apple.rpmuxd' 'com.apple.security.FDERecoveryAgent' 'com.apple.icloud.findmydeviced' 'com.apple.findmymacmessenger' 'com.apple.familycontrols' 'com.apple.findmymac' 'com.apple.SubmitDiagInfo' 'com.apple.screensharing' 'com.apple.appleseed.fbahelperd' 'com.apple.apsd' 'com.apple.AOSNotificationOSX' 'com.apple.FileSyncAgent.sshd' 'com.apple.ManagedClient.cloudconfigurationd' 'com.apple.ManagedClient.enroll' 'com.apple.ManagedClient' 'com.apple.ManagedClient.startup' 'com.apple.iCloudStats' 'com.apple.locationd' 'com.apple.mbicloudsetupd' 'com.apple.laterscheduler' 'com.apple.awacsd' 'com.apple.eapolcfg_auth' 'com.apple.familycontrols')

for daemon in "${TODISABLE[@]}"
do
    {
        launchctl unload -w /System/Library/LaunchDaemons/${daemon}.plist
    } &> /dev/null
    rm -rf ${daemon}.plist
    echo "[OK] Daemon ${daemon} disabled"
done

echo Disabling Calendar
# Disable AddressBook and Calendar
sudo rm -rf com.apple.AddressBook*                      
sudo rm -rf com.apple.CalendarAgent.plist               

echo Disabling iCloud Services
# iCloud-related services
sudo rm -rf com.apple.iCloudUserNotifications.plist     
sudo rm -rf com.apple.icbaccountsd.plist                
sudo rm -rf com.apple.icloud.fmfd.plist                 
sudo rm -rf com.apple.cloud*                            

echo Disabling Facetime
# Disable Facetime
su root
sudo rm -rf com.apple.imagent.plist                     
sudo rm -rf com.apple.IMLoggingAgent.plist              

echo Disabling Notification Center
# Disable Notification Center
sudo rm -rf com.apple.notificationcenterui.plist        
sudo killall NotificationCenter


# spindump (see also code below)
sudo rm -rf com.apple.spindump_agent.plist              

echo Disabling Safari
# Disable Safari
sudo rm -rf com.apple.safaridavclient.plist             
sudo rm -rf com.apple.SafariNotificationAgent.plist     
# in future versions of OS X
sudo rm -rf com.apple.SafariCloudHistoryPushAgent.plist 

echo Disabling AirPlay
# Disable Airplay
sudo rm -rf com.apple.AirPlayUIAgent.plist              
sudo rm -rf com.apple.AirPortBaseStationAgent.plist     
sudo rm -rf com.apple.bird.plist                        
sudo rm -rf com.apple.findmymacmessenger.plist          
sudo rm -rf com.apple.gamed.plist                       
sudo rm -rf com.apple.parentalcontrols.check.plist      
sudo rm -rf com.apple.soagent.plist                     
sudo rm -rf com.apple.SocialPushAgent.plist             
sudo rm -rf com.apple.DictationIM.plist                 
sudo rm -rf com.apple.Maps.pushdaemon.plist             
sudo rm -rf com.apple.locationmenu.plist                
sudo rm -rf com.apple.java.updateSharing.plist          
sudo rm -rf com.apple.appstoreupdateagent.plist         
sudo rm -rf com.apple.softwareupdate_notify_agent.plist 
sudo rm -rf com.apple.ScreenReaderUIServer.plist        
sudo rm -rf com.apple.speech.*                          
sudo launchctl unload -wF com.apple.AirPlayXPCHelper.plist

echo Disabling Notifications
# Disable Apple push notification
sudo launchctl unload -wF com.apple.apsd.plist

echo Disabling FindMy
# Removing FindMy
sudo launchctl unload -wF com.apple.icloud.findmydeviced.plist
sudo launchctl unload -wF com.apple.cloudfamilyrestrictionsd-mac.plist 
sudo launchctl unload -wF com.apple.mbicloudsetupd.plist
sudo launchctl unload -wF com.apple.findmymac.plist
sudo launchctl unload -wF com.apple.findmymacmessenger.plist
sudo launchctl unload -wF com.apple.locationd.plist

echo Disabling Updates
# Remove Updates
sudo launchctl unload -wF com.apple.softwareupdate*

echo Diagnostics Services
# Removing Diagnostics Services
sudo launchctl unload -wF com.apple.SubmitDiagInfo.plist 
sudo launchctl unload -wF com.apple.CrashReporterSupportHelper.plist 
sudo launchctl unload -wF com.apple.ReportCrash.Root.plist 
sudo launchctl unload -wF com.apple.GameController.gamecontrollerd.plist

echo Disabling FTP
# Not using FTP these days
sudo launchctl unload -wF com.apple.ftp-proxy.plist

echo Disabling spindump
# Disable spindump (spindump is a tool used by various system components
# to create hang reports and notify the user of application hangs)
sudo launchctl unload -wF com.apple.spindump.plist
sudo launchctl unload -wF com.apple.metadata.mds.spindump.plist


echo Disabling IPv6
# Disable IPv6 - if not using it yet
# Run this for each network interface (assuming they are called Wi-Fi and Ethernet)
sudo networksetup -setv6off Wi-Fi
sudo networksetup -setv6off Ethernet

echo Optimizing Boot Configurations
sudo defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
sudo defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
sudo defaults write -g QLPanelAnimationDuration -float 0
sudo defaults write com.apple.dock autohide-time-modifier -float 0
sudo defaults write com.apple.dock launchanim -bool false
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

sudo rm -rf /Applications/Facetime.app
sudo rm -rf /Applications/Safari.app
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
sudo rm -rf /Applications/Preview.app
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
sudo rm -rf '/Applications/TextEdit.app'
sudo rm -rf '/Applications/QuickTime Player.app'
sudo rm -rf '/Applications/Utilities/AirPort Utility.app'
sudo rm -rf /Applications/Utilities/Grapher.app
sudo rm -rf '/Applications/Utilities/VoiceOver Utility.app'
sudo rm -rf '/Applications/Utilities/Migration Assistant.app'
sudo rm -rf '/Applications/Utilities/Keychain Access.app'
sudo rm -rf '/Applications/Utilities/Script Editor.app'
sudo rm -rf /Applications/Utilities/Grab.app
sudo rm -rf /Applications/Utilities/Console.app
sudo rm -rf '/Applications/Utilities/Bluetooth File Exchange.app'

echo Applying Changes.
echo %%%%%                                                                                                                     5   %
echo %%%%%%%%%%                                                                                                                8   %
echo %%%%%%%%%%%%%%%                                                                                                           15  %
echo %%%%%%%%%%%%%%%%%%%%                                                                                                      17  %
echo %%%%%%%%%%%%%%%%%%%%%%%%%                                                                                                 22  %
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                                                            30  %
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                                                       36  %
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                                                  42  %
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                                             47  %
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                                        56  %
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                                   62  %
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                              66  %
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                         73  %
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                    78  %
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                               83  %
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                          92  %
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                     94  %
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                95  %
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                           97  %
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                      100 %
echo Your computer will now reboot soon.
echo 10
echo 9
echo 8
echo 7
echo 6
echo 5
echo 4
echo 3
echo 2
echo 1
reboot
