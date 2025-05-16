#!/bin/bash

BLUE_BG=$(tput setab 6)
GREEN_BG=$(tput setab 42)
BLACK_FG=$(tput setaf 0)
RESET=$(tput sgr0)

apt_install_sd() {
  sudo apt -o Dpkg::Options::="--force-confold" install software-properties-common -y 
  add-apt-repository ppa:deadsnakes/ppa -y
  apt update
  sudo apt -o Dpkg::Options::="--force-confold" install python3.10 -y
  sudo apt -o Dpkg::Options::="--force-confold" install python3.11 -y
  sudo apt -o Dpkg::Options::="--force-confold" install python3.12 -y
  sudo apt -o Dpkg::Options::="--force-confold" install python3.13 -y
  sudo apt -o Dpkg::Options::="--force-confold" install python3-pip -y
  sudo apt -o Dpkg::Options::="--force-confold" install python3-venv -y
  sudo apt -o Dpkg::Options::="--force-confold" install libgl1 -y
  sudo apt -o Dpkg::Options::="--force-confold" install libglib2.0-0 -y
  sudo apt -o Dpkg::Options::="--force-confold" install bc -y
  sudo apt -o Dpkg::Options::="--force-confold" install google-perftools -y
  sudo apt -o Dpkg::Options::="--force-confold" install git -y

  git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui /var/www/$admin_name/stable-diffusion-webui
  sudo mkdir -vp /var/www/$admin_name/stable-diffusion-webui/models/ESRGAN

  curl -s -o /var/www/$admin_name/stable-diffusion-webui/webui-user.sh https://raw.githubusercontent.com/alexeyralphs/sd/refs/heads/main/webui-user.sh

  curl -s -o /var/www/$admin_name/stable-diffusion-webui/styles.csv https://raw.githubusercontent.com/alexeyralphs/sd/refs/heads/main/styles.csv

  curl -s -o /usr/lib/systemd/system/sdwebui.service https://raw.githubusercontent.com/alexeyralphs/sd/refs/heads/main/sdwebui.service
  sudo sed -i "s/\$admin_name/$admin_name/g" /usr/lib/systemd/system/sdwebui.service
}
