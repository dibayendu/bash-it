PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# ===================================================================================
# Constants
# ===================================================================================
# {
    # Reset
    Color_Off="\[\033[0m\]"       # Text Reset

    # Regular Colors
    Black="\[\033[0;30m\]"        # Black
    Red="\[\033[0;31m\]"          # Red
    Green="\[\033[0;32m\]"        # Green
    Yellow="\[\033[0;33m\]"       # Yellow
    Blue="\[\033[0;34m\]"         # Blue
    Purple="\[\033[0;35m\]"       # Purple
    Cyan="\[\033[0;36m\]"         # Cyan
    White="\[\033[0;37m\]"        # White

    # Bold
    BBlack="\[\033[1;30m\]"       # Black
    BRed="\[\033[1;31m\]"         # Red
    BGreen="\[\033[1;32m\]"       # Green
    BYellow="\[\033[1;33m\]"      # Yellow
    BBlue="\[\033[1;34m\]"        # Blue
    BPurple="\[\033[1;35m\]"      # Purple
    BCyan="\[\033[1;36m\]"        # Cyan
    BWhite="\[\033[1;37m\]"       # White

    # Underline
    UBlack="\[\033[4;30m\]"       # Black
    URed="\[\033[4;31m\]"         # Red
    UGreen="\[\033[4;32m\]"       # Green
    UYellow="\[\033[4;33m\]"      # Yellow
    UBlue="\[\033[4;34m\]"        # Blue
    UPurple="\[\033[4;35m\]"      # Purple
    UCyan="\[\033[4;36m\]"        # Cyan
    UWhite="\[\033[4;37m\]"       # White

    # Background
    On_Black="\[\033[40m\]"       # Black
    On_Red="\[\033[41m\]"         # Red
    On_Green="\[\033[42m\]"       # Green
    On_Yellow="\[\033[43m\]"      # Yellow
    On_Blue="\[\033[44m\]"        # Blue
    On_Purple="\[\033[45m\]"      # Purple
    On_Cyan="\[\033[46m\]"        # Cyan
    On_White="\[\033[47m\]"       # White

    # High Intensty
    IBlack="\[\033[0;90m\]"       # Black
    IRed="\[\033[0;91m\]"         # Red
    IGreen="\[\033[0;92m\]"       # Green
    IYellow="\[\033[0;93m\]"      # Yellow
    IBlue="\[\033[0;94m\]"        # Blue
    IPurple="\[\033[0;95m\]"      # Purple
    ICyan="\[\033[0;96m\]"        # Cyan
    IWhite="\[\033[0;97m\]"       # White

    # Bold High Intensty
    BIBlack="\[\033[1;90m\]"      # Black
    BIRed="\[\033[1;91m\]"        # Red
    BIGreen="\[\033[1;92m\]"      # Green
    BIYellow="\[\033[1;93m\]"     # Yellow
    BIBlue="\[\033[1;94m\]"       # Blue
    BIPurple="\[\033[1;95m\]"     # Purple
    BICyan="\[\033[1;96m\]"       # Cyan
    BIWhite="\[\033[1;97m\]"      # White

    # High Intensty backgrounds
    On_IBlack="\[\033[0;100m\]"   # Black
    On_IRed="\[\033[0;101m\]"     # Red
    On_IGreen="\[\033[0;102m\]"   # Green
    On_IYellow="\[\033[0;103m\]"  # Yellow
    On_IBlue="\[\033[0;104m\]"    # Blue
    On_IPurple="\[\033[10;95m\]"  # Purple
    On_ICyan="\[\033[0;106m\]"    # Cyan
    On_IWhite="\[\033[0;107m\]"   # White

    # Various variables you might want for your PS1 prompt instead
    Date="\d"
    Time12h="\T"
    Time12a="\@"
    PathShort="\w"
    PathFull="\W"
    NewLine="\n"
    User="\u"
    Host="\h"
    Jobs="\j"
    Last_Command="Last command returned ERROR!"

# }

# ===================================================================================
# PROMPT
# ===================================================================================
# {

    # https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh
    # Load in the git branch prompt script.
    # {
        # GIT_PS1_SHOWUPSTREAM="auto"
        # GIT_PS1_SHOWCOLORHINTS="yes"
        # source ~/dibayendu/repositories/bash-it/themes/dibs/.git-prompt.sh

        # uncomment only one of the two lines below
        # export PROMPT_COMMAND='__git_ps1 "\u@\h:\W" "\\\$ ";'
        # PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
    # }

    # https://github.com/djl/vcprompt/blob/master/bin/vcprompt
    # look into the above url for more info
    # {
        # export PS1="\u@\h:\w \$(vcprompt %s:%b:%m:%u:r)\$"
    # }

    # this is from powerline for bash
    # . /Users/fridaymedia/powerline/powerline/bindings/bash/powerline.sh

    # https://bbs.archlinux.org/viewtopic.php?pid=1068202#p1068202
    # PS1="\[\033[0;37m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[0;31m\]\h'; else echo '\[\033[0;33m\]\u\[\033[0;37m\]@\[\033[0;96m\]\h'; fi)\[\033[0;37m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;37m\]]\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]"

    function prompt_command() 
    {
        # The command below shows only the git branch
        PS1="$NewLine$Purple\[\342\224\214\342\224\200\]\$([[ \$? != 0 ]] && echo \"$Color_Off [$Color_Off$On_Red\[\342\234\227\] $Last_Command$Color_Off]\") $Cyan$Date $Red- $Purple$Time12h $Yellow$User$BRed@$Green$Host $Cyan[$Color_Off$On_IBlack\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)$Cyan]$NewLine$Purple\[\342\224\224\]> $Red[$Color_Off$On_Blue$PathShort$Red] $Color_Off\$ "
    }

    # https://github.com/magicmonty/bash-git-prompt
    # The command below shows a prompt which contains git branch and other git info
        function git_prompt_command() 
        {
            source ~/dibayendu/repositories/bash-it/themes/dibs/gitprompt.sh
        }
   
    PROMPT_COMMAND=prompt_command;
    # PROMPT_COMMAND=git_prompt_command;

# }

# ===================================================================================
# Basic Settings
# ===================================================================================
# {
    # export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
    stty -ixon -ixoff
        #osx color terminal
        # export CLICOLOR=1
    # don't put duplicate lines in the history. See bash(1) for more options
    # don't overwrite GNU Midnight Commander's setting of `ignorespace'.
    HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
    # ... or force ignoredups and ignorespace
    HISTCONTROL=ignoreboth

    # append to the history file, don't overwrite it
    shopt -s histappend
    # check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize

    PYTHONSTARTUP=~/.pythonrc.py
    export PYTHONSTARTUP

    # the line below evaluates fash for directory searching
        fasd_cache="$HOME/.fasd-init-bash"
        if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
            fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
        fi
        source "$fasd_cache"
        unset fasd_cache
# }

# ===================================================================================
# directories shortcut using marks
# ===================================================================================
# {
    export MARKPATH=$HOME/.marks
    function jump { 
        cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
    }
    function mark { 
        mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
    }
    function unmark { 
        rm -i $MARKPATH/$1 
    }
    function marks {
        ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/ -/g' && echo
    }
# }
