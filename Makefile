
converge: bundler galaxy playbook-reqs
	bundle exec kitchen $@

playbook-reqs: priv/ansible/playbook-compat.yml

priv/ansible/playbook-compat.yml:
	wget -O "$@" https://raw.githubusercontent.com/wtanaka/role-tester-ansible/b5516d9bc8f97b8c607c50f9ae265ccff7786314/playbook-compat.yml

login: bundler galaxy
	bundle exec kitchen $@

list: bundler galaxy
	bundle exec kitchen $@

destroy: bundler galaxy
	bundle exec kitchen $@

galaxy:
	ansible-galaxy install -r priv/ansible/requirements.txt \
		-p priv/ansible/roles/

bundler: FORCE
	command -v bundle || gem install --user-install --no-ri --no-rdoc bundler
	bundle install --path vendor/bundle

FORCE:
