#!/usr/bin/env bash
# ============================================================
#  Rollback PN-RAVEC — redéploie une version d'image précédente
#
#  Usage (sur le serveur, dans /opt/pn-ravec) :
#    ./ops/rollback.sh sha-<commit>     → redéploie ce tag précis
#    ./ops/rollback.sh latest           → redéploie latest
#    ./ops/rollback.sh                  → redéploie .last_successful_deploy
#
#  Effectue : pull → up -d → healthcheck. Si le healthcheck échoue, le rollback
#  est signalé en erreur (à investiguer manuellement).
# ============================================================
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

COMPOSE_FILE="${COMPOSE_FILE:-docker-compose.server.yml}"
ENV_FILE="${ENV_FILE:-.env}"
REGISTRY_NS="${REGISTRY_NS:-ghcr.io/lamarana55}"

TAG="${1:-}"
if [ -z "$TAG" ]; then
  TAG="$(cat .last_successful_deploy 2>/dev/null || echo "")"
fi
if [ -z "$TAG" ]; then
  echo "[rollback] Aucun tag fourni et aucun .last_successful_deploy. Abandon." >&2
  exit 1
fi

export BACKEND_IMAGE="${REGISTRY_NS}/ravec-backend:${TAG}"
export FRONTEND_IMAGE="${REGISTRY_NS}/ravec-frontend:${TAG}"

echo "[rollback] Cible : $TAG"
echo "[rollback]   backend  = $BACKEND_IMAGE"
echo "[rollback]   frontend = $FRONTEND_IMAGE"

# Sauvegarde de sécurité avant rollback
[ -x ./ops/backup-db.sh ] && { ./ops/backup-db.sh || echo "[rollback] WARN: backup échoué."; }

docker compose -f "$COMPOSE_FILE" --env-file "$ENV_FILE" pull backend frontend
docker compose -f "$COMPOSE_FILE" --env-file "$ENV_FILE" up -d --remove-orphans

if [ -x ./ops/healthcheck.sh ] && ./ops/healthcheck.sh; then
  echo "$TAG" > .last_successful_deploy
  echo "[rollback] ✅ Rollback réussi vers $TAG"
  docker image prune -f
else
  echo "[rollback] ❌ Healthcheck KO après rollback vers $TAG — intervention manuelle requise." >&2
  exit 1
fi
