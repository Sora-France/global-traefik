# Global Traefik
Network Traefik global pour docker

## Setup

### Installation rapide
```shell
curl 
```


### Installation manuelle

```shell
make init
```

### Démarrage

```shell
make start
```

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
mkcert -cert-file .docker/traefik/certs/cert.pem -key-file .docker/traefik/certs/privkey.pem "traefik.local"
```
