#!/bin/bash
sudo apt-get update 
sudo apt-get upgrade -y
sudo apt-get install nginx -y
sudo systemctl status nginx
sudo apt-get install python3-pip -y
sudo apt-get install python3-dev -y
sudo apt-get install build-essiential -y
sudo apt-get install libssl-dev -y
sudo apt-get install libffi-dev -y
sudo apt-get install python3-setuptools -y
sudo apt-get install python3-venv -y
pip3 install virtualenv
sudo git clone https://github.com/skmudassir-it/House_price_prediction.git
cd House_price_prediction
sudo python3 -m venv project
source project/bin/activate
sudo pip install wheel
sudo pip install gunicorn flask
sudo pip install -r requirements.txt
sudo pip install uwsgi flask
sudo mv main.py ./project/app.py
sudo mv static ./project/
sudo mv templates ./project/
sudo mv model ./project/


cd /var/www/html

cd House_price_prediction
sudo python3.10 -m venv project
source /var/www/html/House_price_prediction/project/bin/activate

gunicorn --bind 127.0.0.1:5000 app:app
deactivate
cd /var/www/html/House_price_prediction

sudo nano /etc/systemd/system/project.service

[Unit]
Description=Gunicorn instance to serve One
After=network.target

[Service]
User=root
Group=www-data
WorkingDirectory=/var/www/html/House_price_prediction
Environment="PATH=/var/www/html/House_price_prediction/project/bin"
ExecStart=var/www/html/House_price_prediction/project/bin/gunicorn --workers 3 --bind unix:project.sock -m 007 app:app

[Install]
WantedBy=multi-user.target

sudo systemctl start project
sudo systemctl enable project
sudo systemctl status project

#python3 main.py http://127.0.0.1:5000

