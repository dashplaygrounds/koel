#!/bin/bash

pg_restore -v --clean --if-exists \
	-h localhost -p 5432 -U koel -d koel \
	~/pglocal-backups/$(date +%m%d%Y_%H%M%S).dump
