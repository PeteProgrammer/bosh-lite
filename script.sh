set -r # Automatically fail script when some command fail
VAGRANT_DIR=/vagrant
echo "Source directory $VAGRANT"
bash $VAGRANT_DIR/install_deps.sh 

export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.gem/ruby/2.0.0/bin

gem install --user-install bundler

cd $HOME # Make sure we are in /home/vagrant
if [ ! -d $HOME/cf-release ]; then
  git clone https://github.com/cloudfoundry/cf-release.git
  git checkout v250
else
  echo "cf-release already checked out, skipping"
fi

if [ ! -f $HOME/bosh-stemcell-3312.15-warden-boshlite-ubuntu-trusty-go_agent.tgz ]; then
	echo " ** Download and install stemcell"
	cd $HOME
	wget https://s3.amazonaws.com/bosh-core-stemcells/warden/bosh-stemcell-3312.15-warden-boshlite-ubuntu-trusty-go_agent.tgz -q
	bosh upload stemcell bosh-stemcell-3312.15-warden-boshlite-ubuntu-trusty-go_agent.tgz
#bosh download public stemcell bosh-stemcell-389-warden-boshlite-ubuntu-trusty-go_agent.tgz
#bosh upload stemcell bosh-stemcell-389-warden-boshlite-ubuntu-trusty-go_agent.tgz
else
	echo " ** Stemcell already installed"
fi

echo " ** upload Cloud Foundry v250"
bosh upload release https://bosh.io/d/github.com/cloudfoundry/cf-release?v=250 --skip-if-exists

bash $VAGRANT_DIR/install_spiff.sh

cd $HOME/cf-release
./script/generate-bosh-lite-dev-manifest
sudo chown -R vagrant:vagrant bosh-lite

# bosh upload release releases/cf-250.yml
