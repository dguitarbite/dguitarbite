# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(archlinux autopep8 cp debian coffee chruby colored-man colorize common-aliases cp django gem git git-extras github gitignore go golang grails history pep8 perl pip pyenv pylint python rsync repo ruby screen ssh-agent sudo terminitor terminalapp vagrant xcode z yum )

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nano'
 fi

# Compilation flags
 export ARCHFLAGS="-arch x86_64"

# ssh
 export SSH_KEY_PATH="~/.ssh/dsa_id"

# Aliases ===== Custom Variables

# CD Shit
alias .='cd'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Maven
alias mvncgs='echo "running:: maven clean generate-sources";mvn clean generate-sources'

# Git shit
alias gcommit='git commit -a'
alias greview='git review' # Gerrit
alias gclone='git clone'
alias gamend='git commit -a --amend'
alias gpullom='git pull origin master'
alias gcheckout='git checkout'
alias gcheckoutb='git checkout -b'

# Pip and Python stuff
alias pip2.7-upgrade='pip2.7 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip2.7 install -U'
alias pip-upgrade='pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U'

# OpenStack Repo Paths
alias rneutron="/home/dguitarbite/Repos/OpenStack/Core/ceilometer"
alias rcinder="/home/dguitarbite/Repos/OpenStack/Core/cinder"
alias rglance="/home/dguitarbite/Repos/OpenStack/Core/glance"
alias rheat="/home/dguitarbite/Repos/OpenStack/Core/heat"
alias rhorizon="/home/dguitarbite/Repos/OpenStack/Core/horizon"
alias rkeystone="/home/dguitarbite/Repos/OpenStack/Core/keystone"
alias rnova="/home/dguitarbite/Repos/OpenStack/Core/nova"
alias ropenstack-manuals="/home/dguitarbite/Repos/OpenStack/Core/openstack-manuals"
alias rswift="/home/dguitarbite/Repos/OpenStack/Core/swift"
