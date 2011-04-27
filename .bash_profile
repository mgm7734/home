export EDITOR=vi
export ORACLE_HOME=/Library/Oracle/instantclient/10.2.0.4
export DYLD_LIBRARY_PATH=$ORACLE_HOME
export PATH=$PATH:$ORACLE_HOME

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
export CATALINA_HOME=~/opt/apache-tomcat-5.5.28
#export CATALINA_OPTS=-Xmx512m
export CATALINA_OPTS="-Xmx512m -Xdebug -Xrunjdwp:transport=dt_socket,server=y,address=7734,suspend=n"

export MULE_HOME=/Users/mgm7734/opt/mule
export PATH="$PATH:$MULE_HOME/bin"

PATH="/Users/mgm7734/bin:$PATH"
export SCALA_HOME=/Users/mgm7734/opt/scala
PATH="$SCALA_HOME/bin:$PATH"

#export PS1='\u@MGMac:\W\$ '
export PS1='\u@MGMac:$(git_branch)\W\$ '
function git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# bash
HISTSIZE=1000000
HISTFILESIZE=$HISTSIZE

# git
function gmu { 
    git checkout master && git svn    rebase 
}
function gwu {
    git checkout work   && git rebase master
}
function gmd {
    git checkout master && git merge work && git svn decommit
}

# franny

function is-evolution {
    [[ $PWD == */evolution ]]
}

function is-franny {
    [[ $PWD == */franny ]]
}

function git-clean {
    
    if is-evolution; then
        rm -rf vendor/plugins/advanced_editor public/plugin_assets
    fi
    if is-franny; then
        rm -rf vendor/plugins/advanced_editor public/plugin_assets
    fi
    if [[ `git stash` != 'No local'* ]]; then
        git stash drop
    fi
}

function git-rebase {
    git checkout master
    if is-evolution; then
        git svn rebase || return
    else
        git pull || return
    fi
    git checkout work
    git rebase master || return
    rake db:migrate:all
    if is-franny; then
        echo 'NOTE: skipping'  bundle install --without=production
        rake db:seed_fixtures db:seed
        rake test:plugins:setup_plugin_fixtures
        rm -rf vendor/plugins/advanced_editor
        ln -s ~/Projects/advanced_editor vendor/plugins
    else
        rake db:fixtures:load
    fi
    rake db:test:clone
}

# git 

function git-push {
    git checkout master
    git merge work
    if is-evolution; then
        git svn dcommit
    else
        git push
    fi
    git checkout work
    git rebase master
}


# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# ssh 
alias sshqc='ssh evodeploy@qc-evoweb1.visi.gdi'  # z@nt1g0! ev0deploy#  evo ; log
alias sshqcpw='ssh evodeploy@qc-evopw1.visi.gdi'
alias sshqcmdb='ssh evodeploy@qc-mdb1.visi.gdi'
alias sshint='ssh evodeploy@int-evoweb1.visi.gdi'
alias sshintpw='ssh evodeploy@int-evopw1.visi.gdi'
alias sshintmdb='ssh evodeploy@int-mdb1.visi.gdi'
alias sshbb='ssh mmendel@buildbox'
alias ssh-gd2-qc-deploy='ssh mmendel@qc-linux1.office.gdi'

