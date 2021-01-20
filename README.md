
# Reminder

The purpose of this tools is to have a very quick and easy way for setting reminders. It can be used, e.g. for setting reminders for work breaks or setting a time box for Twitter surfing.

## Dependencies

Currently only Debian/Ubuntu and MacOS are officially supported.

### Debian / Ubuntu

The following dependencies need to be installed to run `reminder` on Linux:

#### [libnotify](https://github.com/GNOME/libnotify)

```
sudo apt-get install libnotify-bin
```

### MacOS

The following dependencies need to be installed to run `reminder` on MacOS:

#### [terminal-notifier](https://github.com/julienXX/terminal-notifier)

```
brew install terminal-notifier
```

#### [GNU core utils](https://formulae.brew.sh/formula/coreutils)

```
brew install coreutils
```

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

### Open a reminder in X minutes

```
reminder add 25
```

### Open a reminder with a message in X minutes

```
reminder add 25 "Take a break"
```

### Open a reminder with a link

```
reminder add 15 "Check test results" "https://jenkins"
```

### Show all scheduled reminders

```
reminder list
```

### Stop scheduled reminder

```
reminder stop <pid>
```

## References
- https://stackoverflow.com/questions/645992/bash-sleep-until-a-specific-time-date
- https://superuser.com/a/483464
- https://unix.stackexchange.com/questions/3886/difference-between-nohup-disown-and
- https://unix.stackexchange.com/questions/197748/is-there-a-desktop-notification-that-stays-shown-until-i-click-it
- https://stackoverflow.com/a/3510850/2339010
- https://stackoverflow.com/a/13059218/2339010
- Stretchly, Workrave
