export PGHOST=localhost
export PGPORT=5433
#export PS1="\w@\h (\u) \n=> "
#export PS2="=> "
export PS1=' \[\033[01;32m\]\u\[\033[01;34m\]@\[\033[01;31m\]\h\[\033[00;34m\]{\[\033[01;34m\]\w\[\033[00;34m\]}\[\033[01;32m\] : \[\033[00m\]'
clear
echo -e "${LIGHTGRAY}";figlet " Yo!  This  is  Jarvis";
echo -ne "${LIGHTRED}" "Hello, $USER";
echo -e "${LIGHTRED}" "Today is: \t${LIGHTGRAY}" `date`;
echo -e "${LIGHTRED}" "Kernel Information: \t${LIGHTGRAY}" `uname -smr`
#echo -ne "${cyan}";upinfo;echo ""


#source "/usr/share/git/completion/git-prompt.sh"

GIT_PS1_SHOWDIRTYSTATE=1;
GIT_PS1_SHOWCOLORHINTS=1;
GIT_PS1_SHOWUNTRACKEDFILES=1;

SH_WHITE="\[\033[1;37m\]"
SH_BLUE="\[\033[1;34m\]"
SH_RED="\[\033[1;31m\]"
SH_GREEN="\[\033[1;32m\]"
SH_YELLOW="\[\033[1;33m\]"

BL_ANGLE="\342\224\224"
TL_ANGLE="\342\224\214"
HORIZ_LINE="\342\224\200"

BATT="\$(acpi -b | awk '{print \$4}' | cut -b1-3)"
FILES_STAT="\$(ls -1 | wc -l | sed 's: ::g')"
FILES_SIZE="\$(ls -lah | grep -m 1 total | sed 's/1:total //')b"
GIT_PS1='$(__git_ps1 "(%s)")'

if [ $UID -eq 0 ]; then
PS1='\[\e[0;31m\]\u\[\e[m\]\[\e[1;37m\]@\h\[\e[m\] \[\e[1;34m\]\W\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;32m\]'
elif [ -n "$SSH_CLIENT" ]; then
    PS1='\[\e[0;31m\](SSH)\[\e[m\]\[\e[1;37m\]\u@\h\[\e[m\] \[\e[1;34m\]\W\[\e[m\] \[\e[1;32m\]$(acpi -b | awk "{print \$4}" | cut -b1-3) $(__git_ps1 "(%s) ")\$\[\e[m\] \[\e[1;32m\]'
else
PS1="\n"${SH_WHITE}${TL_ANGLE}"("${SH_BLUE}"\u"${SH_WHITE}"@"${SH_RED}"\h"${SH_WHITE}")"${HORIZ_LINE}"("${SH_GREEN}"\$?"${SH_WHITE}")"${HORIZ_LINE}"("${SH_GREEN}${BATT}${SH_WHITE}")"${HORIZ_LINE}"("${SH_GREEN}"\@ \d"${SH_WHITE}")\n"${BL_ANGLE}${HORIZ_LINE}"("${SH_GREEN}"\w"${SH_WHITE}")"${HORIZ_LINE}"("${SH_YELLOW}${FILES_STAT}" files, "${FILES_SIZE}${SH_WHITE}")"${HORIZ_LINE}${SH_BLUE}${GIT_PS1}${SH_WHITE}"> "${SH_WHITE}
fi
trap 'echo -ne "\e[0m"' DEBUG