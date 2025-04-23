#!/bin/bash

BLUE_BG=$(tput setab 6)
GREEN_BG=$(tput setab 42)
BLACK_FG=$(tput setaf 0)
RESET=$(tput sgr0)

sd_requirements() {
  sudo apt -o Dpkg::Options::="--force-confold" install python3 -y
  sudo apt -o Dpkg::Options::="--force-confold" install python3-pip -y
  sudo apt -o Dpkg::Options::="--force-confold" install python3-venv -y
  sudo apt -o Dpkg::Options::="--force-confold" install libgl1 -y
  sudo apt -o Dpkg::Options::="--force-confold" install libglib2.0-0 -y
  sudo apt -o Dpkg::Options::="--force-confold" install bc -y
  sudo apt -o Dpkg::Options::="--force-confold" install google-perftools -y
  sudo apt -o Dpkg::Options::="--force-confold" install git -y
}
