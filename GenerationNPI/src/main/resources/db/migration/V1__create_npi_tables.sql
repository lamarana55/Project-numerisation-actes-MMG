-- Migration V1 : Tables NPI (GenerationNPI)
-- Ces tables sont créées dans le schéma public, en coexistence avec les tables RAVEC.

CREATE TABLE IF NOT EXISTS npi_quota_quartier (
    id          BIGSERIAL PRIMARY KEY,
    quartier_id UUID        NOT NULL,
    mois        DATE        NOT NULL,
    compteur    INTEGER     NOT NULL DEFAULT 0,
    CONSTRAINT uq_quota_quartier_mois UNIQUE (quartier_id, mois)
);

CREATE INDEX IF NOT EXISTS idx_quota_quartier_mois ON npi_quota_quartier (quartier_id, mois);

CREATE TABLE IF NOT EXISTS npi_genere (
    id                              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    npi                             VARCHAR(20)  NOT NULL UNIQUE,
    type_npi                        VARCHAR(50)  NOT NULL,
    nom                             VARCHAR(100) NOT NULL,
    prenom                          VARCHAR(100) NOT NULL,
    date_naissance                  DATE         NOT NULL,
    sexe                            CHAR(1)      NOT NULL,
    quartier_id                     UUID,
    commune_naissance_id            UUID,
    pays_naissance_code             VARCHAR(3),
    numero_certificat_naissance     VARCHAR(50),
    numero_acte_naissance           VARCHAR(50),
    numero_passeport                VARCHAR(50),
    nationalite                     VARCHAR(100),
    numero_carte                    VARCHAR(50),
    date_expiration_titre_sejour    DATE,
    date_generation                 TIMESTAMP    NOT NULL DEFAULT NOW(),
    statut                          VARCHAR(20)  NOT NULL DEFAULT 'GENERE',
    generated_by                    VARCHAR(100)
);

CREATE INDEX IF NOT EXISTS idx_npi_genere_npi          ON npi_genere (npi);
CREATE INDEX IF NOT EXISTS idx_npi_genere_quartier_id  ON npi_genere (quartier_id);
CREATE INDEX IF NOT EXISTS idx_npi_genere_date         ON npi_genere (date_generation);
