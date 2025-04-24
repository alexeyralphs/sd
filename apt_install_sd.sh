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
  sudo apt -o Dpkg::Options::="--force-confold" install python3-pip -y
  sudo apt -o Dpkg::Options::="--force-confold" install python3-venv -y
  sudo apt -o Dpkg::Options::="--force-confold" install libgl1 -y
  sudo apt -o Dpkg::Options::="--force-confold" install libglib2.0-0 -y
  sudo apt -o Dpkg::Options::="--force-confold" install bc -y
  sudo apt -o Dpkg::Options::="--force-confold" install google-perftools -y
  sudo apt -o Dpkg::Options::="--force-confold" install git -y

  git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui /var/www/$admin_name/stable-diffusion-webui

  echo '# For CPU render:' >  /var/www/$admin_name/stable-diffusion-webui/webui-user.sh
  echo 'export COMMANDLINE_ARGS="--autolaunch --update-check --no-half-vae --medvram-sdxl --opt-sdp-attention --skip-torch-cuda-test --use-cpu all --no-half --enable-insecure-extension-access"' >>  /var/www/$admin_name/stable-diffusion-webui/webui-user.sh
  echo '# For GPU render:' >>  /var/www/$admin_name/stable-diffusion-webui/webui-user.sh
  echo '# export COMMANDLINE_ARGS="--autolaunch --update-check --no-half-vae --xformers --medvram-sdxl --opt-sdp-attention --skip-torch-cuda-test --no-half --enable-insecure-extension-access"' >>  /var/www/$admin_name/stable-diffusion-webui/webui-user.sh

  curl -s -o /usr/lib/systemd/system/sdwebui.service https://raw.githubusercontent.com/alexeyralphs/sd/refs/heads/main/sdwebui.service
  sudo sed -i "s/\$admin_name/$admin_name/g" /usr/lib/systemd/system/sdwebui.service

  sudo systemctl daemon-reload
  sudo systemctl enable sdwebui
  sudo systemctl start sdwebui
  sudo systemctl restart sdwebui

  git clone https://github.com/Zyin055/Config-Presets.git /var/www/$admin_name/stable-diffusion-webui/extensions/Config-Presets
  curl -s -o /var/www/$admin_name/stable-diffusion-webui/extensions/Config-Presets/config-txt2img.json https://raw.githubusercontent.com/alexeyralphs/sd/refs/heads/main/config-txt2img.json
  curl -s -o /var/www/$admin_name/stable-diffusion-webui/extensions/Config-Presets/config-img2img.json https://raw.githubusercontent.com/alexeyralphs/sd/refs/heads/main/config-img2img.json

  git clone https://github.com/ArtVentureX/sd-webui-agent-scheduler.git /var/www/$admin_name/stable-diffusion-webui/extensions/sd-webui-agent-scheduler
  git clone https://github.com/zanllp/sd-webui-infinite-image-browsing.git /var/www/$admin_name/stable-diffusion-webui/extensions/sd-webui-infinite-image-browsing

  sudo journalctl -u sdwebui -n 1 --no-pager -o cat
  sleep 5
  echo "${BLUE_BG}${BLACK_FG}Wait...${RESET}"
  sleep 5
  sudo journalctl -u sdwebui -n 1 --no-pager -o cat
  sleep 5
  echo "${BLUE_BG}${BLACK_FG}Wait...${RESET}"
  sleep 10
  sudo journalctl -u sdwebui -n 1 --no-pager -o cat
  sleep 5
  echo "${BLUE_BG}${BLACK_FG}Wait...${RESET}"
  sleep 15
  sudo journalctl -u sdwebui -n 1 --no-pager -o cat
  sleep 5
  echo "${BLUE_BG}${BLACK_FG}Wait...${RESET}"
  sleep 20
  sudo journalctl -u sdwebui -n 1 --no-pager -o cat
  sleep 5
  echo "${BLUE_BG}${BLACK_FG}Wait...${RESET}"
  sleep 25
  sudo journalctl -u sdwebui -n 1 --no-pager -o cat
  sleep 5
  echo "${BLUE_BG}${BLACK_FG}Wait...${RESET}"
  sleep 30
  sudo journalctl -u sdwebui -n 1 --no-pager -o cat
  sleep 5
  echo "${BLUE_BG}${BLACK_FG}Wait...${RESET}"
  sleep 35
  sudo journalctl -u sdwebui -n 1 --no-pager -o cat
  sleep 5
  echo "${BLUE_BG}${BLACK_FG}Wait...${RESET}"

  wget https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors -O /var/www/$admin_name/stable-diffusion-webui/models/Stable-diffusion/sd_xl_base_1.0.safetensors

  sudo systemctl restart sdwebui
}
