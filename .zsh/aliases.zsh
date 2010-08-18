alias ls="ls --color=tty"
alias l="ls -lhB --color=tty"
alias la='ls -a --color=tty'
alias ll='ls -al --color=tty'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias su='su -s /bin/zsh'
alias untar='tar xzfv' 
alias nano='nano -w'
alias m='mplayer'

# Play safe!
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# from http://matt.blissett.me.uk/linux/zsh/zshrc
# Aliases to use zz function
# Use e.g. 'command gv' to avoid
alias 'z=echo $RANDOM > /dev/null; zz'
alias gv='z gv'
alias firefox='z firefox'
alias kate='z kate -u'
alias konsole='z konsole'
alias geany='z geany'
alias dolphin='z dolphin'

## Suffixes
# video
alias -s mkv=mplayer
alias -s avi=mplayer
alias -s mp4=mplayer
alias -s flv=mplayer
alias -s mv4=mplayer
alias -s wmv=mplayer
alias -s mpg=mplayer
alias -s mpeg=mplayer
alias -s ogm=mplayer
# archives
alias -s 'rar=unrar e'
alias -s 'gz=tar xzfv'
