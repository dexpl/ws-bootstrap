roles := $(notdir $(wildcard roles/*))
mainrole := ws
# Simple role template
stemplate := templates/_simple.yml.j2

all: bootstrap

bootstrap:
	ansible-playbook $@.yml

$(roles): %: %.yml
	ansible-playbook $@.yml

%.yml: $(stemplate)
	ansible localhost -a 'src=$(<F) dest=$@' -e rolename=$* -m template

.PHONY: bootstrap $(roles)

.SILENT:
