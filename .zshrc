##----------------------------------------------------------------------
# Env
##----------------------------------------------------------------------
Z=~/.zsh
C=$(tput colors)
typeset -U fpath

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

##----------------------------------------------------------------------
# Options
##----------------------------------------------------------------------
# Zsh settings for history
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt CORRECT			# command CORRECTION
setopt EXTENDED_HISTORY		# puts timestamps in the history

# Prompts for confirmation after 'rm *' etc
# Helps avoid mistakes like 'rm * o' when 'rm *.o' was intended
setopt RM_STAR_WAIT
# Background processes aren't killed on exit of shell
setopt AUTO_CONTINUE
# Don’t write over existing files with >, use >! instead
setopt NOCLOBBER
# Don’t nice background processes
setopt NO_BG_NICE
# setopt HASH_CMDS		# turns on hashing
setopt MENUCOMPLETE
setopt ALL_EXPORT
# Set/unset  shell options
setopt   notify globdots correct pushdtohome cdablevars autolist
setopt   correctall autocd recexact longlistjobs
setopt   autoresume histignoredups pushdsilent 
setopt   autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt bgnice autoparamslash

unsetopt ALL_EXPORT
autoload -U compinit
compinit -u

# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof 

##----------------------------------------------------------------------
# Functions
##----------------------------------------------------------------------

# colors
if (( C == 256 )); then

    # A script to make using 256 colors in zsh less painful.
    # P.C. Shyamshankar <sykora@lucentbeing.com>

    typeset -Ag FX FG BG

    FX=(
        reset     "[00m"
        bold      "[01m" no-bold      "[22m"
        italic    "[03m" no-italic    "[23m"
        underline "[04m" no-underline "[24m"
        blink     "[05m" no-blink     "[25m"
        reverse   "[07m" no-reverse   "[27m"
    )

    for color in {000..255}; do
        FG[$color]="[38;5;${color}m"
        BG[$color]="[48;5;${color}m"
    done
fi

# grep history
hist() {
    if [[ -n $1 ]]; then
        cat "$HISTFILE" | grep -i $1
    else
        cat "$HISTFILE"
    fi
}

# launch X app with no crap in screen
zz () {
    echo $*
    $* &> "/tmp/z-$1-$RANDOM" &!
}

# run ipython if no args
function python {
    IPYTHON="/usr/bin/ipython"
    PYTHON="/usr/bin/python" 
    if [[ -n $1 ]]; then
        $PYTHON $@
    elif [[ -e $IPYTHON ]]; then
        $IPYTHON
    else
        $PYTHON
    fi
}

# Quick find
f() {
    echo "find . -iname \"*$1*\""
    find . -iname "*$1*"
}
# Cat, sort, and uniquify file(s)
uniquify() {
    echo $*
    cat $* | sort | uniq -u > "`pwd`/uniquified.txt"
}

# clear pyc files..
pyclr() {
    find . -name '*.pyc' -exec rm {} \;
}

## /etc/rc.d/.. shortcut with completion
rc() {
    sudo /etc/rc.d/$1 $2
}
function _rc () { 
  case $CURRENT in
    2) compadd $(find /etc/rc.d/ -maxdepth 1 -type f -executable -printf '%f ');;
    3) compadd $(/etc/rc.d/$words[2] 2> /dev/null | grep -i usage | sed 's/.*{\(.*\)}/\1/; s/|/ /g');;
  esac
}
compdef _rc rc

 
##----------------------------------------------------------------------
# The PROMPT
##----------------------------------------------------------------------
# Colors
YELLOW="%{$FX[reset]$FG[190]%}"
BLUE="%{$FX[reset]$FX[bold]$FG[033]%}"
CYAN="%{$FX[reset]$FX[bold]$FG[086]%}"
GREEN="%{$FX[reset]$FX[bold]$FG[046]%}"
ORANGE="%{$FX[reset]$FG[208]%}"
MUD_YELLOW="%{$FX[reset]$FG[136]%}"
GRAY="%{$FX[reset]$FX[bold]$FG[245]%}"
LIGHT_GRAY="%{$FX[reset]$FG[245]%}"
RED="%{$FX[reset]$FX[bold]$FG[160]%}"
BABY_BLUE="%{$FX[reset]$FG[080]%}"
LIGHT_GREEN="%{$FX[reset]$FG[047]%}"
C_NO_COLOR="%{$terminfo[sgr0]%}"
C_RESET="%{$FX[reset]%}"
# vcs
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable hg git bzr svn
zstyle ':vcs_info:(hg*|git*):*' get-revision true
zstyle ':vcs_info:(hg*|git*):*' check-for-changes true
# rev+changes branch misc
zstyle ':vcs_info:hg*' formats "(%s)[%i%u %b %m]"
zstyle ':vcs_info:hg*' actionformats "(%s|%a)[%i%u %b %m]"
# hash changes branch misc
zstyle ':vcs_info:git*' formats "(%s)[%12.12i %u %b %m]"
zstyle ':vcs_info:git*' actionformats "(%s|%a)[%12.12i %u %b %m]"
zstyle ':vcs_info:hg*:netbeans' use-simple true
zstyle ':vcs_info:hg*:*' get-bookmarks true
zstyle ':vcs_info:hg*:*' get-mq true
zstyle ':vcs_info:hg*:*' get-unapplied true
zstyle ':vcs_info:hg*:*' patch-format "mq(%g):%n/%c %p"
zstyle ':vcs_info:hg*:*' nopatch-format "mq(%g):%n/%c %p"
zstyle ':vcs_info:hg*:*' unstagedstr "+"
zstyle ':vcs_info:hg*:*' hgrevformat "%r" # only show local rev.
zstyle ':vcs_info:hg*:*' branchformat "%b" # only show branch
zstyle ':vcs_info:*:prompt:*' nvcsformats "no" "no"

precmd () { 
    vcs_info 'prompt'
    hg="$vcs_info_msg_0_"
    PROMPT="${LIGHT_GREEN}%n${BLUE}[${ORANGE}%40<...<%~%<<${BLUE}]${GREEN}%(!.#.$)$C_NO_COLOR "
    if [[ $vcs_info_msg_0_ != "no" ]];
    then
        RPROMPT="${C_RESET}${LIGHT_GRAY}$hg${C_NO_COLOR}"
    else
        RPROMPT="${MUD_YELLOW}[%D{%m/%d %I:%M %p}]$C_NO_COLOR"
    fi        
}


##----------------------------------------------------------------------
# Aliases
##----------------------------------------------------------------------
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


##----------------------------------------------------------------------
# Completion
##----------------------------------------------------------------------
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path $Z/cache/$HOST
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions
# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
# command for process lists, the local web server details and host completion
# on processes completion complete all user processes
zstyle ':completion:*:processes' command 'ps -au$USER'
## add colors to processes for kill completion
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -A -o pid,user,cmd'
zstyle ':completion:*:processes-names' command 'ps axho command' 
#NEW completion:
# 1. All /etc/hosts hostnames are in autocomplete
# 2. If you have a comment in /etc/hosts like #%foobar.domain,
#    then foobar.domain will show up in autocomplete!
zstyle ':completion:*' hosts $(awk '/^[^#]/ {print $2 $3" "$4" "$5}' /etc/hosts | grep -v ip6- && grep "^#%" /etc/hosts | awk -F% '{print $2}') 
# Filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' '*?.old' '*?.pro'
# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm apache bin daemon games gdm halt ident junkbust lp mail mailnull \
        named news nfsnobody nobody nscd ntp operator pcap postgres radvd \
        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs avahi-autoipd\
        avahi backup messagebus beagleindex debian-tor dhcp dnsmasq fetchmail\
        firebird gnats haldaemon hplip irc klog list man cupsys postfix\
        proxy syslog www-data mldonkey sys snort
# SSH Completion
zstyle ':completion:*:scp:*' tag-order \
   files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order \
   files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order \
   users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order hosts-domain hosts-host users hosts-ipaddr
zstyle '*' single-ignored show

##----------------------------------------------------------------------
# Key bindings
##----------------------------------------------------------------------
typeset -g -A key
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "^H" backward-delete-word
# for rxvt
#bindkey "\e[8~" end-of-line
#bindkey "\e[7~" beginning-of-line
### for non RH/Debian xterm, can't hurt for RH/DEbian xterm
#bindkey "\eOH" beginning-of-line
#bindkey "\eOF" end-of-line
## for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix
# word jumping
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
# history search
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward 


##----------------------------------------------------------------------
# ls Colors
##----------------------------------------------------------------------

typeset -TUg LS_COLORS ls_colors

ls_colors=(
    # Standard Descriptors.
    'no=00'                                 # Normal
    'fi=00'                                 # Files
    'di=01;38;05;63'                    # Directories
    'ln=04;38;05;44'                    # Links
    'pi=38;05;88'                         # Named Pipes
    'so=38;05;252'                        # Sockets
    'bd=38;05;237'                        # Block Devices
    'cd=38;05;243'                        # Character Devices
    'or=01;38;05;196'                   # ???
    'mi=01;05;38;05;196'                # Missing Files
    'ex=03;38;05;46'                    # Executables
    #'tw=01;38;05;63' 
    'ow=01;38;05;75'

    # Files, by extension.

    # Documents

    '*.pdf=38;05;208'

    # Images
    '*.bmp=38;05;51'
    '*.gif=38;05;51'
    '*.jpg=38;05;51'
    '*.png=38;05;51'
    '*.svg=38;05;51'
    '*.tif=38;05;51'
    '*.xbm=38;05;51'
    '*.xpm=38;05;51'

    # Audio
    '*.mp3=38;05;141'
    '*.ogg=38;05;141'
    '*.wav=38;05;141'
    '*.wma=38;05;141'
    '*.flac=38;05;141'

    # Video
    '*.avi=38;05;81'
    '*.divx=38;05;81'
    '*.mp4=38;05;81'
    '*.m4v=38;05;81'
    '*.flv=38;05;81'
    '*.xvid=38;05;81'
    '*.mkv=38;05;81'
    '*.wmv=38;05;81'
    '*.ogm=38;05;81'

    # Archives
    '*.7z=38;05;162'
    '*.Z=38;05;162'
    '*.ace=38;05;162'
    '*.arj=38;05;162'
    '*.bz2=38;05;162'
    '*.bz=38;05;162'
    '*.cpio=38;05;162'
    '*.deb=38;05;162'
    '*.gz=38;05;162'
    '*.lzh=38;05;162'
    '*.rpm=38;05;162'
    '*.tar=38;05;162'
    '*.taz=38;05;162'
    '*.tgz=38;05;162'
    '*.tz=38;05;162'
    '*.z=38;05;162'
    '*.zip=38;05;162'
    '*.rar=38;05;162'
    
    # Other
    '*.torrent=38;05;120'
    '*.nzb=38;05;120'
)

export LS_COLORS



# For yaourt
export color=
