##----------------------------------------------------------------------
# Functions
##----------------------------------------------------------------------

# colors
if (( C == 256 )); then
    autoload spectrum && spectrum # Set up 256 color support.
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

 
