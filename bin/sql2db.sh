#!/usr/bin/env bash

# configure
DB='./etc/documents.db'
SCHEMA='./etc/schema.sql'
SQL='./etc/documents.sql'

# do the work
rm -rf $DB
cat $SCHEMA | sqlite3 $DB
cat $SQL    | sqlite3 $DB

# done
exit
