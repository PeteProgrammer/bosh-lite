set -r # Automatically fail script when some command fail
VAGRANT_DIR=`pwd`
echo "Source directory $VAGRANT"
bash $VAGRANT_DIR/install_deps.sh 

export PATH=$PATH:$HOME/bin

cd $HOME # Make sure we are in /home/vagrant
if [ ! -d $HOME/cf-release ]; then
  git clone https://github.com/cloudfoundry/cf-release.git
  git checkout v250
else
  echo "cf-release already checked out, skipping"
fi

bosh download public stemcell bosh-stemcell-389-warden-boshlite-ubuntu-trusty-go_agent.tgz
bosh upload stemcell bosh-stemcell-389-warden-boshlite-ubuntu-trusty-go_agent.tgz

bash $VAGRANT_DIR/install_spiff
