#!/bin/sh

SHELL_ACTIVE="${HOME}/.$(basename $SHELL)rc"
GTRC="$HOME/.GlobalTraefik/globaltraefikrc.sh"

if [ -d $HOME/.GlobalTraefik ]; then
	echo "Traefik global est déja installé. Pour le désinstaller, exécuter la commande cd ~ && ./.GlobalTraefik/uninstall && cd - "
else
  echo "Clone du depot"
  git clone https://github.com/Sora-France/global-traefik.git $HOME/.GlobalTraefik --progress

  echo "Installation du Traefik global"
  cd $HOME/.GlobalTraefik
  make init
  cd -

  if ! cat $SHELL_ACTIVE | grep "source $GTRC" >/dev/null; then
    echo "source $GTRC" >> $SHELL_ACTIVE
    . $GTRC
  fi
fi
