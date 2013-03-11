#!/usr/bin/python
import sys

import gntp.notifier

# Simple "fire and forget" notification
# gntp.notifier.mini("Here's a quick message")

# More complete example
growl = gntp.notifier.GrowlNotifier(
    applicationName = "Python",
    notifications = ["New Updates","New Messages"],
    defaultNotifications = ["New Messages"],
    hostname = "1.2.3.1",
    password = "notification"
)
growl.register()

# Send one message
growl.notify(
    noteType = "New Messages",
    title = sys.argv[1],
    description = sys.argv[2],
    icon = "https://bitbucket-assetroot.s3.amazonaws.com/c/photos/2013/Feb/22/guestapp-logo-3000174420-0_avatar.png",
    sticky = False,
    priority = 1,
)
