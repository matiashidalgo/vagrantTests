#!/usr/bin/env bash
PROJECT_DB_NAME="magento"
PROJECT_MAGENTO_ROOT="/vagrant/magento/"
PROJECT_URL="local.magento.test.com"
PROJECT_ADMIN_USER="admin"
PROJECT_ADMIN_PASSWORD="Summa2015"


#MEDIA FOLDER
if [ ! -d ${PROJECT_MAGENTO_ROOT}media ];
then
    echo "[$0] Creating Media Folder..."
    mkdir ${PROJECT_MAGENTO_ROOT}media
fi

#VAR FOLDER
if [ ! -d ${PROJECT_MAGENTO_ROOT}var ];
then
    echo "[$0] Creating Media Folder..."
    mkdir ${PROJECT_MAGENTO_ROOT}var
fi

echo "[$0] Applying write permissions..."
chmod -R 777 /vagrant/magento/{app/etc,media,var}


#VIRTUAL HOST
echo "[$0] Creating Virtual Host"
sudo ln -s /vagrant/magento /var/www/magento

sudo cp /vagrant/conf/apache/magento.conf /etc/apache2/sites-available/${PROJECT_URL}
sudo sed -i "s|\$PROJECT_URL|${PROJECT_URL}|g" /etc/apache2/sites-available/${PROJECT_URL}
sudo a2ensite ${PROJECT_URL}
sudo service apache2 restart

#MAGENTO INSTALLATION
echo "[$0] Installing Magento..."
rm -f ${PROJECT_MAGENTO_ROOT}app/etc/local.xml
php ${PROJECT_MAGENTO_ROOT}install.php -- \
    --license_agreement_accepted "yes" \
    --locale "en_US" \
    --timezone "America/Los_Angeles" \
    --default_currency "USD" \
    --db_host "33.33.33.150" \
    --db_name ${PROJECT_DB_NAME} \
    --skip_url_validation "yes" \
    --db_user "root" \
    --db_pass "" \
    --url "http://${PROJECT_URL}" \
    --secure_base_url "http://${PROJECT_URL}" \
    --use_rewrites "yes" \
    --use_secure "no" \
    --use_secure_admin "no" \
    --admin_firstname "Admin" \
    --admin_lastname "General" \
    --admin_email "admin@local.magento.test.com" \
    --admin_username "${PROJECT_ADMIN_USER}" \
    --admin_password "${PROJECT_ADMIN_PASSWORD}" \
    --session_save "db"