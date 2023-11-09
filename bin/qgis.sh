#!/bin/bash

sudo wget -O /etc/apt/keyrings/qgis-archive-keyring.gpg https://download.qgis.org/downloads/qgis-archive-keyring.gpg
echo "Types: deb deb-src
URIs: https://qgis.org/debian
Suites: $(lsb_release -cs)
Architectures: amd64
Components: main
Signed-By: /etc/apt/keyrings/qgis-archive-keyring.gpg" | sudo tee /etc/apt/sources.list.d/qgis.sources

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y qgis qgis-plugin-grass
