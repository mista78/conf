# Ansible Local

Provisionnement d'une machine de dev avec ansible.

## Qu'est-ce-que c'est ?

Ansible est un outil d'automatisation pour la configuration de machines.

Le but ici est de l'utiliser pour les machines de dev.

## Objectifs:

- documentation des machines de dev
- reproductibilité
- partage avec la team Open

## Prérequis

- ansible doit etre installé : `apt install ansible`

## Utilisation

Copier le fichier `vars/custom.yml.dist` vers `vars/custom.yml`, et changer son contenu.

Extraire l'archive `extension.zip` (pour le playbook `php`).

Provisionner : `ansible-playbook apache.yml --ask-become-pass`

## Kerberos

Pour simuler Kerberos en local, rajouter une ligne a la configuration de host :

```yaml
extra: |
    SetEnv REMOTE_USER PASKARA
```

## Follow-up

On pourrait profiter d'une collaboration avec la team infra, afin de normaliser les machines de dev.

## Tips

Sur windows, il peut être nécessaire d'executer la commande suivante afin d'améliorer les perfs de la VM:

```
powercfg /powerthrottling disable /path "c:\Program Files (x86)\VMware\VMware Workstation\x64\vmware-vmx.exe"
```

Sur la VM, on peut utiliser cette extension afin de ne plus avoir a s'identifier tout le temps sur le proxy :
https://chromewebstore.google.com/detail/proxy-auto-auth/ggmdpepbjljkkkdaklfihhngmmgmpggp

Et pour Kerberos :
https://chromewebstore.google.com/detail/auto-auth/gpoiggobidhogpmmlakahiaaegibnogm

## Ressources

- https://www.middlewareinventory.com/blog/run-ansible-playbook-locally/
- https://gist.github.com/dipenparmar12/4e6cd50d8d1303d5e914742f62659116#5-create-mailhog-service-optional
- https://dev.to/kkentzo/deploying-a-service-using-ansible-and-systemd-4n11
- https://tutobox.fr/linux-passer-variables-environnement-php-fpm
- https://www.youtube.com/watch?v=pQeHLuJxRI8
