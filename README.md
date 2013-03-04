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


