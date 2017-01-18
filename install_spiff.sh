set -e

if [ ! -f $HOME/bin/spiff ]; then
  mkdir -p $HOME/bin
  pushd $HOME/bin
  wget https://github.com/cloudfoundry-incubator/spiff/releases/download/v1.0.8/spiff_linux_amd64.zip -q
  unzip spiff_linux_amd64.zip
  popd
else
  echo "spiff already installed, skipping"
fi
