bootstrap:
	@ansible-playbook $@.yml

# TODO DRY somehow
skype:
	@ansible-playbook $@.yml

.PHONY: bootstrap
