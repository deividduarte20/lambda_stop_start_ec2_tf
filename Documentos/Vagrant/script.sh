#!/bin/bash

sudo apt-get update;
sudo apt-get install ansible -y;

ansible-playbook /vagrant/playbook.yaml -u root -e 'ansible_python_interpreter=/usr/bin/python3'
