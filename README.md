# drupal-starter

Image with Drupal and a bit of usefull commands

Tools available in the image

| Name     | Description                    |
|----------|--------------------------------|
| drush    | Manage the drupal installation |
| composer | Dependency manager             |

# docker-compose usage

Image that can be useful to build up a dev environment with the help of docker-compose. 

The ideal folder structure

```
.
├── docroot
│   └── // the drupal installation
└── starting
    ├── libraries
    ├── modules
    ├── profile
    └── themes
```

Here an example

```yml
version: '3.1'
services:
  db:
    image: 'mysql:5.7'
    container_name: "${PROJECT_NAME}_db"
    restart: unless-stopped
    environment:
      MYSQL_ROOT_PASSWORD: root
  pma:
    image: phpmyadmin/phpmyadmin
    container_name: "${PROJECT_NAME}_pma"
    environment:
      PMA_HOST: db
      PMA_USER: root
      PMA_PASSWORD: root
      PHP_UPLOAD_MAX_FILESIZE: 1G
      PHP_MAX_INPUT_VARS: 1G
      UPLOAD_LIMIT: 1G
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.pma.rule=Host(`pma.localhost`)"
      - "traefik.http.routers.pma.entrypoints=web"
  traefik:
    image: "traefik:v2.5"
    container_name: "${PROJECT_NAME}_traefik"
    command:
      #- "--log.level=DEBUG"
      - "--api.insecure=true"
      - "--providers.docker=true"
      - "--providers.docker.exposedbydefault=false"
      - "--entrypoints.web.address=:80"
      - "--entrypoints.websecure.address=:443"
      - "--certificatesresolvers.myresolver.acme.tlschallenge=true"
    ports:
      - "8080:8080"
      - "80:80"
      - "443:443"
    volumes:
      - "/var/run/docker.sock:/var/run/docker.sock:ro"
  php:
    image: ggggino/drupal-starter:latest
    container_name: "${PROJECT_NAME}_php"
    restart: unless-stopped
    volumes:
      - './drupal-starter/initializer:/var/www/initializer'
      - './starting:/var/www/starting'
      - ./docroot:/var/www/html
    environment:
      DRUPAL_VERSION: 9
  apache:
    image: wodby/apache
    container_name: "${PROJECT_NAME}_apache"
    depends_on:
      - php
    environment:
      APACHE_LOG_LEVEL: debug
      APACHE_BACKEND_HOST: php
      APACHE_VHOST_PRESET: php
      APACHE_DOCUMENT_ROOT: /var/www/html/web
    volumes:
      - ./docroot:/var/www/html:cached
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.site.rule=Host(`site.localhost`)"
      - "traefik.http.routers.site.entrypoints=web"
```

# Starting seeds

If you want to start with some custom libraries/modules

During the installation, the command will search into the **/var/www/starting**

```
starting
├── libraries
├── modules
├── profile
    ├── config/*
    └── xxxprofile.info.yml
└── themes
```

1) **modules**: put here your custom modules
2) **themes**: put here your custom themes
3) **libraries**: put here your libraries that should be used by the modules
4) **profile**: put here your custom installation files.

Put that in the **starting** folder

# Env variables

| Name           | Type             | example                            |
|----------------|------------------|------------------------------------|
| DRUPAL_VERSION | semantic version | 9.0                                |
| DRUPAL_DEPS    | strings          | drupal/admin_toolbar drupal/advagg |
