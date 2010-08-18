# ls_colors_256.zsh: Color definitions for the output of the ls command.
# P.C. Shyamshankar <sykora@lucentbeing.com>

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
