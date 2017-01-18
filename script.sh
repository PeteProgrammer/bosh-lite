set -e # Automatically fail script when some command fail
source ./install_deps.sh

cd $HOME # Make sure we are in /home/vagrant
git clone https://github.com/cloudfoundry/cf-release.git
