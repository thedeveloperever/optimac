# MacOS Debloater

*This is a project that allows you to save space and speed up your Mac!*

# Proof

Mac Used: Late 2014 Mac Mini with USB SSD, Mid 2011 iMac 21.5 Inch with SSD Upgrade

MacOS Versions tested: 10.10, 10.11, 10.13, 10.14, 11.0, 12.0

| Stock MacOS                             | Optimized MacOS          |
| -----------                             | ------------------------ |
| Booting: 2 Minutes                      | Booting: 15 seconds      |
| Login to desktop: 30 to 60 seconds      | Login to desktop: 5-10s  |

# *How to use:*

*Note:* (SIP is only in MacOS 10.11 El Capitan and newer, but only 10.13+ block most of the script.)

Make sure to turn off SIP or System Integrity Protection! 
There are many tutorials, and this script is meant to be run on a live system, not recovery.

Find Terminal.

Click it and do the following commands:

```
cd Downloads/macosdebloater-scripts
```
```
chmod 777 *-macos-versions-debloat
```
```
./old-macos-versions-debloat
```

OR

```
./new-macos-versions-debloat
```

*Note:* Replace "Downloads/macosdebloater-scripts" with the file you downloaded.


You are all done! After it finishes, it will automatically reboot for you. You now have a debloated MacOS system!

# *Features:*

Keeps All iCloud and security services, so you can even run it on your business computers. (If you have administrator of course)

Keeps security patches.

Tries to not break the OS while keeping it private and secure.

Removes Notes, Reminders, Calculator, Calendar, Find My, Chess, Books, Mail, Messages, Preview, Siri, Contacts, and Dictionary.

*Note:* This will be removed in a future release due to it being near impossible to remove build in applications with most scripts, even while the system is in recovery mode. Use CleanMyMacX for this if needed. It may be a pup from what I have seen, but its pretty much the only option left.

Removes Siri and speech recognition daemons.

Removes spindump. (crash reporting)

Removes Diagnostics Services.

Removes Location Services.
