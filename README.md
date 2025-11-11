Whatsapp Web with Responsive Design for Ubuntu Touch And Example application for triggering Push Notifications Locally. 


Use this command from your desktop to send notifications to your device:

```bash
cd ../whatsweb/test-notifications
./notify-remote.sh "Title" "Message" [counter]
```

Examples:
```bash
# Simple notification
./notify-remote.sh "New Message" "You have a new chat"

# With counter badge
./notify-remote.sh "Unread Messages" "5 new messages" 5

# No counter (defaults to 0)
./notify-remote.sh "Alert" "Something happened"
```

