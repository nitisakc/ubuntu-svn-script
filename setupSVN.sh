#!/bin/bash

SVN_DIR=/var/lib/svn

echo "Setup SVN Server: "

sudo apt-get update
sudo apt-get install -y \
  apache2 \
  subversion \
  libapache2-mod-svn \
  libsvn-dev
  
sudo a2enmod dav
sudo a2enmod dav_svn
sudo service apache2 restart

sudo cp ubuntu-svn-script/dav_svn.conf /etc/apache2/mods-enabled/dav_svn.conf

sudo mkdir $SVN_DIR
sudo svnadmin create ${SVN_DIR}/repository
sudo chown -R www-data:www-data $SVN_DIR
sudo chmod -R 775 $SVN_DIR

echo "Enter admin password"
sudo htpasswd -cm /etc/apache2/dav_svn.passwd admin

if [ $? -eq 0 ] ; then
   sudo systemctl restart apache2.service
   echo "SVN installed in: $SVN_DIR"
   echo "Get this link 'http://localhost/svn/repository' to test svn service"
   echo "If show 'repository - Revision 0: /' is Ok!"
else
   echo "There was an issue with the final installation"
   exit 1
fi
