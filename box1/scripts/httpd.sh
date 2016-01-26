#!/usr/bin/env bash

yum -y install httpd; yum clean all

sudo mkdir /var/www/html
sudo mkdir /var/www/logs

cat <<EOF > index.html
<html>
<body>
<p>Hello world!</p>
</body>
</html>
EOF

sudo mv index.html /var/www/html/index.html

sudo service httpd start
