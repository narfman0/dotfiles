#!/bin/bash

# Visual Studio Code :: Package list
pkglist=(
zxh404.vscode-proto3
ms-python.python
)

for i in ${pkglist[@]}; do
  code --install-extension $i
done
