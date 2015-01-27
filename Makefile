DOTFILES=$(shell pwd)
all:: setup bash vim misc git ssh

setup::
	@mkdir -p ${HOME}/.config

bash::
	@ln -fns $(DOTFILES)/bash/bashrc ${HOME}/.bashrc
	@ln -fs $(DOTFILES)/bash/bash_profile ${HOME}/.bash_profile
	@ln -fs $(DOTFILES)/bash/bash_aliases ${HOME}/.bash_aliases
	@echo .bash symlinked

vim::
	@ln -fns $(DOTFILES)/vim ${HOME}/.vim
	@echo .vim symlinked

git::
	@ln -fs $(DOTFILES)/git/gitconfig ${HOME}/.gitconfig
	@ln -fns $(DOTFILES)/git ${HOME}/.config/git
	@echo .git symlinked

ssh::
	@ln -fns $(DOTFILES)/ssh ${HOME}/.ssh
	@echo .ssh symlinked

misc::
	@ln -fs $(DOTFILES)/cvsignore ${HOME}/.cvsignore
	@ln -fns $(DOTFILES)/local/bin ${HOME}/.local/bin
	@echo misc symlinked
