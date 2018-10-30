
# Reminder

https://twitter.com/CommitStrip/status/1056968431369625605

## Setup

### Debian

```
sudo apt-get install libnotify-bin
```
`gedit ~/.bashrc`
```
PATH="~/src/experimental-software/reminder:$PATH"
```

### MacOS

- GNU core utils

https://stackoverflow.com/a/12597369/2339010

## Usage

### Open a reminder in X minutes

```
reminder 25
```

### Open a reminder at a given time

```
reminder 11:55
```

### Show all scheduled reminders

```
ps aux | grep "notification"
```

### Kill all scheduled reminders

```
kill $(ps aux | grep 'schedule_notification.sh' | awk '{print $2}')
```

## References
- https://stackoverflow.com/questions/645992/bash-sleep-until-a-specific-time-date
- https://superuser.com/a/483464
- https://unix.stackexchange.com/questions/3886/difference-between-nohup-disown-and
- https://unix.stackexchange.com/questions/197748/is-there-a-desktop-notification-that-stays-shown-until-i-click-it
- https://stackoverflow.com/a/3510850/2339010
- https://stackoverflow.com/a/13059218/2339010
