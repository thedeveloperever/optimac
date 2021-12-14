# MacOS Debloater

*This is a project that allows you to save space and speed up your Mac!*

# *WARNING:*

*I AM NOT LIABLE FOR ANY DAMAGES MADE TO YOUR COMPUTER, PAST THE POINT OF DOWNLOADING YOU ARE ON YOUR OWN!*

If you use MacOS for iCloud/business purposes then I would NOT RECOMMEND running this script, as it removes iCloud, and a lot more.

# Proof

Mac Used: Late 2014 Mac Mini, Mid 2011 iMac 21.5 Inch

MacOS Versions used: 10.10, 10.11, 10.12, 10.13

| Stock MacOS    | Optimized MacOS          |
| -----------    | ------------------------ |
| Booting:2M     | Booting:30-45s           |
| Login:30s      | Login:5-10s              |
| Desktop:10s    | Desktop:2s               |


# Download Here!


[Download](https://codeload.github.com/dotslashlevi/macosdebloater/zip/refs/tags/0.2.2)

[Raw Text](https://raw.githubusercontent.com/dotslashlevi/macosdebloater/scripts/debloat.sh)


# *How to use:*

# *Make sure to turn off SIP or System Integrity Protection!*

Boot into Recovery Mode (Command + R) and go to the Utilities section, and find Terminal.

Click it and do the following commands:

```
mount -uw /Volumes/Macintosh\ HD/
```
```
cd /Volumes/Macintosh\ HD/Downloads/macosdebloater-scripts
```
```
chmod 777 debloat.sh
```
```
./debloat.sh
```

*Tip*
Replace "cd /Volumes/Macintosh\ HB/Downloads/macosdebloater-scripts" with your hard drive name and the file you downloaded.


You are all done! After it finishes, it will automatically reboot for you. You now have a debloated MacOS system!

# *Features:*

Removes Notes, iTunes, App Store, Reminders, Calculator, Calendar, Find My, and all of the extra apps most people don't need/use.

Removes Extra Phone daemons

Removes Siri, speech, and help daemons

Removes ContentCaching

Removes FTP and spindump

Removes Diagnostics Services

Removes Updates

Removes FindMy

Removes Facetime

Removes Calendar

Removes Game Center

Removes NetBIOS

Removes Airplay

Removes Notifications

Removes Crash reporting

Removes iCloud integration

Removes Location Services

Removes Notification Center

Removes Quicklook and Spotlight

Removes Bonjour

Removes over 75 extra processes, which saves you around 400MB to 2GB of RAM.
