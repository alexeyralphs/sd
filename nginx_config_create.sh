#!/bin/bash

BLUE_BG=$(tput setab 6)
GREEN_BG=$(tput setab 42)
BLACK_FG=$(tput setaf 0)
RESET=$(tput sgr0)

nginx_config_create() {
    curl -s -o /etc/nginx/sites-available/$admin_name https://raw.githubusercontent.com/alexeyralphs/sd/refs/heads/main/nginx_config_sdadmin.conf
    sudo sed -i "s/\$WEB_ADDRESS/$WEB_ADDRESS/g" /etc/nginx/sites-available/$admin_name
    sudo sed -i "s/\$admin_name/$admin_name/g" /etc/nginx/sites-available/$admin_name
    sudo ln -s /etc/nginx/sites-available/$admin_name /etc/nginx/sites-enabled/
    sudo mkdir -vp /var/www/$admin_name/html

    curl -s -o /var/www/$admin_name/html/index.php https://raw.githubusercontent.com/alexeyralphs/Ultimate-arVPN/refs/heads/main/index.html

    sudo systemctl restart nginx
    
    certbot certonly --nginx --agree-tos --register-unsafely-without-email --keep-until-expiring -d $WEB_ADDRESS -d www.$WEB_ADDRESS

    if [ -f "/etc/letsencrypt/live/$WEB_ADDRESS/fullchain.pem" ] && [ -f "/etc/letsencrypt/live/$WEB_ADDRESS/privkey.pem" ]; then
        sudo rm /etc/ssl/${WEB_ADDRESS}.crt
        sudo rm /etc/ssl/${WEB_ADDRESS}.key
        ln -s /etc/letsencrypt/live/$WEB_ADDRESS/fullchain.pem /etc/ssl/${WEB_ADDRESS}.crt
        ln -s /etc/letsencrypt/live/$WEB_ADDRESS/privkey.pem /etc/ssl/${WEB_ADDRESS}.key
        echo "${BLUE_BG}${BLACK_FG}Let's Encrypt successfully issued for $WEB_ADDRESS !${RESET}"
    else
        echo "${BLUE_BG}${BLACK_FG}Let's Encrypt didn't succeed issuing for $WEB_ADDRESS . Using selfsigned certificate${RESET}"
    fi

    sudo systemctl restart nginx
}
