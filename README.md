
This repo contains the installation and configuration
scripts and files for the NDN Testbed Router nodes.
To use this repo on a freshly installed node, do this:

> sudo apt-get -y install git
> git clone https://github.com/WU-ARL/ndn-ops.git
> cd ndn-ops/NOC
> ./ubuntu_installs.sh
> cd ../named-data/running_versions/
> ./git_and_install.sh

> sudo mkdir -p /usr/local/etc/ndnx:
> sudo mkdir -p /usr/local/etc/quagga

> cd ~/ndn-ops/named-data/running_version/config_files/<name>
> cp /etc/network/interfaces interfaces.preNDN


Then we need to set up the configuration files.
merge interfaces.preNDN with ~/ndn-ops/named-data/running_version/config_files/<name>/etc/network/interfaces
verify that ~/ndn-ops/named-data/running_version/config_files/<name>/usr/local/etc/quagga/*.conf look ok.
verify that /etc/rc.local is unmodified from installation. If not, verify it is ok and merge with
~/ndn-ops/named-data/running_version/config_files/<name>/etc/rc.local

cd ~/ndn-ops/named-data/running_version/config_files/<name>
sudo cp -R * /
