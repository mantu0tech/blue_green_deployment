#!/bin/bash

sudo yum update 
sudo yum install httpd -y 
sudo echo "<h1>this is my simple web page</h1>" >/var/www/html/index.html

sudo systemctl restart httpd

sudo yum update

sudo yum install ruby -y

sudo yum install wget -y 

CODEDEPLOY_BIN="/opt/codedeploy-agent/bin/codedeploy-agent"
$CODEDEPLOY_BIN stop
yum erase codedeploy-agent -y

cd /home/ec2-user

wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install

chmod +x ./install

sudo ./install auto

systemctl start codedeploy-agent

systemctl status codedeploy-agent
