#!/bin/bash

USER=pi

sudo apt update && sudo apt upgrade -y

sudo apt install vlc -y

sudo mv autoplay.sh /home/$USER/autoplay.sh
sudo mv autoplay.service /etc/systemd/system/autoplay.service

chmod +x /home/$USER/autoplay.sh

echo "alias off='sudo shutdown -h now'" >> /home/$USER/.bashrc
echo "alias start='sudo systemctl restart autoplay.service'" >> /home/$USER/.bashrc
echo "alias stop=\"kill \$(ps aux | grep vlc | awk 'NR==1 {print \$2}')\"" >> /home/$USER/.bashrc

sudo systemctl daemon-reload
sudo systemctl enable autoplay.service

# If video is stuck:
# - Press "S". If it doesn't work:
# - Open terminal with Ctrl + Alt + T
# - Run "stop" in the terminal
# - When the video starts playing again, press "S"
