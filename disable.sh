#!/bin/bash

# Utility functions

# Launch Daemons

# Disable Apple Push Notification Service daemon
# https://apple.stackexchange.com/questions/92214/how-to-disable-apple-push-notification-service-apsd-on-os-x-10-8
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.apsd.plist

# Disable CalendarAgent
launchctl unload -w /System/Library/LaunchAgents/com.apple.CalendarAgent.plist

# Disable NetBIOS daemon (netbiosd)
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.netbiosd.plist

# Disable Location Services (locationd)
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.locationd.plist

# Disable Notification Center
# https://apple.stackexchange.com/questions/106149/how-do-i-permanently-disable-notification-center-in-mavericks
sudo launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist

# Disable QuickLook
# https://superuser.com/questions/617658/quicklooksatellite-mac-os-high-cpu-use
sudo launchctl unload -w /System/Library/LaunchAgents/com.apple.quicklook.*

# Disable Spotlight
# http://osxdaily.com/2011/12/10/disable-or-enable-spotlight-in-mac-os-x-lion/
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist

# Disabling Maverick's Unicast ARP Cache Validation Script (thanks, MMV!)
bash <(curl -Ls http://git.io/6YzLCw)

# Disable Bonjour Script (thanks MMV!)
bash <(curl -Ls http://git.io/q9j5Zw)

# Launch Agents

DISABLE_DIR=/System/Library/LaunchAgentsDisabled
sudo mkdir ${DISABLE_DIR}

# Disable Game Center daemon (gamed)
sudo mv /System/Library/LaunchAgents/com.apple.gamed.plist ${DISABLE_DIR}

# Disable Airplay Mirroring
# http://www.ehcho.com/guide/disable-airplay-mirroring/
sudo mv /System/Library/LaunchAgents/com.apple.AirPlayUIAgent.plist ${DISABLE_DIR}

# Install Applications

# Check for existence, download, and run installer(8) on these apps.

# If VirtualBox's vboxautostart.plist file is available, copy it to 
# the /Library/LaunchDaemons folder and enable it.
#
# Set up the /etc/vbox/autostart.cfg file to just allow all users
# on the OS X host to start virtual machines. (No security here.)
#
# Don't start the autostart just yet though.

VBOX_AUTOSTART_SOURCE=/Applications/VirtualBox.app/Contents/MacOS/org.virtualbox.vboxautostart.plist
VBOX_AUTOSTART_TARGET=/Library/LaunchDaemons/org.virtualbox.vboxautostart.plist

VBOX_AUTOSTARTDB_FOLDER=/Users/vboxautostartdb

if [ -f "${VBOX_AUTOSTART_SOURCE}" ]; then
    echo "Setting up VirtualBox Autostart."

    echo "Create /etc/vbox folder."
    sudo mkdir -p /etc/vbox

    echo "Copy autostart.cfg to /etc/vbox."
    sudo cp autostart.cfg /etc/vbox

    # Appears this is unnecessary on OS X.
    # 
    # echo "Create /Users/vboxautostartdb folder."
    # sudo mkdir -p "${VBOX_AUTOSTARTDB_FOLDER}"
    # sudo chown -Rv root:staff "${VBOX_AUTOSTARTDB_FOLDER}"
    # sudo chmod 1770 "${VBOX_AUTOSTARTDB_FOLDER}"

    echo "Copy ${VBOX_AUTOSTART_SOURCE} to ${VBOX_AUTOSTART_TARGET}."
    sudo cp "${VBOX_AUTOSTART_SOURCE}" "${VBOX_AUTOSTART_TARGET}"
    sudo defaults write "${VBOX_AUTOSTART_TARGET}" Disabled -bool false
    sudo plutil -convert xml1 "${VBOX_AUTOSTART_TARGET}"
    sudo chmod 755 "${VBOX_AUTOSTART_TARGET}"

    # Appears this is unnecessary on OS X, and you'll get an error if you try.
    # 
    # echo "To enable autostarts for a particular user, make sure to run"
    # echo "VBoxManage setproperty autostartdbpath ${VBOX_AUTOSTARTDB_FOLDER}"
    # echo "as that user."
    echo
    echo "To manually start the service, all the autostartable VMs, use the following command:"
    echo "launchctl load /Library/LaunchDaemons/org.virtualbox.vboxautostart.plist"
fi


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

su root
cd /
mkdir RemovedFiles
cd RemovedFiles
mkdir System-Library-LaunchAgents
FLA=/RemovedFiles/System-Library-LaunchAgents/
cd /System/Library/LaunchAgents/



# Disable AddressBook and Calendar
mv com.apple.AddressBook*                      $FLA
mv com.apple.CalendarAgent.plist               $FLA


# iCloud-related
mv com.apple.iCloudUserNotifications.plist     $FLA
mv com.apple.icbaccountsd.plist                $FLA
mv com.apple.icloud.fmfd.plist                 $FLA
mv com.apple.cloud*                            $FLA


# Disable imclient (Facetime) and smth else
mv com.apple.imagent.plist                     $FLA
mv com.apple.IMLoggingAgent.plist              $FLA


# Disable Notification Centre
mv com.apple.notificationcenterui.plist        $FLA
killall NotificationCenter


# spindump (see also code below)
mv com.apple.spindump_agent.plist              $FLA


# Safari is not the only browser in the world
mv com.apple.safaridavclient.plist             $FLA
mv com.apple.SafariNotificationAgent.plist     $FLA
# in future versions of OS X
mv com.apple.SafariCloudHistoryPushAgent.plist $FLA


# Explain these
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

su root
cd /System/Library/LaunchDaemons/



# I don't have Apple TV so disable AirPlay
launchctl unload -wF com.apple.AirPlayXPCHelper.plist


# Disable Apple push notification
launchctl unload -wF com.apple.apsd.plist


# Disable location services (should have done it from System Preferences first)
launchctl unload -wF com.apple.locationd.plist


# No point trying to find your mac
launchctl unload -wF com.apple.findmymac.plist
launchctl unload -wF com.apple.findmymacmessenger.plist


# iCloud. Enough said
launchctl unload -wF com.apple.icloud.findmydeviced.plist
launchctl unload -wF com.apple.cloudfamilyrestrictionsd-mac.plist 
launchctl unload -wF com.apple.mbicloudsetupd.plist


# Disable apple software updates - know why you'd do that
launchctl unload -wF com.apple.softwareupdate*


# don't even have DVD these days
launchctl unload -wF com.apple.dvdplayback.setregion.plist 


# no, thank you
launchctl unload -wF com.apple.SubmitDiagInfo.plist 
launchctl unload -wF com.apple.CrashReporterSupportHelper.plist 
launchctl unload -wF com.apple.ReportCrash.Root.plist 
launchctl unload -wF com.apple.GameController.gamecontrollerd.plist


# Not using FTP these days
launchctl unload -wF com.apple.ftp-proxy.plist


# Disable spindump (spindump is a tool used by various system components
# to create hang reports and notify the user of application hangs)
# if it's crashed - it's crashed, get on with your life and don't slow my system down
# I wonder what OzzyMan would have to say about it
launchctl unload -wF com.apple.spindump.plist
launchctl unload -wF com.apple.metadata.mds.spindump.plist



# Disable IPv6 - if not using it yet
# Run this for each network interface (assuming they are called Wi-Fi and Ethernet)
networksetup -setv6off Wi-Fi
networksetup -setv6off Ethernet


# WARNING - this command disables swap file
# Only use it if you know why you're doing it
#launchctl unload -wF com.apple.dynamic_pager.plist


# Disable cups (common unix printing service)
# Don't disable if you have a printer(s) (and wanna use it)
#launchctl unload -wF org.cups.cupsd.plist
#launchctl unload -wF org.cups.cups-lpd.plist


# mDNSresponder/discoveryd - Required for DNS (converting domain name into IP address)
#launchctl unload -wF com.apple.mDNSResponder.plist
#launchctl unload -wF com.apple.mDNSResponderHelper.plist
#launchctl unload -wF com.apple.discoveryd.plist
#launchctl unload -wF com.apple.discoveryd_helper.plist
# Disable NetBIOS - need to check if macbook actually needs this
#launchctl unload -wF com.apple.netbiosd.plist


# Required for Wi-Fi icon
#launchctl unload -wF com.apple.airport.wps.plist
#launchctl unload -wF com.apple.airportd.plist



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

defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
defaults write -g QLPanelAnimationDuration -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock launchanim -bool false
sudo sysctl debug.lowpri_throttle_enabled=0
sudo launchctl remove com.apple.CallHistoryPluginHelper
sudo launchctl remove com.apple.AddressBook.abd
sudo launchctl remove com.apple.ap.adprivacyd
sudo launchctl remove com.apple.ReportPanic
sudo launchctl remove com.apple.ReportCrash
sudo launchctl remove com.apple.ReportCrash.Self
sudo launchctl remove com.apple.DiagnosticReportCleanup.plist
sudo launchctl remove com.apple.ap.adprivacyd
sudo launchctl remove com.apple.siriknowledged
sudo launchctl remove com.apple.helpd
sudo launchctl remove com.apple.mobiledeviceupdater
sudo launchctl remove com.apple.screensharing.MessagesAgent
sudo launchctl remove com.apple.TrustEvaluationAgent
sudo launchctl remove com.apple.iTunesHelper.launcher
sudo launchctl remove com.apple.softwareupdate_notify_agent
sudo launchctl remove com.apple.appstoreagent
sudo launchctl remove com.apple.familycircled
sudo launchctl remove com.apple.SafariCloudHistoryPushAgent
sudo launchctl remove com.apple.Safari.SafeBrowsing.Service
sudo launchctl remove com.apple.SafariNotificationAgent
sudo launchctl remove com.apple.SafariPlugInUpdateNotifier
sudo launchctl remove com.apple.SafariHistoryServiceAgent
sudo launchctl remove com.apple.SafariLaunchAgent
sudo launchctl remove com.apple.SafariPlugInUpdateNotifier
sudo launchctl remove com.apple.safaridavclient
