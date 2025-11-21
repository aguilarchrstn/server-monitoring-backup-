#!/bin/bash

DB_NAME="productiondb"
DB_USER="postgres"          # <<< change if needed
BACKUP_DIR="/opt/db_backups"
DATE=$(date +%Y-%m-%d-%H%M)
FILENAME="${DB_NAME}_${DATE}.sql.gz"

mkdir -p "$BACKUP_DIR"

# Run pg_dump
if pg_dump -U "$DB_USER" -F p "$DB_NAME" | gzip > "${BACKUP_DIR}/${FILENAME}"; then
    echo "Backup completed successfully: ${FILENAME}"
else
    echo "Backup FAILED for database ${DB_NAME}"
    exit 1
fi
