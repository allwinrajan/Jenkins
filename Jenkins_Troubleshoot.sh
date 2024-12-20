#!/bin/bash
#If Jenkins Directory is not there

#1. Check the Jenkins Working Directory

echo "checking directory is present or not"

if [ -d /var/lib/jenkins ]; then

sudo ls -l /var/lib/jenkins
echo "directory is present"

#If it's missing or has incorrect permissions, you can recreate it or adjust the permissions:

else
     echo "directory is not present"
     sudo mkdir -p /var/lib/jenkins
     sudo chown -R jenkins:jenkins /var/lib/jenkins
     echo "directory is created with permission"
fi

#Check the jenkins.service File
sudo nano /usr/lib/systemd/system/jenkins.service

# restart deamon
sudo systemctl daemon-reload

#Check Jenkins Log Files
sudo cat /var/log/jenkins/jenkins.log

#restart jenkins
sudo systemctl restart jenkins

#check status of jenkins server
systemctl status jenkins.service

#Enable and Start Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

