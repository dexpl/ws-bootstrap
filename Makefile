roles := $(notdir $(wildcard roles/*))
mainrole := ws
# Simple role template
stemplate := templates/_simple.yml.j2

all: $(mainrole) digital.gov.ru $(roles)

digital.gov.ru : digital.gov.ru.cert

bootstrap digital.gov.ru.cert :
	ansible-playbook $(ANSIBLE_OPTS) $@.yml

$(roles): %: %.yml
	ansible-playbook $(ANSIBLE_OPTS) $@.yml

%.yml: $(stemplate)
	ansible localhost -a 'src=$(<F) dest=$@' -e rolename=$* -m template

clean:
	rm -fv $(roles:%=%.yml)

.PHONY: clean bootstrap digital.gov.ru digital.gov.ru.cert

.SILENT:
