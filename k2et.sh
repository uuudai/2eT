#!/bin/bash

echo 'k2et - Kali Linux Setting Script'

if [[ `whoami` != "root"]]
then
    echo 'Run it as the root user or use sudo.'
    exit 1
fi

echo '# apt update'
apt -y update
echo '# apt upgrade'
apt -y upgrade

echo '# Install Terminator'
apt -y install terminator

echo '# Install Git'
echo '# Install GCC'
echo '# Install Make'
echo '# Install libpcap-dev'
echo '# Install libpq-dev'
apt -y install git gcc make libpcap-dev libpq-dev

mkdir ~/opt

echo '# Install Disover'
git clone https://github.com/leebaird/discover.git ~/opt/discover
sh ~/opt/discover/update.sh

echo '# Install EyeWitness'
git clone https://github.com/FortyNorthSecurity/EyeWitness.git ~/opt/eyeWitness

echo '# Install HTTPScreenShot'
pip install selenium
git clone https://github.com/breenmachine/httpscreenshot.git ~/opt/httpscreenshot
chmod +x ~/opt/httpscreenshot/install-dependencies.sh
sh ~/opt/httpscreenshot/install-dependencies.sh

echo "# Install Masscan"
git clone https://github.com/robertdavidgraham/masscan ~/opt/masscan
cd ~/opt/masscan
make
make install
cd ~/

echo '# Install Gitrob'
git clone https://github.com/michenriksen/gitrob ~/opt/gitrob
gem install bundler
systemctl restart postgresql
su postgres <<EOF
create user -s gitrob --pwprompt
create db -O gitrob gitrob
EOF
cd ~/opt/gitrob
gem install gitrob
cd ~/

echo '# Install CMSmap'
git clone https://github.com/Dionach/CMSmap.git ~/opt/CMSmap

echo '# Install Recon-ng'
git clone https://github.com/lanmaster53/recon-ng.git ~/opt/recon-ng

echo '# Install WPScan'
git clone https://github.com/wpscanteam/wpscan.git ~/opt/wpscan
cd ~/opt/wpscan
gem install bundler
bundle install --without test
cd ~/

echo '# Install Praeda'
git clone https://github.com/percx/Praeda ~/opt/Praeda

echo '# Install SQLMap'
git clone https://github.com/sqlmapproject/sqlmap.git ~/opt/sqlmap

echo '# Install SMBexec'
read -p "Hit enter: "
git clone https://github.com/brav0hax/smbexec ~/opt/smbexec
sh ~/opt/smbexec/install.sh

echo '# Install The Backdoor Factory'
git clone https://github.com/secretsquirrel/the-backdoor-factory.git ~/opt/the-backdoor-factory
sh ~/opt/the-backdoor-factory/install.sh

echo 'Complated!'