#!/bin/sh
#
# Chris's dotfile installer. Usage:
#      ./install.sh [install|uninstall] (default: install)
#

basedir=$(dirname $0)

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
    src=$1
    dest=$2

    if [ -e $dest ]; then
        if [ -L $dest ]; then
            # Already symlinked -- I'll assume correctly.
            return
        else
            # Rename files with a ".old" extension.
            warn "$dest file already exists, renaming to $dest.old"
            backup=$dest.old
            if [ -e $backup ]; then
                die "$backup already exists. Aborting."
            fi
            mv -v $dest $backup
        fi
    fi

    # Update existing or create new symlinks.
    ln -vsf $src $dest
}

function unlink() {
    link=$1

    if [ -e $dest ]; then
      if [ -L $dest ]; then
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
    for dotfile in * ; do
      case $dotfile in 
        .|..|.git|README.md)
	  continue
	  ;;
        *)
          unlink $HOME/$dotfile
          ;;
      esac
    done
    note "Done."
    ;;

  # INSTALL -------------------------------------------------------------------
  *)
    note "Installing dotfiles.."
    for dotfile in * ; do
      case $dotfile in 
        .|..|.git|README.md)
	  continue
	  ;;
        *)
          link $basedir/$dotfile $HOME/$dotfile
          ;;
      esac
    done
    note "Done."
    ;;
esac
