#!/usr/bin/env bash
# ============================================================
#  Vérification post-déploiement — PN-RAVEC
#  Contrôle : PostgreSQL, backend (/actuator/health), frontend (Nginx /health)
#  Code de sortie 0 = tout OK, 1 = au moins un service KO.
#
#  Les sondes backend/frontend passent par le conteneur Nginx (qui embarque
#  wget) sur le réseau Docker interne — le backend n'est pas exposé sur l'hôte.
# ============================================================
set -uo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"
if [ -f .env ]; then set -a; . ./.env; set +a; fi

PG_CONTAINER="${PG_CONTAINER:-ravec-pn-postgres}"
FRONT_CONTAINER="${FRONT_CONTAINER:-ravec-pn-frontend}"
DB_NAME="${DATABASE:-ravec_db}"
DB_USER="${DATABASE_USER:-ravec_user}"
BACKEND_URL="http://backend:8091/api/v1/actuator/health"
FRONT_URL="http://localhost/health"
RETRIES="${HEALTHCHECK_RETRIES:-12}"
DELAY="${HEALTHCHECK_DELAY:-10}"

ok() { echo "  ✅ $1"; }
ko() { echo "  ❌ $1"; }

check_db() {
  docker exec "$PG_CONTAINER" pg_isready -U "$DB_USER" -d "$DB_NAME" >/dev/null 2>&1
}

check_backend() {
  docker exec "$FRONT_CONTAINER" wget -q -O - --timeout=5 "$BACKEND_URL" 2>/dev/null | grep -q '"status":"UP"'
}

check_frontend() {
  docker exec "$FRONT_CONTAINER" wget -q -O - --timeout=5 "$FRONT_URL" >/dev/null 2>&1
}

echo "→ Vérification de santé (max ${RETRIES} tentatives, ${DELAY}s d'intervalle)"
for i in $(seq 1 "$RETRIES"); do
  DB=KO; BK=KO; FR=KO
  check_db        && DB=OK
  check_backend   && BK=OK
  check_frontend  && FR=OK

  if [ "$DB" = OK ] && [ "$BK" = OK ] && [ "$FR" = OK ]; then
    ok "PostgreSQL"; ok "Backend (/actuator/health UP)"; ok "Frontend (Nginx)"
    echo "→ Tous les services sont opérationnels."
    exit 0
  fi
  echo "  tentative $i/$RETRIES : db=$DB backend=$BK frontend=$FR — nouvelle tentative dans ${DELAY}s"
  sleep "$DELAY"
done

echo "→ Échec : au moins un service ne répond pas."
[ "${DB:-KO}" = OK ] && ok "PostgreSQL" || ko "PostgreSQL"
[ "${BK:-KO}" = OK ] && ok "Backend"    || ko "Backend (/actuator/health)"
[ "${FR:-KO}" = OK ] && ok "Frontend"   || ko "Frontend (Nginx)"
exit 1
