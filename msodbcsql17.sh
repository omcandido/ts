#!/bin/bash

curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg

curl https://packages.microsoft.com/keys/microsoft.asc | tee /etc/apt/trusted.gpg.d/microsoft.asc 

curl https://packages.microsoft.com/config/debian/12/prod.list | tee /etc/apt/sources.list.d/msprod.list

apt-get update 
ACCEPT_EULA=Y apt-get install -y msodbcsql17
