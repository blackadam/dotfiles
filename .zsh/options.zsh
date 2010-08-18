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
compinit

# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof 
