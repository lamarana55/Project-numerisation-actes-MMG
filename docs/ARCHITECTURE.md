# Architecture CI/CD — PN-RAVEC

> Plateforme d'état civil (RAVEC). Backend Spring Boot, frontend Angular, PostgreSQL,
> conteneurisé via Docker, déployé sur un serveur Ubuntu unique avec Docker Compose.
> Registry : GitHub Container Registry (GHCR).

## 1. Vue d'ensemble

```mermaid
flowchart TB
    subgraph Dev[Poste développeur]
      G[git push origin main]
    end

    subgraph GHA[GitHub Actions]
      direction TB
      T1[Tests backend]
      T2[Tests frontend]
      B[Build images Docker]
      SC[Scan Trivy]
      P[Push GHCR : sha + latest]
      D[Deploy SSH]
      T1 --> B
      T2 --> B
      B --> SC --> P --> D
    end

    subgraph GHCR[GitHub Container Registry]
      IB[(ravec-backend:sha-xxx)]
      IF[(ravec-frontend:sha-xxx)]
    end

    subgraph Server[Serveur Ubuntu - Docker Compose]
      direction TB
      N[Nginx hôte + TLS] --> FE[frontend :8082]
      FE --> BE[backend :8091]
      BE --> DB[(PostgreSQL)]
      BK[ops/backup-db.sh] --> DB
    end

    G --> GHA
    P --> GHCR
    D -->|pull images sha| Server
    GHCR -.-> Server
```

## 2. Composants

| Composant | Techno | Image | Port interne | Exposition |
|-----------|--------|-------|--------------|------------|
| Frontend  | Angular 17 + Nginx | `ghcr.io/lamarana55/ravec-frontend` | 80 | `127.0.0.1:8082` |
| Backend   | Spring Boot 3 / Java 21 | `ghcr.io/lamarana55/ravec-backend` | 8091 | interne (réseau Docker) |
| Base      | PostgreSQL 15 | `postgres:15-alpine` | 5432 | interne |
| PgAdmin   | (profil `tools`) | `dpage/pgadmin4` | 80 | `127.0.0.1:5051` |

Le backend **n'est jamais exposé** sur l'hôte : seul le frontend (Nginx) l'atteint via
le réseau Docker `ravec-pn-network`. Le TLS est géré par le Nginx/Certbot de l'hôte.

## 3. Flux de déploiement (résumé)

```mermaid
sequenceDiagram
    participant Dev
    participant GH as GitHub Actions
    participant GHCR
    participant Srv as Serveur

    Dev->>GH: push main
    GH->>GH: tests backend + frontend
    GH->>GH: build + scan Trivy
    GH->>GHCR: push sha-<commit> + latest
    GH->>Srv: scp compose + ops/, ssh
    Srv->>Srv: backup PostgreSQL
    Srv->>GHCR: pull images sha-<commit>
    Srv->>Srv: docker compose up -d
    Srv->>Srv: healthcheck (db, backend, frontend)
    alt healthcheck OK
        Srv-->>GH: succès
    else healthcheck KO
        Srv->>Srv: rollback auto (images précédentes)
        Srv-->>GH: échec (pipeline rouge)
    end
```

## 4. Versionnage des images

- **`sha-<commit>`** : tag déterministe utilisé pour le déploiement et le rollback.
- **`latest`** : commodité (dernier build de `main`), **non** utilisé pour déployer.

Le serveur déploie toujours par `sha-<commit>` → tout déploiement est traçable et
reproductible, et le rollback consiste à redéployer un `sha-` antérieur.

## 5. Réseaux & volumes

- Réseau applicatif isolé : `ravec-pn-network` (bridge).
- Volumes persistants : `ravec_pn_postgres_data`, `ravec_pn_backend_logs`, `ravec_pn_pgadmin_data`.
- Observabilité (optionnelle) : réseau `observability` + volumes Prometheus/Grafana/Loki.

## 6. Fichiers clés

| Fichier | Rôle |
|---------|------|
| `.github/workflows/ci.yml` | Tests sur PR / branches |
| `.github/workflows/cd.yml` | Pipeline complet sur `main` |
| `.github/workflows/rollback.yml` | Rollback manuel |
| `docker-compose.server.yml` | Stack de production (source unique) |
| `.env.server.example` | Modèle de configuration serveur |
| `ops/backup-db.sh` / `restore-db.sh` | Sauvegarde / restauration PostgreSQL |
| `ops/rollback.sh` | Rollback applicatif |
| `ops/healthcheck.sh` | Vérification post-déploiement |
| `monitoring/` | Stack Prometheus/Grafana/Loki (préparée) |

Voir aussi : [DEPLOYMENT.md](DEPLOYMENT.md) · [ROLLBACK.md](ROLLBACK.md) ·
[BACKUP.md](BACKUP.md) · [GITHUB_ACTIONS.md](GITHUB_ACTIONS.md).
