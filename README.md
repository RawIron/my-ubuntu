## My Ubuntu Playbooks

[![Build Status](https://travis-ci.org/RawIron/devops-my-ubuntu.svg)](https://travis-ci.org/RawIron/devops-my-ubuntu)

Rebuild my Ubuntu laptop using Ansible playbooks.
Just for the fun of it and to learn more about Ansible.
Also automate a bunch of setup steps, eg add a new git repo to my virtualenvwrapper and bind to a the project home.
A Vagrant box is used to test the Ansible playbooks.

### Restore 1st steps

* create a HOME directory for the user
* install _rclone_
* get the _rclone_ config from the Password Manager
* place the _rclone_ config in ~/.config/rclone/rclone.conf
* restore secret files from encrypted cloud storage
* install git
* clone this repo from github
* create a python virtual environment
* install the requirements: wheel, ansible, mitogen, ..
* deploy

### Test on the vagrant box
First create a vagrant box
```
$ vagrant up
```

Run defined tests on the vagrant box.
```bash
laptop$ vagrant ssh --command "cd /vagrant; ANSIBLE_INVENTORY=hosts ./test.sh"
```

Then test the ansible playbooks on the vagrant box
* all tasks
```
$ vagrant ssh
vagrant$ cd /vagrant
vagrant$ ansible-playbook --inventory-file=hosts deploy.yml
```

* one role at a time using the tags defined in `deploy.yml`
```
vagrant$ ansible-playbook --inventory-file=hosts deploy.yml --tags setup
```

### Deploy from laptop onto the vagrant box

* deploy onto the vagrant box via ssh
```
laptop$ ansible-playbook --inventory-file=.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory deploy.yml --tags terminator
```

### Run on laptop
In my usual workflow I change the ansible script, for example add a new alias `aliases.zsh`, and then _deploy_ to my laptop with
```bash
laptop$ ansible-playbook --inventory-file=hosts deploy.yml --tags=alias --extra-vars 'as_root=no'
```

### Use Ansible container instead of local Ansible install
```
docker pull cytopia/ansible:latest

docker run --rm -v $(pwd):/data cytopia/ansible ansible-playbook --inventory-file=hosts deploy.yml
```


## Categories and the major software that I use

### devops
automate everything and so everything is reproducible.
it can be run again and again.
makes testing, load testing, building and deploying easy.
also great for scaling.
* virtualbox
* vagrant
* ansible
* docker

### cloud
tools to access, manage and deploy.
* awscli
* rclone

### jvm development
* scala
* java runtime
* maven and sbt

### python development
great python packages to help writing great code.
use functional programming, TDD, dependency injection, database abstraction, database migration.
* virtualenv
* nose, pyvows, hypothesis
* toolz, pyrsistent, effect
* inject
* sqlalchemy, agnostic


### system programming
programming languages for high performance and system level access.
* dmd (d compiler)
* C, C++


### data analysis
wrangle, plot, predict, test hypothesis, estimate.

#### py-data
* numpy, scipy, sympy, Jupyter, Seaborn, scikit-learn


### development tools
write code with fully fledged IDE or lightweight editor. plugins can be used to extend the functionality.
* vscode
* neovim
* intellij idea
* git
* meld

#### intellij plugins
* maven helper
* scala
* python
* elixir
* markdown support

#### vim plugins
* YouCompleteMe
* UltiSnips
* tagbar
* vim-fugitive
* vim-airline

### system tools
look under the hood.

#### performance
show and measure what is happening in the Linux kernel.

* SystemTap, perf_events, ktap, lttng
* strace, ftrace, ltrace, ss, sysdig, tiptop
* mpstat, vmstat, netstat, iostat
* htop, nmon


### user account

#### github repos
* create workspace(s) in HOME
* git clone projects into the workspace(s)

### office tools
communicate. create and manage documents, files.
* firefox
* libre office
* FocusWriter
* artha thesaurus
* Kazam
* Screenkey
* 7zip, bzip2

### media
view and process photos, e-books, audio and video.
* rawtherapee
* vlc media player
* mpv
* ripperX
* handbrake
* OpenShot
* Calibre
