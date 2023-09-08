#!/bin/bash

pg_restore -v --clean --if-exists \
	-h localhost -p 5432 -U koel -d koel \
	/home/client.linux/pglocal-backups/koel-pgdb-09082023_111602.dump
#	~/pglocal-backups/koel-pgdb-09082023_111602.dump
echo Done!
