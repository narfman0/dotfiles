#!/bin/bash

# Visual Studio Code :: Package list
pkglist=(
zxh404.vscode-proto3
wingrunr21.vscode-ruby
misogi.ruby-rubocop
rebornix.ruby
ms-python.python
eamodio.gitlens
)

for i in ${pkglist[@]}; do
  code --install-extension $i
done
