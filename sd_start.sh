#!/bin/bash

BLUE_BG=$(tput setab 6)
GREEN_BG=$(tput setab 42)
BLACK_FG=$(tput setaf 0)
RESET=$(tput sgr0)

sd_start() {
  sudo systemctl daemon-reload
  sudo systemctl enable sdwebui
  sudo systemctl start sdwebui
  sudo systemctl restart sdwebui

  git clone https://github.com/Zyin055/Config-Presets.git /var/www/$admin_name/stable-diffusion-webui/extensions/Config-Presets
  curl -s -o /var/www/$admin_name/stable-diffusion-webui/extensions/Config-Presets/config-txt2img.json https://raw.githubusercontent.com/alexeyralphs/sd/refs/heads/main/config-txt2img.json
  curl -s -o /var/www/$admin_name/stable-diffusion-webui/extensions/Config-Presets/config-img2img.json https://raw.githubusercontent.com/alexeyralphs/sd/refs/heads/main/config-img2img.json

  git clone https://github.com/ArtVentureX/sd-webui-agent-scheduler.git /var/www/$admin_name/stable-diffusion-webui/extensions/sd-webui-agent-scheduler
  git clone https://github.com/AlUlkesh/stable-diffusion-webui-images-browser.git /var/www/$admin_name/stable-diffusion-webui/extensions/stable-diffusion-webui-images-browser

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

  wget https://huggingface.co/XpucT/Deliberate/resolve/main/Deliberate_v2.safetensors -O /var/www/$admin_name/stable-diffusion-webui/models/Stable-diffusion/Deliberate_v2.safetensors

  sudo systemctl restart sdwebui
}
