# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="fox"

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
plugins=(ssh-agent suse archlinux autopep8 cp debian coffee colored-man colorize common-aliases cp django gem git git-extras github gitignore go golang grails history pep8 perl pip pyenv pylint python rsync repo ruby screen ssh-agent sudo terminitor terminalapp vagrant z yum )

source $ZSH/oh-my-zsh.sh

# Disable the pinetry GUI window
unset GPG_AGENT_INFO
unset SSH_ASKPASS

# User configuration

# # Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nano'
 fi

# Aliases ===== Custom Variables

# Make Changing Directory Easy
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Maven
alias mvncgs='echo "running:: maven clean generate-sources";mvn clean generate-sources'

# Git shit
alias gcommit='git commit -a'
alias greview='git review' # Gerrit
alias greviewf='git review -f'
alias greviewd='git review -d'
alias greviewl='git review --list'
alias gclone='git clone'
alias gamend='git commit -a --amend'
alias gpull='git pull'
alias gcheckout='git checkout'
alias gcheckoutb='git checkout -b'

# Pip and Python stuff
#alias pip2.7-upgrade='pip2.7 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip2.7 install -U'
#alias pip-upgrade='pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U'

# OpenStack Repo Paths
alias dBare_metal=$HOME/Repositories/Dev/OpenStack/Bare_metal
alias rBare_metal=$HOME/Repositories/Rev/OpenStack/Bare_metal
alias dCompute=$HOME/Repositories/Dev/OpenStack/Compute
alias rCompute=$HOME/Repositories/Rev/OpenStack/Compute
alias dData_processing_service=$HOME/Repositories/Dev/OpenStack/Data_processing_service
alias rData_processing_service=$HOME/Repositories/Rev/OpenStack/Data_processing_service
alias dDevstack=$HOME/Repositories/Dev/OpenStack/Devstack
alias rDevstack=$HOME/Repositories/Rev/OpenStack/Devstack
alias dImage_Service=$HOME/Repositories/Dev/OpenStack/Image_Service
alias rImage_Service=$HOME/Repositories/Rev/OpenStack/Image_Service
alias dNetworking=$HOME/Repositories/Dev/OpenStack/Networking
alias rNetworking=$HOME/Repositories/Rev/OpenStack/Networking
alias dQuality_Assurance=$HOME/Repositories/Dev/OpenStack/Quality_Assurance
alias rQuality_Assurance=$HOME/Repositories/Rev/OpenStack/Quality_Assurance
alias dTelemetry=$HOME/Repositories/Dev/OpenStack/Telemetry
alias rTelemetry=$HOME/Repositories/Rev/OpenStack/Telemetry
alias dBlock_Storage=$HOME/Repositories/Dev/OpenStack/Block_Storage
alias rBlock_Storage=$HOME/Repositories/Rev/OpenStack/Block_Storage
alias dDNS_Services=$HOME/Repositories/Dev/OpenStack/DNS_Services
alias rDNS_Services=$HOME/Repositories/Rev/OpenStack/DNS_Services
alias dDatabase_Service=$HOME/Repositories/Dev/OpenStack/Database_Service
alias rDatabase_Service=$HOME/Repositories/Rev/OpenStack/Database_Service
alias dDocumentation=$HOME/Repositories/Dev/OpenStack/Documentation
alias rDocumentation=$HOME/Repositories/Rev/OpenStack/Documentation
alias dInfrastructure=$HOME/Repositories/Dev/OpenStack/Infrastructure
alias rInfrastructure=$HOME/Repositories/Rev/OpenStack/Infrastructure
alias dObject_Storage=$HOME/Repositories/Dev/OpenStack/Object_Storage
alias rObject_Storage=$HOME/Repositories/Rev/OpenStack/Object_Storage
alias dQueue_service=$HOME/Repositories/Dev/OpenStack/Queue_service
alias rQueue_service=$HOME/Repositories/Rev/OpenStack/Queue_service
alias dCommon_Libraries=$HOME/Repositories/Dev/OpenStack/Common_Libraries
alias rCommon_Libraries=$HOME/Repositories/Rev/OpenStack/Common_Libraries
alias dDashboard=$HOME/Repositories/Dev/OpenStack/Dashboard
alias rDashboard=$HOME/Repositories/Rev/OpenStack/Dashboard
alias dDeployment=$HOME/Repositories/Dev/OpenStack/Deployment
alias rDeployment=$HOME/Repositories/Rev/OpenStack/Deployment
alias dIdentity=$HOME/Repositories/Dev/OpenStack/Identity
alias rIdentity=$HOME/Repositories/Rev/OpenStack/Identity
alias dKey_management_service=$HOME/Repositories/Dev/OpenStack/Key_management_service
alias rKey_management_service=$HOME/Repositories/Rev/OpenStack/Key_management_service
alias dOrchestration=$HOME/Repositories/Dev/OpenStack/Orchestration
alias rOrchestration=$HOME/Repositories/Rev/OpenStack/Orchestration
alias dRelease_cycle_management=$HOME/Repositories/Dev/OpenStack/Release_cycle_management
alias rRelease_cycle_management=$HOME/Repositories/Rev/OpenStack/Release_cycle_management

alias rtraining-guides=$HOME/Repositories/Rev/OpenStack/Documentation/training-guides
alias dtraining-guides=$HOME/Repositories/Dev/OpenStack/Documentation/training-guides
alias ropenstack-manuals=$HOME/Repositories/Rev/OpenStack/Documentation/openstack-manuals
alias dopenstack-manuals=$HOME/Repositories/Dev/OpenStack/Documentation/openstack-manuals
