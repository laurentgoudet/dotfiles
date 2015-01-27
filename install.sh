#!/bin/bash
#
# Chris's dotfile installer. Usage:
#      ./install.sh [install|uninstall] (default: install)
#

basedir="$(cd "$(dirname "$0")" && pwd -P)"

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
            # Already symlinked -- Let's update it anyway
            rm $link
        else
            # Rename files with a ".old" extension.
            warn "$link file already exists, renaming to $link.old"
            backup=$link.old
            if [ -e $backup ]; then
                die "$backup already exists. Aborting."
            fi
            mv $link $backup
        fi
    fi

    # Update existing or create new symlinks.
    note "Creating symlink $link"
    ln -sf $target $link
}

function unlink() {
    link=$1
    if [ -e $link ]; then
      if [ -L $link ]; then
        # Deleting current link
        note "Deletink symlink $link"
        rm $link
      else
        warn "$link in not a symlink!"
      fi
      if [ -e $link.old ]; then
        # Restoring old configuration
        note "Restoring old configuration for $link"
        mv $link.old $link
      fi
    fi
}

case "$1" in

  # UNINSTALL -----------------------------------------------------------------
  uninstall)
    note "Uninstalling dotfiles.."
    cd $basedir
    for dotfile in .* ; do
      case $dotfile in
        .gitconfig.base)
          unlink $HOME/.gitconfig
          ;;
        .ssh)
          unlink $HOME/.ssh/config
          ;;  
        .|..|.git|.gitconfig.base)
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
  note "Installing dotfiles..."
  cd $basedir
  for dotfile in .* ; do
    case $dotfile in
      .gitconfig.base)
        link $basedir/$dotfile $HOME/.gitconfig
        ;;  
      .ssh)
        link $basedir/.ssh/config $HOME/.ssh/config
        ;;  
      .|..|.git|.gitconfig.base)
        continue
        ;;
      *)
        link $basedir/$dotfile $HOME/$dotfile
        ;;
    esac
  done
  note "Installing bin/ directory"
  link $basedir/bin $HOME/bin
  note "Setting up vim bundles"
  git submodule init
  git submodule update
  note "Done."
  ;;
esac

