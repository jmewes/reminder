
# Reminder

The purpose of this tools is to have a very quick and easy way for setting reminders. It can be used, e.g. for setting reminders for work breaks or setting a time box for Internet surfing.

## Dependencies

### System

- Ubuntu or macOS
- Python3

### Debian / Ubuntu

The following additional dependency needs to be installed to open system notifications on Linux:

```
sudo apt-get install libnotify-bin
```

(See [libnotify](https://github.com/GNOME/libnotify) for details.)

### macOS

The following additional dependency needs to be installed to open system notifications on macOS:

```
brew install terminal-notifier
```

(See [terminal-notifier](https://github.com/julienXX/terminal-notifier) for details.)

### Installation

When the dependencies required for your system are installed, you can
install `reminder` by cloning the Git repository and putting its directory
on the binary path:

```
cd ~/src/experimental-software
git clone git@github.com:experimental-software/reminder.git
```

`vim ~/.bashrc` or `vim ~/.bash_profile`
```
PATH="~/src/experimental-software/reminder:$PATH"
```

## Usage

### Set a reminder in X minutes

```
reminder add 25
```

### Set a reminder with a message in X minutes

```
reminder add 25 "Take a break"
```

### Set a reminder with a link

```
reminder add 15 "Check test results" "https://jenkins/job/test"
```

### Set a reminder at a specific time

If a timestamp in `HOUR:MINUTE` format is provided, a reminder for the specific point in time will be created.
The `HOUR` needs to be an integer number in the range from 0-23 and the `MINUTE` needs the be an integer number in the range from 0-59.

```
reminder add 19:58 "Turn on radio"
```

### Show all scheduled reminders

```
reminder list
```

### Stop scheduled reminder

```
reminder stop <pid>
```
