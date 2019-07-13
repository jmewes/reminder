
# Reminder

The purpose of this tools is to have a very quick and easy way for setting reminders. It can be used, e.g. for setting reminders for work breaks or setting a time box for Twitter surfing.

Currently only Debian/Ubuntu and MacOS are officially supported.

## Setup

### Debian / Ubuntu

```
sudo apt-get install libnotify-bin

cd ~/src/experimental-software
git clone git@github.com:experimental-software/reminder.git
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
- Stretchly, Workrave
