#!/bin/bash
set -e

echo "Restoring PostgreSQL database from backup..."
pg_restore --username="$POSTGRES_USER" --dbname="$POSTGRES_DB" --password="$POSTGRES_PASSWORD" --no-owner /docker-entrypoint-initdb.d/csgo_project.tar
echo "Database restoration complete"
