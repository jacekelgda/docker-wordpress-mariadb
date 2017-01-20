### Wordpress local development enviroment

This is a very simple wordpress development setup.

It will allow you to start your wordpress development locally without need of dependencies and packages.

Installation process installs wordpress with clean database, ready to perform configuration process.

System is equipped with automatic backup system to keep your data even if you destroy containers.

## Requirements

- docker
- docker-compose

## Building images

`docker-compose build`

## Starting containers

`docker-compose up`

## Accessing website

Look at logs, check if all installations ended, then
http://localhost:8080

## Automatic backups

By default 'backup' container is accessing db every minute performing mysqldump to `mysq/backup/latest.sql`.

If `latest.sql` exists it will do a backup of it.

This system is mostly developed in case your database container is destroyed - if `latest.sql` has been generated, it will be used as automatic backup file for next `docker-compose up`. Give it about 2 minutes after all installations has been finished ( look at logs ).
