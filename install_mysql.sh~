if [ ! -d $HOME/cf-mysql-release ]; then
	cd $HOME
	git clone https://github.com/cloudfoundry/cf-mysql-release.git
	cd $HOME/cf-mysql-release
	./scripts/update
	bosh upload release releases/cf-mysql/cf-mysql-32.yml
	./scripts/generate-bosh-lite-manifest
	echo "yes" | bosh deploy
	bosh run errand broker-registrar
fi
