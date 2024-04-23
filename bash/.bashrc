#
# ~/.bashrc
#

NOCOLOR="0"
BLACK="0;30"
DARK_GRAY="1;30"
RED="0;31"
LIGHT_RED="1;31"
GREEN="0;32"
LIGHT_GREEN="1;32"
BROWN_ORANGE="0;33"
YELLOW="1;33"
BLUE="0;34"
LIGHT_BLUE="1;34"
PURPLE="0;35"
LIGHT_PURPLE="1;35"
CYAN="0;36"
LIGHT_CYAN="1;36"
LIGHT_GRAY="0;37"
WHITE="1;37"

EMOJI_LIST=( "🦌" "🇺🇦" "💾" "💻" "📼" "🌃" "🌆" "🌇" "🌌" "☕" "🩹" "☢" "☣" "🦊" );

select_emoji() {
  echo ${EMOJI_LIST[$RANDOM % ${#EMOJI_LIST[@]}]}
}

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/';
};

get_pwd_partial() {
  if [ "${PWD:50}" == "" ]; then
    echo "$PWD";
  else
    echo "${HOME}/.../${PWD##*/}";
  fi
};


alias ls='ls --color=auto';
alias grep='grep --color=auto';
alias nv='nvim';
alias vim='nvim';

export PS1="\e[1m\e[7m\e[38;2;231;191;126m[\$(select_emoji)][\u \$(get_pwd_partial)]\e[\${NOCOLOR}m\n\$(parse_git_branch) \$ ";

export HISTSIZE=20000
export HISTFILESIZE=20000

if [ "$NVIM" == "" ]; then
  source /usr/share/bash-completion/completions/git
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bindings/bash/powerline.sh
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# if running in VSCode
[[ $TERM_PROGRAM = vscode ]] && return
# if running in NVIM
[[ "$NVIM" != "" ]] && return
# Otherwise start tmux
[[ -z "$TMUX" ]] && exec tmux
