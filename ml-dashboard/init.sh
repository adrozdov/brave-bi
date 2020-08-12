#!/bin/bash

cd /root/

pip install --ignore-installed -r requirements.txt
pip install --ignore-installed -r requirements-dev.txt
pip install pyasn1 --upgrade

# pip install gevent==1.4.0
# psycopg2-binary==2.7.5
# redis==3.2.1

pip install pandas==0.23.4
pip install sqlalchemy==1.2.18
pip install werkzeug==0.16.*

apt install -y supervisor
ln -s /etc/supervisor/supervisord.conf /etc/supervisord.conf
service supervisor restart

pip install -e .

echo "Starting ..."
echo "Setting up admin user"
brave fab create-admin \
              --username admin \
              --firstname Admin \
              --lastname Admin \
              --email admin@admin.com \
              --password admin
echo "Complete setting up admin user"

echo "Applying DB migrations"
brave db upgrade
echo "Complete applying DB migrations"

echo "Setting up roles and permissions"
brave init
echo "Complete setting up roles and permissions"

echo "Building assets ... "
sleep 10
cd /root/brave/assets
npm ci
npm run build

# work around bug in bravetools which treats symlink as a physical directory
rm -rf /root/brave/static
mkdir -p /root/brave/static/assets

cp -aR /root/brave/assets/branding /root/brave/static/assets
cp -aR /root/brave/assets/dist /root/brave/static/assets
cp -aR /root/brave/assets/images /root/brave/static/assets
cp -aR /root/brave/assets/stylesheets /root/brave/static/assets
cp -aR /root/brave/assets/node_modules /root/brave/static/assets
cp -a /root/brave/assets/package.json /root/brave/static/assets
cp -a /root/brave/assets/package-lock.json /root/brave/static/assets
cp -a /root/brave/assets/tsconfig.json /root/brave/static/assets
cp -a /root/brave/assets/webpack.config.js /root/brave/static/assets
cp -a /root/brave/assets/backendSync.json /root/brave/static/assets
rm -rf /root/brave/assets