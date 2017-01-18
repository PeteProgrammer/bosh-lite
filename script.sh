set -r # Automatically fail script when some command fail
bash ./install_deps.sh 

cd $HOME # Make sure we are in /home/vagrant
if [ ! -d $HOME/cf-release ]; then
  git clone https://github.com/cloudfoundry/cf-release.git
  git checkout v250
else
  echo "cf-release already checked out, skipping"
fi


