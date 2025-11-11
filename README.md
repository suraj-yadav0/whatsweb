Whatsapp Web with Responsive Design for Ubuntu Touch And Example application for triggering Push Notifications Locally. 


Use this command from your desktop to send notifications to your device:

```bash
cd ../whatsweb/test-notifications
./notify.sh "Title" "Message" [counter]
```

Examples:
```bash
# Simple notification
./notify.sh "New Message" "You have a new chat"

# With counter badge
./notify.sh "Unread Messages" "5 new messages" 5

# No counter (defaults to 0)
./notify.sh "Alert" "Something happened"
```

