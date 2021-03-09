.DEFAULT_GOAL := bootstrap

all:
	@ansible-playbook bootstrap.yml --tags always,never --list-tasks

bootstrap:
	@ansible-playbook $@.yml

# TODO DRY somehow
skype:
	@ansible-playbook $@.yml
