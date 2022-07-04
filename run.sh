#!/bin/bash
sudo apt-get update 
sudo apt-get upgrade -y
sudo apt-get install nginx -y
sudo apt-get install python3-pip -y
sudo apt-get install python3-dev -y
sudo apt-get install build-essiential -y
sudo apt-get install libssl-dev -y
sudo apt-get install libffi-dev -y
sudo apt-get install python3-setuptools -y
sudo apt-get install python3-venv -y

cd /var/www/html
sudo python3.10 -m venv project
source project/bin/activate
pip install wheel
pip install gunicorn flask

sudo git clone https://github.com/skmudassir-it/House_price_prediction.git
sudo nano wsgi.py
