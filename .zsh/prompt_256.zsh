YELLOW="%{$FX[reset]$FG[190]%}"
BLUE="%{$FX[reset]$FX[bold]$FG[033]%}"
CYAN="%{$FX[reset]$FX[bold]$FG[086]%}"
GREEN="%{$FX[reset]$FX[bold]$FG[046]%}"
ORANGE="%{$FX[reset]$FG[208]%}"
MUD_YELLOW="%{$FX[reset]$FG[136]%}"
GRAY="%{$FX[reset]$FX[bold]$FG[245]%}"
RED="%{$FX[reset]$FX[bold]$FG[160]%}"
PR_NO_COLOR="%{$terminfo[sgr0]%}"


PROMPT="${YELLOW}%n${BLUE}[${ORANGE}%40<...<%~%<<${BLUE}]${GREEN}%(!.#.$)$PR_NO_COLOR "
RPROMPT="${MUD_YELLOW}[%D{%m/%d %I:%M %p}]$PR_NO_COLOR" 