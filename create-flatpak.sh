#!/bin/bash

cd /home/eben/work/legendary-flatpak

~/work/flatpak-builder-tools/pip/flatpak-pip-generator --runtime='org.gnome.Sdk//47' pycairo
~/work/flatpak-builder-tools/pip/flatpak-pip-generator --runtime='org.gnome.Sdk//47' PyGObject

# ~/work/flatpak-builder-tools/pip/flatpak-pip-generator --runtime='org.gnome.Sdk//47' pypatch
~/work/flatpak-builder-tools/pip/flatpak-pip-generator --runtime='org.gnome.Sdk//47' requests
~/work/flatpak-builder-tools/pip/flatpak-pip-generator --runtime='org.gnome.Sdk//47' pyinstaller
~/work/flatpak-builder-tools/pip/flatpak-pip-generator --runtime='org.gnome.Sdk//47' filelock     
~/work/flatpak-builder-tools/pip/flatpak-pip-generator --runtime='org.gnome.Sdk//47' altgraph 


flatpak-builder legendary  com.github.derrod.legendary.yml --force-clean  
flatpak-builder --user --install --force-clean legendary com.github.derrod.legendary.yml
flatpak build-bundle ~/.local/share/flatpak/repo legendary.flatpak com.github.derrod.legendary
