#!/bin/bash -e
#
# Updates Vim plugins.
#
# Update everything (long):
#
#   ./update.sh
#
# Update just the things from Git:
#
#   ./update.sh repos
#
# Update just one plugin from the list of Git repos:
#
#   ./update.sh repos powerline
#

vimdir="$(cd "$(dirname "$0")" && pwd -P)"
bundledir=.vim/bundle
me=$vimdir/update.sh

# I have an old server with outdated CA certs.
if [ -n "$INSECURE" ]; then
  curl='curl --insecure'
  export GIT_SSL_NO_VERIFY=true
else
  curl='curl'
fi

# URLS --------------------------------------------------------------------

# This is a list of all plugins which are available via Git repos. https:// URLs
# don't work.
repos=(
  #'pathogen;https://github.com/tpope/vim-pathogen.git'
  'nerdtree;https://github.com/scrooloose/nerdtree'
  'command-t;https://github.com/wincent/Command-T.git'
  'pyflakes;https://github.com/kevinw/pyflakes-vim.git'
  'csapprox;https://github.com/godlygeek/csapprox.git'
  'solarized;https://github.com/altercation/vim-colors-solarized.git'
  'vcscomand;https://repo.or.cz/vcscommand'
  'snipmate;https://github.com/msanders/snipmate.vim.git'
  'nerdcommenter;https://github.com/scrooloose/nerdcommenter.git'
  'supertab;https://github.com/ervandew/supertab.git'
  'hitlinks;https://github.com/kergoth/vim-hilinks.git'
  'taglist;https://github.com/vim-scripts/taglist.vim.git'
  'vimdroid;https://git@bitbucket.org/lgoudet/vimdroid.git'
  )

# Here's a list of everything else to download in the format
# <destination>;<url>[;<filename>]
other=(
  )

case "$1" in

  # GIT -----------------------------------------------------------------
  repos)
    for pair in ${repos[@]}; do
      parts=($(echo $pair | tr ';' '\n'))
      name=${parts[0]}
      url=${parts[1]}
      filename=${parts[2]}
      dest=$bundledir/$name
      if [ -n "$2" ]; then
        if ! (echo "$url" | grep "$2" &>/dev/null) ; then
          continue
        fi
      fi
      echo "Updating $name.."
      git subtree add --prefix=$dest --squash $url master
    done
    ;;

  # TARBALLS AND SINGLE FILES -------------------------------------------
  other)
    set -x

    for pair in ${other[@]}; do
      parts=($(echo $pair | tr ';' '\n'))
      name=${parts[0]}
      url=${parts[1]}
      filename=${parts[2]}
      dest=$bundledir/$name

      rm -rf $dest

      if echo $url | egrep '.zip$'; then
        # Zip archives from VCS tend to have an annoying outer wrapper
        # directory, so unpacking them into their own directory first makes it
        # easy to remove the wrapper.
        f=download.zip
        $curl -L $url >$f
        unzip $f -d $name
        mkdir -p $dest
        mv $name/*/* $dest
        rm -rf $name $f

      else
        # Assume single files. Create the destination directory and download
        # the file there.
        mkdir -p $dest
        pushd $dest
        if [ -n "$filename" ]; then
          $curl -L $url >$filename
        else
          $curl -OL $url
        fi
        popd

      fi

    done

    popd
    ;;

  list)
    echo "Installed VIM plugins"
    echo "====================="
    echo "-> As submodules:"
    for repo in ${repos[@]}; do
      echo "- $repo"
    done
    echo "-> Standalone:"
    ;;

  # HELP ----------------------------------------------------------------

  all)
    $me repos
    $me other
    echo
    echo "Update OK"
    ;;

  *)
    set +x
    echo
    echo "Usage: $0 <section> [<filter>]"
    echo "...where section is one of:"
    grep -E '\w\)$' $me | sed -e 's/)//'
    echo
    echo "<filter> can be used with the 'repos' section."
    exit 1

esac
