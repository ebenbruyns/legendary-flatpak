#!/bin/bash

cd /home/eben/work/legendary-flatpak
VERSION="24.08"

~/work/flatpak-builder-tools/pip/flatpak-pip-generator --runtime="org.freedesktop.Sdk//${VERSION}" pycairo || exit
~/work/flatpak-builder-tools/pip/flatpak-pip-generator --runtime="org.freedesktop.Sdk//${VERSION}" PyGObject || exit

# ~/work/flatpak-builder-tools/pip/flatpak-pip-generator --runtime="org.freedesktop.Sdk//47' pypatch
~/work/flatpak-builder-tools/pip/flatpak-pip-generator --runtime="org.freedesktop.Sdk//${VERSION}" requests || exit
~/work/flatpak-builder-tools/pip/flatpak-pip-generator --runtime="org.freedesktop.Sdk//${VERSION}" pyinstaller || exit
~/work/flatpak-builder-tools/pip/flatpak-pip-generator --runtime="org.freedesktop.Sdk//${VERSION}" filelock || exit    
~/work/flatpak-builder-tools/pip/flatpak-pip-generator --runtime="org.freedesktop.Sdk//${VERSION}" altgraph || exit
# newer versions are broken so don't regen this
#~/work/flatpak-builder-tools/pip/flatpak-pip-generator --runtime="org.freedesktop.Sdk//${VERSION}" pywebview || exit

flatpak-builder legendary  com.github.derrod.legendary.yml --force-clean  
flatpak-builder --user --install --force-clean legendary com.github.derrod.legendary.yml
flatpak build-bundle ~/.local/share/flatpak/repo legendary.flatpak com.github.derrod.legendary
