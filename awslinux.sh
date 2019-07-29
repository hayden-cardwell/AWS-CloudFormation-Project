#!/bin/bash
rpm -Uvh https://yum.postgresql.org/10/redhat/rhel-7-x86_64/pgdg-centos10-10-2.noarch.rpm
yum install update -y
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
yum install unzip -y
unzip awscli-bundle.zip
./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
yum install cloud-init wget -y
yum install postgresql10-server postgresql10 -y
/usr/pgsql-10/bin/postgresql-10-setup initdb
systemctl start postgresql-10.service
systemctl enable postgresql-10.service
tee /home/deepsecurity/database.sh <<EOF
echo "CREATE DATABASE dsm;" | sudo -u postgres psql
echo "CREATE ROLE MasterAdmin WITH PASSWORD 'Password111' LOGIN;" | sudo -u postgres psql
echo "GRANT ALL ON DATABASE dsm TO MasterAdmin;" | sudo -u postgres psql
echo "GRANT CONNECT ON DATABASE dsm TO MasterAdmin;" | sudo -u postgres psql
EOF
chmod +x database.sh
/home/deepsecurity/database.sh
mkdir /home/deepsecurity/
wget -O /home/deepsecurity/Manager-Linux-12.0.296.x64.sh https://files.trendmicro.com/products/deepsecurity/en/12.0/Manager-Linux-12.0.296.x64.sh
aws s3 cp s3://deep-sec-haydencardwell/silent.txt /home/deepsecurity/
chmod +x /home/deepsecurity/Manager-Linux-12.0.296.x64.sh
/home/deepsecurity/Manager-Linux-12.0.296.x64.sh -q -console -varfile /home/deepsecurity/silent.txt