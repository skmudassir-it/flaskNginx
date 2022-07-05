#!/bin/bash
sudo apt-get update 
sudo apt-get upgrade -y
sudo apt-get install openssl
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
pip3 install wheel
sudo python3 -m pip install gunicorn flask
sudo python3 -m pip install uwsgi flask
pip3 install -r requirements.txt
pip3 install uwsgi flask
sudo mv main.py ./project/app.py
sudo mv static ./project/
sudo mv templates ./project/
sudo mv model ./project/
#python3 app.py
sudo nano project.ini

'''
[uwsgi]
module = app:app
master = true
processes = 5
socket = project.sock
chmod-socket = 660
vacuum = true
die-on-term = true
logto = /home/ubuntu/House_price_prediction/project/project.log
'''

sudo nano /etc/systemd/system/project.service

'''
[Unit]
Description=uWSGI instance to serve project
After=network.target

[Service]
User=root
Group=www-data
WorkingDirectory=/home/ubuntu/House_price_prediction
Environment="PATH=/home/ubuntu/House_price_prediction/project/bin"
ExecStart=/home/ubuntu/House_price_prediction/project/bin/uwsgi --ini project.ini

[Install]
WantedBy=multi-user.target
'''

sudo systemctl start project
sudo systemctl enable project
sudo systemctl status project


cd /var/www/html

cd House_price_prediction
sudo python3.10 -m venv project
source /var/www/html/House_price_prediction/project/bin/activate

gunicorn --bind 127.0.0.1:5000 app:app
deactivate
cd /var/www/html/House_price_prediction

sudo nano /etc/systemd/system/project.service





#python3 main.py http://127.0.0.1:5000

