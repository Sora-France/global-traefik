#!/bin/sh

if [ -d $HOME/.GlobalTraefik ]; then
	echo "Traefik global est déja installé. Pour le désinstaller, exécuter la commande \`rm -rf ~/.GlobalTraefik\`"
else
  echo "Clone du depot"
  git clone https://github.com/Sora-France/global-traefik.git $HOME/.GlobalTraefik --progress

  echo "Installation du Traefik global"
  cd $HOME/.GlobalTraefik
  make init
  cd -
fi
