# Global Traefik
Network Traefik global pour docker

## Setup

### Installation rapide
```shell
curl https://raw.githubusercontent.com/Sora-France/global-traefik/refs/heads/develop/installer.sh | sh
```

### Désinstallation
```shell
cd ~ && ./.GlobalTraefik/uninstall && cd -
```
---

### Ajout des domaines dans le fichier Hosts

Ouvrir le fichier Hosts en mode administrateur

`/etc/hosts` sur Mac
`C:\windows\system32\drivers\etc\hosts` sur Windows

Ajouter les lignes suivantes et sauvegarder

```
# Traefik Global
127.0.0.1 traefik.local
```

### (Ré)Générer les certificats SSL

En premier lieu, et si cela n'a pas déjà été effectué sur le poste, il faut [installer mkcert](https://github.com/FiloSottile/mkcert) **sur la machine host** (dans le cas d'un WSL, l'installer sur Windows) puis exectuer la commande `mkcert -install`.

```shell
mkcert -cert-file .docker/traefik/certs/traefik.crt -key-file .docker/traefik/certs/traefik.key "traefik.local"
```

# TODO List

- Rendre la réinstallation / mise a jour moins destructrice: Actuellement, ce procédé va supprimer toutes les modifications de config ou de certificats apportés a l'instance installée.
- ~~Permettre l'agrégation des plusieurs certificats~~

# Usage

1. Installer "Global Traefik" ([Installation rapide](https://github.com/Sora-France/global-traefik#installation-rapide))
2. Générer et placer les certificats SSL dans le répertoire `~/.GlobalTraefik/.docker/traefik/certs`
    - exemple avec [mkcert](https://github.com/FiloSottile/mkcert): 
        ```bash
          mkcert -cert-file ~/.GlobalTraefik/.docker/traefik/certs/acme.crt -key-file ~/.GlobalTraefik/.docker/traefik/certs/acme.key "acme.local" "*.acme.local"
        ```
3. Redémarrer le traefik global pour prise en compte des nouveaux certificats: `traefik restart`
4. Ajouter les nouveaux domaines au fichier `host`
5. Configurer le `docker-compose.yml` du projet final
    - exemple:

```yaml

services:
  app:
#    ...
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.app.rule=Host(`acme.local`, `www.acme.local`)"
      - "traefik.http.routers.app.tls=true"
    networks:
      - internal
      - global-traefik

networks:
  internal:
    driver: bridge
  global-traefik:
    name: global-traefik
    external: true

```
