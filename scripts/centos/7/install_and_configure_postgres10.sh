#!/bin/bash -eux

# configure repo
wget https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
yum -y install pgdg-redhat-repo-latest.noarch.rpm

# install and initiate postgres 10
yum -y install postgresql10-server.x86_64 postgresql10-contrib.x86_64 postgresql10-devel.x86_64
/usr/pgsql-10/bin/postgresql-10-setup initdb

# start and enable postgres
systemctl start postgresql-10
systemctl enable postgresql-10

# configure firewall
sudo firewall-cmd --permanent --zone=public --add-service=postgresql
sudo firewall-cmd --reload