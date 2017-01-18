sudo apt-get install -y git

# First time we run this, we need to update package repos,
# so if installation fails, update package repos, and try
# again.
if [ $? -ne 0 ]; then
  sudo apt-get update && sudo apt-get -y install git
fi
sudo apt-get install -y vim unzip dos2unix
exit $?

