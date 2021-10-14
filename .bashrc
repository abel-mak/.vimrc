# alias nasm=/Users/abel-mak/.brew/Cellar/nasm/2.15.05/bin/nasm
export MAIL=abel-mak@student.1337.ma
export PATH=$HOME/.brew/bin:$HOME/.brew/sbin:$PATH
export HISTCONTROL=ignoreboth:erasedups
#export VALGRIND_LIB="$HOME/valgrind/lib/valgrind"
#export PS1="\[\033[38;5;9m\]\h\[$(tput sgr0)\]\[\033[38;5;7m\]%\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
#export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;51m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\][\w]\\$\[$(tput sgr0)\]"
#export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;51m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:[\[$(tput sgr0)\]\[\033[38;5;48m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]]\\$ \[$(tput sgr0)\]"
#eval $(minikube docker-env)

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
cd 
#docker-machine start defaukt
#eval $(docker-machine env default)
bind "set completion-ignore-case on"
alias gcl='git clone'
alias sl='ls'
alias ll='ls -l'
alias la='ls -la'
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;7m\]@\[$(tput sgr0)\]\[\033[38;5;51m\]\h\[$(tput sgr0)\]\[\033[38;5;7m\][\[$(tput sgr0)\]\[\033[38;5;9m\]\w\[$(tput sgr0)\]\[\033[38;5;7m\]]\`parse_git_branch\`\\$ \[$(tput sgr0)\]"

#added from brew instalation of bash_completion
#Bash completion has been installed to:
#  /Users/abel-mak/.brew/etc/bash_completion.d
[[ -r "/Users/abel-mak/.brew/etc/profile.d/bash_completion.sh" ]] && . "/Users/abel-mak/.brew/etc/profile.d/bash_completion.sh"
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi
#bash_completion


# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "(${BRANCH}${STAT})"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}
#export PS1="\`parse_git_branch\` "
alias del=del

del()
{
	mv $@ ~/.Trash/
}
