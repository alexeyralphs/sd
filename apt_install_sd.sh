#!/bin/bash

BLUE_BG=$(tput setab 6)
GREEN_BG=$(tput setab 42)
BLACK_FG=$(tput setaf 0)
RESET=$(tput sgr0)

apt_install_sd() {
  sudo apt-get install -y python3.10 python3-pip python3-venv libgl1 libglib2.0-0 google-perftools git

  sudo wget -q https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh -O /var/www/$admin_name/webui.sh

  sudo chmod +x /var/www/$admin_name/webui.sh

  sudo -u sdadmin /var/www/$admin_name/webui.sh

  echo '# For CPU render:' >  /var/www/$admin_name/stable-diffusion-webui/webui-user.sh
  echo 'export COMMANDLINE_ARGS="--autolaunch --update-check --no-half-vae --medvram-sdxl --opt-sdp-attention --skip-torch-cuda-test --use-cpu all --no-half --enable-insecure-extension-access"' >>  /var/www/$admin_name/stable-diffusion-webui/webui-user.sh
  echo '# For GPU render:' >>  /var/www/$admin_name/stable-diffusion-webui/webui-user.sh
  echo '# export COMMANDLINE_ARGS="--autolaunch --update-check --no-half-vae --xformers --medvram-sdxl --opt-sdp-attention --skip-torch-cuda-test --no-half --enable-insecure-extension-access"' >>  /var/www/$admin_name/stable-diffusion-webui/webui-user.sh

  wget https://huggingface.co/stable-diffusion-v1-5/stable-diffusion-v1-5/blob/main/v1-5-pruned-emaonly.safetensors -O /var/www/$admin_name/stable-diffusion-webui/models/Stable-diffusion/v1-5-pruned-emaonly.safetensors

  curl -s -o /usr/lib/systemd/system/sdwebui.service https://raw.githubusercontent.com/alexeyralphs/sd/refs/heads/main/sdwebui.service
  sudo sed -i "s/\$admin_name/$admin_name/g" /usr/lib/systemd/system/sdwebui.service
}
