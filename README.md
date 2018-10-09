# PortalBackup

[![N|Solid](https://proxy.duckduckgo.com/iur/?f=1&image_host=http%3A%2F%2Fliquidat.files.wordpress.com%2F2014%2F02%2Fansible_logo_round.png%3Fw%3D150%26h%3D150&u=https://liquidat.files.wordpress.com/2014/02/ansible_logo_round.png?w=150&h=150)](https://github.com/desarrolloSmart/portalBackup)

PortalBackup es un shell desarrollado para obtener de manera comprimida los archivos tipo .EAR desde un servidor local de glassfish usando el protocolo SSH

### Instalacion y Uso

Se crea la relacion de confianza:

```sh
ssh-keygen -b 4096 -t rsa
```
```sh
sudo ssh-copy-id -i file.pub root@192.168.*.**
```

Se crea la carpeta backup en la siguiente ruta (recomendada):

```sh
Documents/Ears/$client/backup/
```
Donde $client es el nombre del cliente ej: Pereira, Tunja, etc.

Luego se edita el archivo portalBackup.sh y en la variable directorio agregamos el siguiente texto:

```sh
"$HOME/Documents/Ears/$client/backup/"
```

Por ultimo se ejecuta el bash:

```sh
bash -e ./portalBackup.sh
```
