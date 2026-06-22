#!/usr/bin/env bash
# ============================================================
#  Sauvegarde PostgreSQL — PN-RAVEC
#  - pg_dump compressé du conteneur Docker
#  - rotation automatique (conserve les N derniers jours)
#
#  Usage :   ./ops/backup-db.sh
#  Cron  :   0 2 * * *  cd /opt/pn-ravec && ./ops/backup-db.sh >> backups/backup.log 2>&1
# ============================================================
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

# Charger les variables d'environnement (.env du serveur)
if [ -f .env ]; then set -a; . ./.env; set +a; fi

PG_CONTAINER="${PG_CONTAINER:-ravec-pn-postgres}"
DB_NAME="${DATABASE:-ravec_db}"
DB_USER="${DATABASE_USER:-ravec_user}"
BACKUP_DIR="${BACKUP_DIR:-$ROOT_DIR/backups}"
RETENTION_DAYS="${BACKUP_RETENTION_DAYS:-14}"

mkdir -p "$BACKUP_DIR"
STAMP="$(date +%Y%m%d_%H%M%S)"
FILE="$BACKUP_DIR/ravec_${DB_NAME}_${STAMP}.sql.gz"

echo "[backup] Dump de '$DB_NAME' depuis '$PG_CONTAINER' → $FILE"
# -Fc serait plus riche, mais .sql.gz reste universel et restaurable facilement.
docker exec "$PG_CONTAINER" pg_dump -U "$DB_USER" -d "$DB_NAME" \
  | gzip -9 > "$FILE"

# Vérifier que le fichier n'est pas vide
if [ ! -s "$FILE" ]; then
  echo "[backup] ERREUR : sauvegarde vide, suppression de $FILE" >&2
  rm -f "$FILE"
  exit 1
fi

SIZE="$(du -h "$FILE" | cut -f1)"
echo "[backup] OK ($SIZE)"

# Rotation : supprimer les sauvegardes plus vieilles que RETENTION_DAYS
echo "[backup] Rotation : suppression des dumps > ${RETENTION_DAYS} jours"
find "$BACKUP_DIR" -name 'ravec_*.sql.gz' -type f -mtime +"$RETENTION_DAYS" -print -delete || true

# Lien symbolique vers la dernière sauvegarde (pratique pour la restauration)
ln -sf "$(basename "$FILE")" "$BACKUP_DIR/latest.sql.gz"
echo "[backup] Terminé. Dernière sauvegarde : $BACKUP_DIR/latest.sql.gz"
