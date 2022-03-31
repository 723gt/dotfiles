# Created by newuser for 5.0.2
# (d) is default on

# ------------------------------
# General Settings
# ------------------------------
export EDITOR=vim        # エディタをvimに設定
export LANG=ja_JP.UTF-8  # 文字コードをUTF-8に設定
export KCODE=u           # KCODEにUTF-8を設定
export AUTOFEATURE=true  # autotestでfeatureを動かす

bindkey -v              # キーバインドをviモードに設定

setopt auto_pushd        # cd時にディレクトリスタックにpushdする
setopt correct           # コマンドのスペルを訂正する
setopt prompt_subst      # プロンプト定義内で変数置換やコマンド置換を扱う
setopt notify            # バックグラウンドジョブの状態変化を即時報告する
#setopt equals            # =commandを`which command`と同じ処理にする

### Complement ###
# autoload -U compinit; compinit # 補完機能を有効にする
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない

### History ###
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=10000            # メモリに保存されるヒストリの件数
SAVEHIST=10000            # 保存されるヒストリの件数
setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する

# マッチしたコマンドのヒストリを表示できるようにする
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# すべてのヒストリを表示する
function history-all { history -E 1 }

# ------------------------------
# Look And Feel Settings
# ------------------------------
### Ls Color ###
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

### Prompt ###
# プロンプトに色を付ける
autoload -U colors; colors
# 一般ユーザ時
tmp_prompt="%F{cyan}[%n@%~]$%f "
#tmp_prompt="%{${fg[green]}%}%n%# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%{${reset_color}%}%(?.%{$fg[green]%}.%{$fg[red]%})%(?!(*'-') !(*;-;%)? )%{${reset_color}%}"
#tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"
tmp_sprompt="%{$fg[red]%}%{$suggest%}(*'~'%)? < もしかして %B%r%b %{$fg[red]%}かな? [そう!(y), 違う!(n),a,e]:${reset_color} "

# rootユーザ時(太字にし、アンダーバーをつける)
if [ ${UID} -eq 0 ]; then
  tmp_prompt="%B%U${tmp_prompt}%u%b"
  tmp_prompt2="%B%U${tmp_prompt2}%u%b"
  tmp_rprompt="%B%U${tmp_rprompt}%u%b"
  tmp_sprompt="%B%U${tmp_sprompt}%u%b"
fi

PROMPT=$tmp_prompt    # 通常のプロンプト
PROMPT2=$tmp_prompt2  # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
RPROMPT=$tmp_rprompt  # 右側のプロンプト
SPROMPT=$tmp_sprompt  # スペル訂正用プロンプト
# SSHログイン時のプロンプト
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
;

#Title
#precmd() {
#    [[ -t 1 ]] || return
#    case $TERM in
#        *xterm*|rxvt|(dt|k|E)term)
#        print -Pn "\e]2;[%~]\a"    
#	;;
#        # screen)
        #      #print -Pn "\e]0;[%n@%m %~] [%l]\a"
        #      print -Pn "\e]0;[%n@%m %~]\a"
        #      ;;
#    esac
#}


# ------------------------------
# Other Settings
# ------------------------------

### Aliases ###
#時刻を表示させる
#alias history='history -E'

# cdコマンド実行後、lsを実行する
function cd() {
  dir=$@
  if [ ! $dir = $HOME ]; then
    builtin cd $@ && ls -a ;
  else
    builtin cd
  fi
}

#alias ls='ls --color=auto'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'

alias la='ls -a'
alias ll='ls -lha'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

#tmux Autostart
# if [[ ! -n $TMUX ]]; then
#    tmux new-session && exit
# fi

# run setup script
# it's gitignoer files
if [ -e "~/dotfiles/setup.sh" ]; then
  ~/dotfiles/setup.sh
fi

#nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH 

#pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

#postgresql
export PGDATA=/usr/local/var/postgres
alias pgs='postgres -D /usr/local/var/postgres'
alias pgst='pg_ctl -D /usr/local/var/postgres stop'
#screen
#alias screen='screen-4.5.0'
#MySQL
alias mss='mysql.server start'
alias mst='mysql.server stop'

# source ~/.nvm/nvm.sh
#java
#export JAVA_HOME=`/usr/libexec/java_home -v 1.5`
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
#nano殺し
alias nano='vim'
#vimを早く呼び出したい!
alias v='vim'
#Chrome
alias chrome='open -a Google\ Chrome'
#Go
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# added by travis gem
[ -f /Users/natsumi/.travis/travis.sh ] && source /Users/natsumi/.travis/travis.sh

#neovim
export XDG_CONFIG_HOME=$HOME/.config

#usb
alias usbumt='sudo diskutil umount'
alias usbls='ls /Volumes'

#create gitignore
alias gig='touch .gitignore;echo "create gitignore"'
export PATH="/usr/local/opt/openssl/bin:$PATH"

#git -> gti  
alias gti='git'
alias g='git'

#less -> less -R
alias less='less -R'
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/usr/local/opt/libxml2/bin:$PATH"

#git commi -v
#set -o vi
#bindkey -M viins 'jj' vi-cmd-mode

alias md5sum='shasum'

#edit dotfile
alias zshrc='vim ~/.zshrc'
alias szsh='source ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias cdhdd='cd /Volumes/hdd01'

alias c="cd"

export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'
export HOMEBREW_GITHUB_API_TOKEN=deec362b7ea4449a88bf6e88092051434d32dd3e
# eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"

# perl
if which plenv > /dev/null; then eval "$(plenv init -)"; fi

# zsh vim mode
bindkey -M viins 'jj' vi-cmd-mode

# bkup
function bkup(){ tar -zcvf $1."`date '+%Y%m%d'`".tar.gz $1}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 

# export PATH="$PATH:/Users/natsumi/development/flutter/bin"
alias iphone='open -a Simulator'
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"$HOME/fvm/default/bin"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH=$PATH:/Applications/"Android Studio.app"/Contents/jre/jdk/Contents/Home/bin
export JAVA_HOME=/Applications/"Android Studio.app"/Contents/jre/jdk/Contents/Home/

alias freezed="flutter pub run build_runner build --delete-conflicting-outputs"
alias fvmupdate="pub global list | awk '{print $1}' | xargs -n1 pub global activate"

eval `ssh-agent`

alias sshAgentStart="eval `ssh-agent`"
