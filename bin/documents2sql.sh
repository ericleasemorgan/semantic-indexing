#!/usr/bin/env bash

# configure
SQL='./etc/documents.sql'
CORPUS='./corpus'
DOCUMENTS2SQL='./bin/documents2sql.py'

# do the work
rm -rf $SQL
echo "BEGIN TRANSACTION;" > $SQL
find $CORPUS -name '*.txt' -exec $DOCUMENTS2SQL {} >> $SQL \;
echo "END TRANSACTION;" >> $SQL

# done
exit
