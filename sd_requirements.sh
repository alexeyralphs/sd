#!/bin/bash

BLUE_BG=$(tput setab 6)
GREEN_BG=$(tput setab 42)
BLACK_FG=$(tput setaf 0)
RESET=$(tput sgr0)

sd_requirements() {
  sudo apt-get install -y python3.10 python3-pip python3-venv libgl1 libglib2.0-0 google-perftools git

  sudo wget -q https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh -O /var/www/$admin_name/webui.sh
  sudo chmod +x /var/www/$admin_name/webui.sh
  sudo -u sdadmin /var/www/$admin_name/webui.sh

  sudo mkdir -vp /var/www/$admin_name/stable-diffusion-webui
}
