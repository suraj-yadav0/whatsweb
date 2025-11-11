#!/bin/bash
#
# Send notification to WhatsWeb on device
# Run this FROM your desktop: ./notify-remote.sh "Title" "Message" [count]
#

TITLE="${1:-Test}"
MESSAGE="${2:-Test message}"
COUNT="${3:-0}"

# Create temporary script on device
adb shell "cat > /tmp/notify.sh << 'EOF'
#!/bin/bash

# Get DBus session from lomiri
LOMIRI_PID=\$(pgrep -u phablet lomiri | head -1)
export \$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/\$LOMIRI_PID/environ | tr '\0' '\n')

# Send notification
dbus-send --session --print-reply \
  --dest=com.lomiri.Postal \
  /com/lomiri/Postal/whatsweb_2epparent \
  com.lomiri.Postal.Post \
  string:whatsweb.pparent_whatsweb \
  string:'{\"message\":\"MESSAGE_PLACEHOLDER\",\"notification\":{\"tag\":\"test_TAG_PLACEHOLDER\",\"card\":{\"summary\":\"TITLE_PLACEHOLDER\",\"body\":\"MESSAGE_PLACEHOLDER\",\"popup\":true,\"persist\":true,\"icon\":\"/opt/click.ubuntu.com/whatsweb.pparent/current/icon.png\",\"actions\":[\"appid://whatsweb.pparent/whatsweb/current-user-version\"]},\"sound\":true,\"vibrate\":true}}'

# Update counter if needed
if [ COUNT_PLACEHOLDER -gt 0 ]; then
  dbus-send --session --print-reply \
    --dest=com.lomiri.Postal \
    /com/lomiri/Postal/whatsweb_2epparent \
    com.lomiri.Postal.SetCounter \
    string:whatsweb.pparent_whatsweb \
    int32:COUNT_PLACEHOLDER \
    boolean:true
fi
EOF
"

# Replace placeholders
adb shell "sed -i 's/TITLE_PLACEHOLDER/$(echo "$TITLE" | sed 's/\//\\\//g')/g' /tmp/notify.sh"
adb shell "sed -i 's/MESSAGE_PLACEHOLDER/$(echo "$MESSAGE" | sed 's/\//\\\//g')/g' /tmp/notify.sh"
adb shell "sed -i 's/TAG_PLACEHOLDER/$(date +%s)/g' /tmp/notify.sh"
adb shell "sed -i 's/COUNT_PLACEHOLDER/$COUNT/g' /tmp/notify.sh"

# Make executable and run
adb shell "chmod +x /tmp/notify.sh && /tmp/notify.sh"

# Cleanup
adb shell "rm /tmp/notify.sh"
