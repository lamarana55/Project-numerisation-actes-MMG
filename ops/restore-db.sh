#!/usr/bin/env bash
# ============================================================
#  Restauration PostgreSQL — PN-RAVEC
#
#  Usage :
#    ./ops/restore-db.sh                       → restaure backups/latest.sql.gz
#    ./ops/restore-db.sh backups/ravec_xxx.sql.gz
#
#  ⚠️ Opération destructive : écrase la base courante. Confirmation demandée.
# ============================================================
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if [ -f .env ]; then set -a; . ./.env; set +a; fi

PG_CONTAINER="${PG_CONTAINER:-ravec-pn-postgres}"
DB_NAME="${DATABASE:-ravec_db}"
DB_USER="${DATABASE_USER:-ravec_user}"
BACKUP_DIR="${BACKUP_DIR:-$ROOT_DIR/backups}"

FILE="${1:-$BACKUP_DIR/latest.sql.gz}"

if [ ! -f "$FILE" ]; then
  echo "[restore] Fichier introuvable : $FILE" >&2
  exit 1
fi

echo "⚠️  ATTENTION : la base '$DB_NAME' va être ÉCRASÉE par $FILE"
if [ "${FORCE:-}" != "yes" ]; then
  read -r -p "Confirmer la restauration ? (tapez 'oui') : " ans
  [ "$ans" = "oui" ] || { echo "Annulé."; exit 1; }
fi

# Sauvegarde de sécurité avant restauration
echo "[restore] Sauvegarde de sécurité préalable..."
./ops/backup-db.sh || echo "[restore] WARN: backup préalable échoué."

echo "[restore] Restauration en cours..."
gunzip -c "$FILE" | docker exec -i "$PG_CONTAINER" psql -U "$DB_USER" -d "$DB_NAME"

echo "[restore] Terminé. Redémarrage du backend recommandé :"
echo "          docker compose -f docker-compose.server.yml --env-file .env restart backend"
