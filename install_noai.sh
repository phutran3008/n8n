#!/bin/bash
echo "--------- 🟢 Start install docker -----------"
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install -y docker-ce
echo "--------- 🔴 Finish install docker -----------"
echo "--------- 🟢 Start creating folder -----------"
cd ~
mkdir vol_n8n
sudo chown -R 1000:1000 vol_n8n
sudo chmod -R 755 vol_n8n
echo "--------- 🔴 Finish creating folder -----------"
echo "--------- 🟢 Start docker compose up  -----------"
export CURR_DIR=$(pwd)
export EXTERNAL_IP=http://"$(hostname -I | cut -f1 -d' ')"
wget https://raw.githubusercontent.com/phutran3008/n8n/refs/heads/main/compose_noai.yaml -O compose.yaml
echo "--------- 🔴 Finish compose file download -----------"
echo "--------- 🟢 Pulling latest n8n image -----------"
sudo docker pull n8nio/n8n:latest
echo "--------- 🔴 Finish pulling n8n image -----------"
echo "--------- 🟢 Start docker compose up -----------"
sudo -E docker compose up -d
echo "--------- 🔴 Finish! Wait a few minutes and test in browser at url $EXTERNAL_IP for n8n UI -----------"
