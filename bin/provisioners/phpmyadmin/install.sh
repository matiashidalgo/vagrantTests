#!/usr/bin/env bash

#Install phpMyAdmin
apt-get -y install phpmyadmin

# DEVELOPMENT ENVIRONMENTS ONLY !!
# setup to login with root / no pass
# auth type from cookie to config
sed -i "s/\$cfg\['Servers'\]\[\$i\]\['auth_type'\]\ =\ 'cookie';/\$cfg\['Servers'\]\[\$i\]\['auth_type'\]\ =\ 'config';/" /etc/phpmyadmin/config.inc.php
# Old versions of phpMyAdmin
sed -i "s/\$cfg\['Servers'\]\[\$i\]\['user'\]\ =\ \$dbuser;/\$cfg\['Servers'\]\[\$i\]\['user'\]\ =\ 'root';" /etc/phpmyadmin/config.inc.php
sed -i "s/\$cfg\['Servers'\]\[\$i\]\['AllowNoPassword'\]\ =\ false;/\$cfg\['Servers'\]\[\$i\]\['AllowNoPassword'\]\ =\ true;/" /etc/phpmyadmin/config.inc.php
# New versions of PhpMyAdmin
sed -i "s/\$cfg\['Servers'\]\[\$i\]\['controluser'\]\ =\ \$dbuser;/\$cfg\['Servers'\]\[\$i\]\['controluser'\]\ =\ 'root';/" /etc/phpmyadmin/config.inc.php
sed -i "s/\$cfg\['Servers'\]\[\$i\]\['controlpass'\]\ =\ \$dbpass;/\$cfg\['Servers'\]\[\$i\]\['controlpass'\]\ =\ '';/" /etc/phpmyadmin/config.inc.php
sed -i "s/ \/\/ \$cfg\['Servers'\]\[\$i\]\['AllowNoPassword'\]\ =\ TRUE;/\$cfg\['Servers'\]\[\$i\]\['AllowNoPassword'\]\ =\ TRUE;/" /etc/phpmyadmin/config.inc.php


echo -e "\n\nListen 81\n" >> /etc/apache2/ports.conf
bash -c "cat > /etc/apache2/conf-available/phpmyadmin.conf <<EOF
<VirtualHost *:81>
ServerAdmin webmaster@localhost
DocumentRoot /usr/share/phpmyadmin
DirectoryIndex index.php
ErrorLog ${APACHE_LOG_DIR}/phpmyadmin-error.log
CustomLog ${APACHE_LOG_DIR}/phpmyadmin-access.log combined
</VirtualHost>
EOF"
a2enconf phpmyadmin