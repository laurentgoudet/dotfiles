My VIM Config
=============

My VIM configuration.

Introduction
------------

Try to use the same keyboard shortcuts as Eclipse.

Main features
-------------

- Show documentation -> <F2>
- Save & run -> <CTRL> + <F11>

- Build index -> ?
- Go to definition ->

- Refactor method / function / class
- Set/unset breakpointsii

- Interactive shell (all language)

Thanks to the excellent Conque Shell[http://www.vim.org/scripts/script.php?script_id=2771] VIM plugin from Nico Raffo

To launch a shell in a new horizontal buffer enter `:S` followed by the name of your shell:

```bash
:S bash
:S iphyton
:S sqlite3mysql -h localhost -u joe -p sock_collection 
```

Send a visual selection from any buffer to the shell -> <F9>

Shell name autocompletion. I was previously using `-complete=shellcmd` completion type but I find more efficient to defined a custom list in my vimrc (see ShellNameCompletion function).

Panels that a traditionnal IDE open with.
- File browser ->
- Symbol browser ->
- Interactive shell ->

Hidden features
---------------

- Trim useless whitespaces on save
- Lint checking on save (pylint)

Bundles
-------

Installed plugins (as Git submodules):

- command-t      
- nerdtree     
- snipmate  
- vcscommand            
- vim-pathogen
- csapprox       
- pyflakes     
- supertab  
- vim-colors-solarized
- nerdcommenter  
- python-mode  
- taglist

Plugins
-------

- cscope
- dir_diff


Themes
------

- molokai.vim  
- mustang.vim  
- solarized-white.vim (default)


Installation
------------

The `install.sh` script allow easly deployement of this configuration.

```bash
./install.sh
```



File opening (thanks to CTRL-P)
------------------------------
<C-P> To open file browser
Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
Press <c-f> and <c-b> to cycle between modes.
Press <c-d> to switch to filename search instead of full path.
Press <c-r> to switch to regexp mode.
Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
Use <c-y> to create a new file and its parent directories.
Use <c-z> to mark/unmark multiple files and <c-o> to open them.
Use :25 to jump to line 25.
Use :/any\:\ string to jump to the first instance of any: string.
Use :diffthis when opening files marked by <c-z> to run :diffthis on the first 4 files.
