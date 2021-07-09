# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME=avit

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(vi-mode git)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="$HOME/bin:usr/local/bin:usr/bin:/bin:usr/local/sbin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

bindkey -v
bindkey '^k' kill-line
bindkey '^u' kill-whole-line
bindkey '^r' history-incremental-search-backward
bindkey '^[.' insert-last-word
export KEYTIMEOUT=40
bindkey 'jk' vi-cmd-mode
bindkey ';l' end-of-line
bindkey ';h' beginning-of-line
bindkey "^w" history-beginning-search-backward
bindkey "^f" history-beginning-search-forward

function serve {
            port="${1:-4000}"
            ruby -r webrick -e "s = WEBrick::HTTPServer.new(:Port => $port, :DocumentRoot => Dir.pwd); trap('INT') { s.shutdown }; s.start"
          }
alias gds="git diff --staged"
alias g="git status"
alias start_pg="pg_ctl -D /usr/local/var/postgres start"
alias foreman_dev_start="foreman start -f Procfile.dev"
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias cl="clear"
alias d="docker"
alias rake='noglob rake'
alias "bundle exec cap production deploy"="ssh-add -K; bundle exec cap production deploy"

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$(yarn global bin):$PATH"

eval "$(rbenv init -)"
#if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
#export PATH="$(brew --prefix qt@5.5)/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use  # This loads nvm
alias node='nvm use; unalias node; node $@'
export PATH="$(brew --prefix qt@5.5)/bin:$PATH"

jdk() {
  version=$1
  export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
  java -version
 }
