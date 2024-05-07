#!/bin/bash

cd /home/eben/work/legendary-flatpak

~/work/flatpak-builder-tools/pip/flatpak-pip-generator --runtime='org.gnome.Sdk//45' pycairo
~/work/flatpak-builder-tools/pip/flatpak-pip-generator --runtime='org.gnome.Sdk//45' PyGObject
~/work/flatpak-builder-tools/pip/flatpak-pip-generator --runtime='org.gnome.Sdk//45' legendary-gl[webview_gtk]
~/work/flatpak-builder-tools/pip/flatpak-pip-generator --runtime='org.gnome.Sdk//45' pypatch


flatpak-builder legendary  com.github.derrod.legendary.yml --force-clean  
flatpak-builder --user --install --force-clean legendary com.github.derrod.legendary.yml
flatpak build-bundle ~/.local/share/flatpak/repo legendary.flatpak com.github.derrod.legendary
