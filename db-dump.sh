#!/bin/bash

export PGPASSWORD=koelpassword
pg_dump -v koel -h localhost \
	-U koel \
	-p 5432 \
	-F c > ~/pglocal-backups/koel-pgdb-$(date +%m%d%Y_%H%M%S).dump
echo Done!
