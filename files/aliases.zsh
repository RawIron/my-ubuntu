# git aliases are provided by oh-my-zsh

# Quick access to commands, files or directories
alias zshrc='$EDITOR ~/.zshrc'
alias vrc='$EDITOR ~/.vimrc'
alias nvrc='$EDITOR ~/.config/nvim/init.vim'

alias ag='alias | grep'
alias_starts_with() { alias | grep "^$1" }
alias ags='alias_starts_with'

alias hg='history | grep'
alias pg='ps -ef | grep'

alias tree='tree -C'
alias tedu='tree -C --du -h'

# Python
alias mkvenv='mkvirtualenv'
alias lsvenv='lsvirtualvenv'
alias rmvenv='rmvirtualenv'


# Haskell
alias runhs='runghc'

# Maven
mvn_test() { mvn test -Dtest="$1" }
alias mvntc='mvn_test'
mvn_main() { mvn exec:java -Dexec.mainClass="$1" }
alias mvnrc='mvn_main'


# Ansible
ansible_playbook_run_tag_local() {
  (cd ~/workspace/devops-my-ubuntu;
  ansible-playbook --inventory-file=hosts --connection=local site.yml --tags="$1" --extra-vars "as_root=no")
}
alias aplt='ansible_playbook_run_tag_local'
alias ansible_facts='ansible -m setup'


# Docker
alias dop='docker ps -a'
alias dora='docker rm $(docker ps -a -q)'
alias doi='docker images'
alias doria='docker rmi $(docker images -q)'
docker_run_shell() { docker run -it "$1" sh }
alias dors='docker_run_shell'

docker_run_mysqld() {
# run latest Mysql 5.x server
# $1 - instance name
# $2 - root password
  docker run --name "$1" -e MYSQL_ROOT_PASSWORD="$2" -d mysql:5
}
alias domyd='docker_run_mysqld'

docker_run_mysqlc() {
# $1 - instance name
docker run -it --link "$1":mysql --rm mysql \
sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'
}
alias domyc='docker_run_mysqlc'
