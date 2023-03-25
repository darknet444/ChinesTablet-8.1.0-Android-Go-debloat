#!/bin/bash

echo " Checking if there is android smartphone "
adb devices | grep -w device > /dev/null

if [ $? -ne 0 ]
then
    echo "Error: No Android device detected. Please connect your device and try again."
    exit 1
fi

echo " Disable animations "
adb shell settings put global window_animation_scale 0.0 
adb shell settings put global transition_animation_scale 0.0 
adb shell settings put global animator_duration_scale 0.0

echo " Clearing cache and data "
for package in $(adb shell pm list packages -f | sed -e "s/.*=//" -e "s/\r//"); do
    echo "Clearing cache for $package ..."
    adb shell pm clear "${package}"
done 

echo " Removing Android Apps "
adb shell pm uninstall --user 0 com.android.printspooler
adb shell pm uninstall --user 0 com.android.dreams.basic
adb shell pm uninstall --user 0 com.android.egg
#adb shell pm uninstall --user 0 com.android.documentsui
adb shell pm uninstall --user 0 com.android.camera2
adb shell pm uninstall --user 0 com.android.chrome
adb shell pm uninstall --user 0 com.android.contacts
#adb shell pm uninstall --user 0 com.android.providers.downloads
#adb shell pm uninstall --user 0 com.android.providers.downloads.ui
adb shell pm uninstall --user 0 com.android.dreams.phototable
adb shell pm uninstall --user 0 com.android.soundrecorder
adb shell pm uninstall --user 0 com.android.vending
adb shell pm uninstall --user 0 com.android.deskclock
adb shell pm uninstall --user 0 com.android.musicfx
adb shell pm uninstall --user 0 com.android.providers.contacts
adb shell pm uninstall --user 0 com.android.calculator2
adb shell pm uninstall --user 0 com.android.bips
adb shell pm uninstall --user 0 com.android.nfc
adb shell pm uninstall --user 0 com.android.music
adb shell pm uninstall --user 0 com.android.providers.partnerbookmarks
adb shell pm uninstall --user 0 com.android.cts.ctsshim
adb shell pm uninstall --user 0 com.android.cts.priv.ctsshim
adb shell pm uninstall --user 0 com.android.bookmarkprovider
adb shell pm uninstall --user 0 com.android.smspush
adb shell pm uninstall --user 0 com.android.wallpapercropper
adb shell pm uninstall --user 0 com.android.wallpaperbackup
adb shell pm uninstall --user 0 com.android.wallpaperpicker
#adb shell pm uninstall --user 0 com.android.companiondevicemanager
#adb shell pm uninstall --user 0 com.android.providers.userdictionary
adb shell pm uninstall --user 0 com.android.mtp
adb shell pm uninstall --user 0 com.android.backupconfirm
#adb shell pm uninstall --user 0 com.android.sharedstoragebackup
#adb shell pm uninstall --user 0 com.android.statementservice
adb shell pm uninstall --user 0 com.android.providers.blockednumber
adb shell pm uninstall --user 0 com.android.proxyhandler
adb shell pm uninstall --user 0 com.android.managedprovisioning
adb shell pm uninstall --user 0 com.android.mms.service
adb shell pm uninstall --user 0 com.android.location.fused
adb shell pm uninstall --user 0 com.android.providers.telephony
adb shell pm uninstall --user 0 com.android.server.telecom
adb shell pm uninstall --user 0 com.android.phone
adb shell pm uninstall --user 0 com.android.keychain
adb shell pm uninstall --user 0 com.android.htmlviewer
adb shell pm uninstall --user 0 com.android.systemui.theme.dark
adb shell pm uninstall --user 0 com.android.providers.calendar
#adb shell pm uninstall --user 0 com.android.externalstorage

echo " Removing Google Apps "
adb shell pm uninstall --user 0 com.google.android.calendar
adb shell pm uninstall --user 0 com.google.android.marvin.talkback
adb shell pm uninstall --user 0 com.google.android.apps.photos
adb shell pm uninstall --user 0 com.google.android.gm.lite
adb shell pm uninstall --user 0 com.google.android.syncadapters.contacts
adb shell pm uninstall --user 0 com.google.android.apps.assistant
adb shell pm uninstall --user 0 com.google.android.apps.searchlite
adb shell pm uninstall --user 0 com.google.android.gmsintegration
adb shell pm uninstall --user 0 com.google.android.apps.speechservices
adb shell pm uninstall --user 0 com.google.android.apps.mapslite
adb shell pm uninstall --user 0 com.google.android.feedback
adb shell pm uninstall --user 0 com.google.android.apps.navlite
adb shell pm uninstall --user 0 com.google.android.tts
adb shell pm uninstall --user 0 com.google.android.youtube
adb shell pm uninstall --user 0 com.google.android.apps.nbu.files
adb shell pm uninstall --user 0 com.google.android.backuptransport
adb shell pm uninstall --user 0 com.google.android.ext.services
adb shell pm uninstall --user 0 com.google.android.ext.shared
adb shell pm uninstall --user 0 com.google.android.configupdater
adb shell pm uninstall --user 0 com.google.android.printservice.recommendation
adb shell pm uninstall --user 0 com.google.android.onetimeinitializer
adb shell pm uninstall --user 0 com.google.android.gms
adb shell pm uninstall --user 0 com.google.android.gsf
adb shell pm uninstall --user 0 com.google.android.webview

echo " Removing Other Apps "
adb shell pm uninstall --user 0 android.auto_generated_rro__
adb shell pm uninstall --user 0 com.csdroid.pkg
adb shell pm uninstall --user 0 com.lxj.multimediacopy
adb shell pm uninstall --user 0 com.adups.fota
adb shell pm uninstall --user 0 com.adups.fota.sysoper
# adb shell pm uninstall --user 0 com.google.android.inputmethod.latin
# adb shell pm uninstall --user 0 com.android.launcher3

echo " Downloading fdroid "
wget https://f-droid.org/F-Droid.apk

echo " Install fdroid "

adb install F-Droid.apk 

echo "waiting whene apps are Installed and Uninstalled"
sleep 60;

echo " Clearing cache and data "
for package in $(adb shell pm list packages -f | sed -e "s/.*=//" -e "s/\r//"); do
    echo "Clearing cache for $package ..."
    adb shell pm clear "${package}"
done 

echo "rebooting device"
adb reboot 

# End of Script 
echo done 
