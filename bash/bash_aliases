# Bash aliases, separate from .bashrc to keep things more tidy
alias ls='ls -G --color=auto'
alias ll='ls -ahlF'
alias la='ls -A'
alias l='ls -CF'

alias igrep="grep --color -i -r --exclude='*.min.css' --exclude='*.min.js' --exclude='cscope.*' --exclude-dir='\.svn' --exclude-dir='\.git' --exclude-dir='\build'"
alias iminicom="sudo chown $USER /dev/ttyUSB0; minicom -w -c on -C ~/.minicom"
alias idu="du --max-depth=1 -ah | sort -hr"
alias iuntar="for file in *.tar*; do dir=\$(echo \$file | awk -F. '{ print \$1 }'); mkdir \$dir; echo \"Extracting \$file in \$dir...\"; tar -C \$dir -xzvf \$file; echo \"Done\"; done"
alias ils="ls --ignore=*.o"
alias issh="ssh 190.99.20.150"
alias vimg="awk -F':' '{print $1}' | xargs vim"
