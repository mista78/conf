#!/bin/bash
dirname=$(dirname $0)
USER=root
PASSWORD=kmaoulida
HOST=localhost
# db a importer (ex: gemaprod)
DBPRODNAME=$1
# ^ nom de la db en local (ex: gema)
DBNAME=$2
DATABASE_FILEPATH="$dirname/$1.sql.gz"
SCHEMA_FILEPATH="$dirname/$1-db.sql"

# scp batchadmin@sv-arclog01.carmf.fr:/var/srv/sv-batch/backup/database/$1.sql.gz $dirname/$1.sql.gz
# scp batchadmin@sv-arclog01.carmf.fr:/var/srv/sv-batch/backup/schemas/$1-db.sql $dirname/$1-db.sql

cd $dirname;
if [[ -f ${DATABASE_FILEPATH} ]]; then
gzip -d $dirname/$1.sql.gz
else
echo "Le fichier $dirname/${DATABASE_FILEPATH} n'existe pas"
exit 1
fi

echo "Drop de la base locale ${DBNAME}..."
mariadb -u ${USER} -p${PASSWORD} -h ${HOST} -e "DROP SCHEMA IF EXISTS $DBNAME"
echo "[OK]"

echo "Creation de la base locale ${DBNAME}..."
mariadb -u ${USER} -p${PASSWORD} -h ${HOST} -e "CREATE SCHEMA $DBNAME"
echo "[OK]"

echo "Creation du schema de la base ${DBNAME}..."
mariadb -u ${USER} -p${PASSWORD} -h ${HOST} ${DBNAME} <${SCHEMA_FILEPATH}
echo "[OK]"

echo "Import des données..."
mariadb -u ${USER} -p${PASSWORD} -h ${HOST} ${DBNAME} <${DBPRODNAME}.sql
echo "[OK]"

rm ${DBPRODNAME}.sql