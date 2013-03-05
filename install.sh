#!/bin/sh
#
# Chris's dotfile installer. Usage:
#      ./install.sh [install|uninstall] (default: install)
#

basedir="$(cd "$(dirname $0)" && pwd -P)"

function has() {
    return $( which $1 >/dev/null )
}

function note() {
    echo "[32;1m * [0m$*"
}

function warn() {
    echo "[31;1m * [0m$*"
}

function die() {
    warn $*
    exit 1
}

function link() {
    target=$1
    link=$2

    if [ -e $link ]; then
        if [ -L $link ]; then
            # Already symlinked -- I'll assume correctly.
            return
        else
            # Rename files with a ".old" extension.
            warn "$link file already exists, renaming to $link.old"
            backup=$link.old
            if [ -e $backup ]; then
                die "$backup already exists. Aborting."
            fi
            mv -v $link $backup
        fi
    fi

    # Update existing or create new symlinks.
    ln -vsf $target $link
}

function unlink() {
    link=$1

    if [ -e $link ]; then
      if [ -L $link ]; then
        # Deleting current link
	rm $link
      else
        warn "$link in not a symlink!"
      fi
      if [ -f $link.old]; then
        # Restoring old configuration
        note "restoring old configuration for $link"
        mv $link.old $link
      fi
    fi
}

case "$1" in

  # UNINSTALL -----------------------------------------------------------------
  uninstall)
    note "Uninstalling dotfiles.."
    cd $basedir
    for dotfile in * ; do
      case $dotfile in 
        .|..|.git|README.md|install.sh)
	  continue
	  ;;
        *)
          unlink $HOME/.$dotfile
          ;;
      esac
    done
    note "Done."
    ;;

  # INSTALL -------------------------------------------------------------------
  *)
    note "Installing dotfiles.."
    cd $basedir
    for dotfile in * ; do
      case $dotfile in 
        .|..|.git|README.md|install.sh)
	  continue
	  ;;
        *)
          link $basedir/$dotfile $HOME/.$dotfile
          ;;
      esac
    done
    note "Done."
    ;;
esac
