#!/bin/sh
function pushapk() {
  PATH=$PATH:~/Library/Android/sdk/platform-tools
  export PATH
  APKFILE="~/StudioProjects/vue-android-launcher/launcher/build/outputs/apk/launcher-debug.apk"
  REBOOT=false

  while [[ $# > 0 ]]
  do
    case "$1" in
      -r|--reboot)
      REBOOT=true
      shift 2
      ;;
      -f|--file)
      APKFILE="$2"
      shift
      ;;
      *)
      ;;
    esac
    shift
  done

  adb root
  sleep 1
  adb remount
  sleep 1
  echo "pushing file ${APKFILE}"
  adb push ${APKFILE} /system/priv-app/Smartcast/Smartcast.apk
  if $REBOOT ;
  then
    sleep 1
    echo "Rebooting"
    ./adb reboot
  fi
}
