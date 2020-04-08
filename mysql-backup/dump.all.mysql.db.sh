#! /bin/bash
 
BACKUP_DIR="/backup/"
MYSQL=/usr/bin/mysql
MYSQLDUMP=/usr/bin/mysqldump
 
mkdir -p "$BACKUP_DIR"
 
databases=`$MYSQL --defaults-extra-file=/etc/mysql/debian.cnf -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema)"`
 
for db in $databases; do
  $MYSQLDUMP --defaults-extra-file=/etc/mysql/debian.cnf --lock-tables=FALSE --single-transaction=TRUE --skip-triggers --databases $db | gzip > "$BACKUP_DIR/$db.gz"
  $MYSQLDUMP --defaults-extra-file=/etc/mysql/debian.cnf --triggers --routines --no-data --skip-triggers --databases $db | gzip > "$BACKUP_DIR/procedurs.table.$db.gz"
done
