Some stuff required to bootstrap a workstation

`ansible-playbook bootstrap.yml` or just `make` if you're feelin' lucky  
`ansible-playbook bootstrap.yml --become-method=su`  
`ansible-playbook bootstrap.yml --become-method=su --tags vk` to install VK messenger  
`ansible-playbook bootstrap.yml --become-method=su --tags zoom` to install zoom video conf. client  

`sshpass -pPASSWORD ansible-playbook sshkey.yml --ask-pass -i HOST1,HOST2,` — add your ssh public key to HOST1 and HOST2.  
`sshpass -pPASSWORD ansible-playbook sshkey.yml --ask-pass -e ansible_user=jdoe -e key=path/to/jdoe_s.key -e fio='John Doe' -i HOST1,HOST2,` — ssh as jdoe to HOST1 and HOST2 and set path/to/jdoe_s.key as his ssh key; set `fio` value as a key comment  
`sshpass -pPASSWORD ansible-playbook sshkey.yml --ask-pass -b -e user=jdoe -e key=path/to/jdoe_s.key -e fio='John Doe' -i HOST1,HOST2,` — set path/to/jdoe_s.key as jdoe's ssh key on HOST1 and HOST2; set `fio` value as a key comment; user, key and fio defaults to ansible_user or current user, ${HOME}/.ssh/id_rsa.pub and GECOS of ${USER} respectively  
