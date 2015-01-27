# ~/.profile: executed by the command interpreter for login shells.

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
#xset b 0
#setterm -blength 0

# Platform specific paths
if [ -f "$HOME/.host_profile" ] ; then
    . "$HOME/.host_profile"
fi
# Android tools
if [ -d "$HOME/dev/sdk/android-sdk-linux" ] ; then
    PATH="$PATH:$HOME/dev/sdk/android-sdk-linux/tools:$HOME/dev/sdk/android-sdk-linux/platform-tools"
fi
# KindleGen
if [ -d "$HOME/Development/tools/kindlegen/" ] ; then
    PATH="$PATH:$HOME/Development/tools/kindlegen"
fi
