
converge: bundler galaxy
	bundle exec kitchen $@

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
