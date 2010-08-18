##----------------------------------------------------------------------
# Env
##----------------------------------------------------------------------
C=$(tput colors)
typeset -U fpath
fpath=($Z/functions $fpath)

PATH="/usr/local/bin:/usr/local/sbin/:/bin:/sbin:/usr/bin:/usr/sbin:$PATH"

HOSTNAME="`hostname`"
LC_ALL='en_US.UTF-8'
LANG='en_US.UTF-8'
LC_CTYPE=C
PAGER='less'

# Global
export EDITOR='vim'
export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
export HISTSIZE=1000
export HISTFILE=~/.zhistory
export SAVEHIST=1000 
