# Local Notification Testing Toolkit

This toolkit allows you to send test notifications to your WhatsWeb app without triggering actual events.

## Methods Available

1. **Direct DBus Commands** - Send notifications via command line
2. **Python Test Server** - Interactive notification sender
3. **Shell Script** - Quick one-line testers
4. **QML Test App** - Standalone GUI tester

## Quick Start

```bash
# Test if notification system is working
./quick-test.sh

# Start interactive Python server
python3 notification-server.py

# Send single notification via DBus
./send-notification.sh "Test Title" "Test Message"
```

---

## Prerequisites

Your app must be:
- ✅ Installed on the device
- ✅ Have proper permissions configured
- ✅ Running or have run at least once

---

## Troubleshooting

If notifications don't appear:
1. Check app is in background (minimize it)
2. Verify app ID is correct
3. Check DBus service is running: `qdbus | grep lomiri`
4. Check logs: `journalctl -f | grep -i postal`
