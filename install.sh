#!/bin/bash

BLUE_BG=$(tput setab 6)
GREEN_BG=$(tput setab 42)
BLACK_FG=$(tput setaf 0)
RESET=$(tput sgr0)

sudo apt -o Dpkg::Options::="--force-confold" install curl -y

echo "${BLUE_BG}${BLACK_FG}Loading functions...${RESET}"

admin_name="sdadmin"

# apt_install_initial() {}
func_apt_install_initial=$(curl -s https://raw.githubusercontent.com/alexeyralphs/Ultimate-arVPN/refs/heads/main/bash_functions/apt_install_initial.sh)
if [[ -z "$func_apt_install_initial" ]]; then
    echo "Error in func_apt_install_initial!" >&2
    exit 1
fi
source <(echo "$func_apt_install_initial")

# check_ipv4() {}
func_check_ipv4=$(curl -s https://raw.githubusercontent.com/alexeyralphs/Ultimate-arVPN/refs/heads/main/bash_functions/check_ipv4.sh)
if [[ -z "$func_check_ipv4" ]]; then
    echo "Error in func_check_ipv4!" >&2
    exit 1
fi
source <(echo "$func_check_ipv4")

# check_answer_hostname() {}
func_check_answer_hostname=$(curl -s https://raw.githubusercontent.com/alexeyralphs/Ultimate-arVPN/refs/heads/main/bash_functions/check_answer_hostname.sh)
if [[ -z "$func_check_answer_hostname" ]]; then
    echo "Error in func_check_answer_hostname!" >&2
    exit 1
fi
source <(echo "$func_check_answer_hostname")

# validate_fqdn() {}
func_validate_fqdn=$(curl -s https://raw.githubusercontent.com/alexeyralphs/Ultimate-arVPN/refs/heads/main/bash_functions/validate_fqdn.sh)
if [[ -z "$func_validate_fqdn" ]]; then
    echo "Error in func_validate_fqdn!" >&2
    exit 1
fi
source <(echo "$func_validate_fqdn")

# set_web_address() {}
func_set_web_address=$(curl -s https://raw.githubusercontent.com/alexeyralphs/Ultimate-arVPN/refs/heads/main/bash_functions/set_web_address.sh)
if [[ -z "$func_set_web_address" ]]; then
    echo "Error in func_set_web_address!" >&2
    exit 1
fi
source <(echo "$func_set_web_address")

# apt_install_requirements() {}
func_apt_install_requirements=$(curl -s https://raw.githubusercontent.com/alexeyralphs/Ultimate-arVPN/refs/heads/main/bash_functions/apt_install_requirements.sh)
if [[ -z "$func_apt_install_requirements" ]]; then
    echo "Error in func_apt_install_requirements!" >&2
    exit 1
fi
source <(echo "$func_apt_install_requirements")

# apt_install_webserver() {}
func_apt_install_webserver=$(curl -s https://raw.githubusercontent.com/alexeyralphs/Ultimate-arVPN/refs/heads/main/bash_functions/apt_install_webserver.sh)
if [[ -z "$func_apt_install_webserver" ]]; then
    echo "Error in func_apt_install_webserver!" >&2
    exit 1
fi
source <(echo "$func_apt_install_webserver")

# password_generator() {}
func_password_generator=$(curl -s https://raw.githubusercontent.com/alexeyralphs/Ultimate-arVPN/refs/heads/main/bash_functions/password_generator.sh)
if [[ -z "$func_password_generator" ]]; then
    echo "Error in func_password_generator!" >&2
    exit 1
fi
source <(echo "$func_password_generator")

# admin_user_create() {}
func_admin_user_create=$(curl -s https://raw.githubusercontent.com/alexeyralphs/Ultimate-arVPN/refs/heads/main/bash_functions/admin_user_create.sh)
if [[ -z "$func_admin_user_create" ]]; then
    echo "Error in func_admin_user_create!" >&2
    exit 1
fi
source <(echo "$func_admin_user_create")

# php_sock_create() {}
func_php_sock_create=$(curl -s https://raw.githubusercontent.com/alexeyralphs/Ultimate-arVPN/refs/heads/main/bash_functions/php_sock_create.sh)
if [[ -z "$func_php_sock_create" ]]; then
    echo "Error in func_php_sock_create!" >&2
    exit 1
fi
source <(echo "$func_php_sock_create")

# nginx_config_create() {}
func_nginx_config_create=$(curl -s https://raw.githubusercontent.com/alexeyralphs/sd/refs/heads/main/nginx_config_create.sh)
if [[ -z "$func_nginx_config_create" ]]; then
    echo "Error in func_nginx_config_create!" >&2
    exit 1
fi
source <(echo "$func_nginx_config_create")

# apt_install_sd() {}
func_apt_install_sd=$(curl -s https://raw.githubusercontent.com/alexeyralphs/sd/refs/heads/main/apt_install_sd.sh)
if [[ -z "$func_apt_install_sd" ]]; then
    echo "Error in func_apt_install_sd!" >&2
    exit 1
fi
source <(echo "$func_apt_install_sd")

# admin_user_permissions() {}
func_admin_user_permissions=$(curl -s https://raw.githubusercontent.com/alexeyralphs/Ultimate-arVPN/refs/heads/main/bash_functions/admin_user_permissions.sh)
if [[ -z "$func_admin_user_permissions" ]]; then
    echo "Error in func_admin_user_permissions!" >&2
    exit 1
fi
source <(echo "$func_admin_user_permissions")

# sd_start() {}
func_sd_start=$(curl -s https://raw.githubusercontent.com/alexeyralphs/sd/refs/heads/main/sd_start.sh)
if [[ -z "$func_sd_start" ]]; then
    echo "Error in func_sd_start!" >&2
    exit 1
fi
source <(echo "$func_sd_start")

apt_install_initial

check_ipv4

set_web_address

echo "${BLUE_BG}${BLACK_FG}Getting ready...${RESET}"

sleep 3

apt_install_requirements

apt_install_webserver

password_generator

admin_user_create

php_sock_create

nginx_config_create

apt_install_sd

admin_user_permissions

sd_start 

admin_user_permissions

echo "Automatic1111: http://$WEB_ADDRESS/ | Login: $admin_name | Password: $PASSWORD" | sudo tee -a credentials.txt > /dev/null
echo "---
---
---
---
---"
echo "${BLUE_BG}${BLACK_FG}Automatic1111:${RESET} http://$WEB_ADDRESS/ | ${BLUE_BG}${BLACK_FG}Login:${RESET} $admin_name | ${BLUE_BG}${BLACK_FG}Password:${RESET} $PASSWORD"
