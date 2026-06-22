-- ============================================================
--  V1 — Baseline du schéma RAVEC (backend principal)
-- ============================================================
--  Généré depuis le schéma réel de db_numerisation (pg_dump --schema-only).
--  Périmètre : tables propriété du backend RAVEC uniquement.
--  Les tables npi_genere / npi_quota_quartier sont gérées par le
--  microservice GenerationNPI via sa propre migration Flyway et sont
--  donc volontairement EXCLUES de cette baseline.
--
--  Historique Flyway dédié : flyway_schema_history_ravec (séparé de
--  celui de GenerationNPI) pour cohabiter sur la base partagée.
-- ============================================================

--
-- PostgreSQL database dump
--

\restrict a7FqtIbaNcFj2yuGR5RutcjUFM10rGiPwXBZvLBzZSYBYcp3jPr0JRM7mN8yWcM

-- Dumped from database version 15.18
-- Dumped by pg_dump version 15.18

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: acte_deces; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.acte_deces (
    id character varying(255) NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    is_delete character varying(255) NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    actions_faire character varying(255) NOT NULL,
    annee_registre character varying(255),
    cause_deces character varying(255),
    conjoint_connu character varying(255),
    date_action timestamp(6) without time zone,
    date_deces date,
    date_declaration date,
    date_dressage date,
    date_inscription date,
    date_jugement date,
    feuillet character varying(255),
    heure_deces character varying(255),
    heure_dressage character varying(255),
    heure_inscription character varying(255),
    is_deleted character varying(255) NOT NULL,
    lien_declarant_defunt character varying(255),
    lieu_deces character varying(255),
    motif_rejet text,
    numero_acte character varying(255),
    numero_jugement character varying(255),
    qualite_declarant character varying(255),
    signature_declarant character varying(255),
    situation_matrimoniale character varying(255),
    source character varying(255) NOT NULL,
    statut character varying(255) NOT NULL,
    tribunal character varying(255),
    type_deces character varying(255),
    agent_id character varying(255),
    commune_id uuid,
    conjoint_id character varying(255),
    declarant_id character varying(255),
    defunt_id character varying(255),
    mere_id character varying(255),
    pere_id character varying(255),
    type_acte_id character varying(255),
    validateur_id character varying(255),
    CONSTRAINT acte_deces_actions_faire_check CHECK (((actions_faire)::text = ANY ((ARRAY['EN_COURS_SAISIE'::character varying, 'A_CORRIGER'::character varying, 'A_VALIDER'::character varying])::text[]))),
    CONSTRAINT acte_deces_is_delete_check CHECK (((is_delete)::text = ANY ((ARRAY['Yes'::character varying, 'No'::character varying])::text[]))),
    CONSTRAINT acte_deces_is_deleted_check CHECK (((is_deleted)::text = ANY ((ARRAY['Yes'::character varying, 'No'::character varying])::text[]))),
    CONSTRAINT acte_deces_source_check CHECK (((source)::text = ANY ((ARRAY['DECLARATION'::character varying, 'TRANSCRIPTION'::character varying, 'NUMERISATION'::character varying, 'INDEXATION'::character varying])::text[]))),
    CONSTRAINT acte_deces_statut_check CHECK (((statut)::text = ANY ((ARRAY['EN_ATTENTE'::character varying, 'VALIDE'::character varying, 'REJETE'::character varying])::text[])))
);


--
-- Name: acte_mariage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.acte_mariage (
    id character varying(255) NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    is_delete character varying(255) NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    actions_faire character varying(255) NOT NULL,
    annee_registre character varying(255),
    date_action timestamp(6) without time zone,
    date_declaration date,
    date_dressage date,
    date_mariage date,
    etat_civil_ant_epouse character varying(255),
    etat_civil_ant_epoux character varying(255),
    feuillet character varying(255),
    heure_dressage character varying(255),
    heure_mariage character varying(255),
    is_deleted character varying(255) NOT NULL,
    lieu_mariage character varying(255),
    motif_rejet text,
    numero_acte character varying(255),
    point_collecte character varying(255),
    regime_matrimonial character varying(255),
    signature_declarant character varying(255),
    source character varying(255) NOT NULL,
    statut character varying(255) NOT NULL,
    type_mariage character varying(255),
    agent_id character varying(255),
    commune_id uuid,
    declarant_id character varying(255),
    epouse_id character varying(255),
    epoux_id character varying(255),
    mere_epouse_id character varying(255),
    mere_epoux_id character varying(255),
    pere_epouse_id character varying(255),
    pere_epoux_id character varying(255),
    temoin1_id character varying(255),
    temoin2_id character varying(255),
    type_acte_id character varying(255),
    validateur_id character varying(255),
    CONSTRAINT acte_mariage_actions_faire_check CHECK (((actions_faire)::text = ANY ((ARRAY['EN_COURS_SAISIE'::character varying, 'A_CORRIGER'::character varying, 'A_VALIDER'::character varying])::text[]))),
    CONSTRAINT acte_mariage_is_delete_check CHECK (((is_delete)::text = ANY ((ARRAY['Yes'::character varying, 'No'::character varying])::text[]))),
    CONSTRAINT acte_mariage_is_deleted_check CHECK (((is_deleted)::text = ANY ((ARRAY['Yes'::character varying, 'No'::character varying])::text[]))),
    CONSTRAINT acte_mariage_source_check CHECK (((source)::text = ANY ((ARRAY['DECLARATION'::character varying, 'TRANSCRIPTION'::character varying, 'NUMERISATION'::character varying, 'INDEXATION'::character varying])::text[]))),
    CONSTRAINT acte_mariage_statut_check CHECK (((statut)::text = ANY ((ARRAY['EN_ATTENTE'::character varying, 'VALIDE'::character varying, 'REJETE'::character varying])::text[])))
);


--
-- Name: acte_naissance; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.acte_naissance (
    id character varying(255) NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    is_delete character varying(255) NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    actions_faire character varying(255) NOT NULL,
    adresse_lieu character varying(255),
    annee_registre character varying(255),
    commune_mariage character varying(255),
    date_action timestamp(6) without time zone,
    date_declaration date,
    date_dressage date,
    date_inscription date,
    date_jugement date,
    date_mariage date,
    document_mariage character varying(255),
    feuillet character varying(255),
    formation_sanitaire character varying(255),
    heure_dressage character varying(255),
    heure_inscription character varying(255),
    heure_naissance character varying(255),
    is_deleted character varying(255) NOT NULL,
    lieu_accouchement character varying(255),
    meme_domicile_que_pere character varying(255),
    mere_connue character varying(255),
    mere_decedee character varying(255),
    motif_rejet text,
    naissance_multiple character varying(255),
    numero_acte character varying(255),
    numero_acte_mariage character varying(255),
    numero_jugement character varying(255),
    numero_volume character varying(255),
    parents_maries character varying(255),
    pere_connu character varying(255),
    pere_decede character varying(255),
    point_collecte character varying(255),
    qualite_declarant character varying(255),
    raison_non_signature character varying(255),
    rang_enfant integer,
    rang_naissance_mere integer,
    sexe_declarant character varying(255),
    signature_declarant character varying(255),
    source character varying(255) NOT NULL,
    statut character varying(255) NOT NULL,
    tribunal character varying(255),
    type_naissance_multiple character varying(255),
    agent_id character varying(255),
    commune_id uuid,
    declarant_id character varying(255),
    enfant_id character varying(255),
    mere_id character varying(255),
    pere_id character varying(255),
    type_acte_id character varying(255),
    validateur_id character varying(255),
    CONSTRAINT acte_naissance_actions_faire_check CHECK (((actions_faire)::text = ANY ((ARRAY['EN_COURS_SAISIE'::character varying, 'A_CORRIGER'::character varying, 'A_VALIDER'::character varying])::text[]))),
    CONSTRAINT acte_naissance_is_delete_check CHECK (((is_delete)::text = ANY ((ARRAY['Yes'::character varying, 'No'::character varying])::text[]))),
    CONSTRAINT acte_naissance_is_deleted_check CHECK (((is_deleted)::text = ANY ((ARRAY['Yes'::character varying, 'No'::character varying])::text[]))),
    CONSTRAINT acte_naissance_source_check CHECK (((source)::text = ANY ((ARRAY['DECLARATION'::character varying, 'TRANSCRIPTION'::character varying, 'NUMERISATION'::character varying, 'INDEXATION'::character varying])::text[]))),
    CONSTRAINT acte_naissance_statut_check CHECK (((statut)::text = ANY ((ARRAY['EN_ATTENTE'::character varying, 'VALIDE'::character varying, 'REJETE'::character varying])::text[])))
);


--
-- Name: cause_deces; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cause_deces (
    id bigint NOT NULL,
    libelle character varying(300) NOT NULL
);


--
-- Name: cause_deces_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.cause_deces ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.cause_deces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: commune; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.commune (
    id uuid NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    is_delete character varying(255) NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    code character varying(255),
    nom character varying(255),
    prefecture_id uuid,
    CONSTRAINT commune_is_delete_check CHECK (((is_delete)::text = ANY ((ARRAY['Yes'::character varying, 'No'::character varying])::text[])))
);


--
-- Name: document_acte; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.document_acte (
    id character varying(255) NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    is_delete character varying(255) NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    contenu text,
    extension character varying(255),
    nom_fichier character varying(255),
    type_document character varying(255),
    acte_deces_id character varying(255),
    acte_naissance_id character varying(255),
    CONSTRAINT document_acte_is_delete_check CHECK (((is_delete)::text = ANY ((ARRAY['Yes'::character varying, 'No'::character varying])::text[])))
);


--
-- Name: nationalite; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nationalite (
    code character varying(3) NOT NULL,
    libelle_feminin character varying(255) NOT NULL,
    libelle_masculin character varying(255) NOT NULL
);




--
-- Name: pays; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pays (
    id uuid NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    is_delete character varying(255) NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    code character varying(255),
    code_numerique character varying(255),
    code_region character varying(255),
    nom character varying(255),
    CONSTRAINT pays_is_delete_check CHECK (((is_delete)::text = ANY ((ARRAY['Yes'::character varying, 'No'::character varying])::text[])))
);


--
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.permission (
    id character varying(255) NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    is_delete character varying(255) NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    description character varying(255),
    nom character varying(255) NOT NULL,
    CONSTRAINT permission_is_delete_check CHECK (((is_delete)::text = ANY ((ARRAY['Yes'::character varying, 'No'::character varying])::text[])))
);


--
-- Name: personne; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.personne (
    id character varying(255) NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    is_delete character varying(255) NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    adresse character varying(255),
    commune_domicile character varying(255),
    commune_naissance character varying(255),
    date_naissance date,
    nationalite character varying(255),
    nom character varying(255),
    npi character varying(255),
    pays_naissance character varying(255),
    pays_residence character varying(255),
    prefecture_domicile character varying(255),
    prefecture_naissance character varying(255),
    prenom character varying(255),
    profession character varying(255),
    quartier_domicile character varying(255),
    quartier_naissance character varying(255),
    region_domicile character varying(255),
    region_naissance character varying(255),
    sexe character varying(255),
    situation_matrimoniale character varying(255),
    telephone character varying(255),
    ville_naissance character varying(255),
    CONSTRAINT personne_is_delete_check CHECK (((is_delete)::text = ANY ((ARRAY['Yes'::character varying, 'No'::character varying])::text[])))
);


--
-- Name: prefecture; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prefecture (
    id uuid NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    is_delete character varying(255) NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    code character varying(255),
    nom character varying(255),
    region_id uuid,
    CONSTRAINT prefecture_is_delete_check CHECK (((is_delete)::text = ANY ((ARRAY['Yes'::character varying, 'No'::character varying])::text[])))
);


--
-- Name: profession; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.profession (
    code integer NOT NULL,
    feminin character varying(255) NOT NULL,
    masculin character varying(255) NOT NULL
);


--
-- Name: quartier; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.quartier (
    id uuid NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    is_delete character varying(255) NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    code character varying(255),
    nom character varying(255),
    commune_id uuid,
    CONSTRAINT quartier_is_delete_check CHECK (((is_delete)::text = ANY ((ARRAY['Yes'::character varying, 'No'::character varying])::text[])))
);


--
-- Name: region; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.region (
    id uuid NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    is_delete character varying(255) NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    code character varying(255),
    nom character varying(255),
    CONSTRAINT region_is_delete_check CHECK (((is_delete)::text = ANY ((ARRAY['Yes'::character varying, 'No'::character varying])::text[])))
);


--
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.role (
    id character varying(255) NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    is_delete character varying(255) NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    description character varying(255),
    libelle character varying(255),
    niveau_administratif character varying(255) DEFAULT 'COMMUNAL'::character varying NOT NULL,
    nom character varying(255) NOT NULL,
    CONSTRAINT role_is_delete_check CHECK (((is_delete)::text = ANY ((ARRAY['Yes'::character varying, 'No'::character varying])::text[]))),
    CONSTRAINT role_niveau_administratif_check CHECK (((niveau_administratif)::text = ANY ((ARRAY['CENTRAL'::character varying, 'REGIONAL'::character varying, 'PREFECTORAL'::character varying, 'COMMUNAL'::character varying])::text[]))),
    CONSTRAINT role_niveau_administratif_check1 CHECK (((niveau_administratif)::text = ANY ((ARRAY['CENTRAL'::character varying, 'REGIONAL'::character varying, 'PREFECTORAL'::character varying, 'COMMUNAL'::character varying])::text[])))
);


--
-- Name: role_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.role_permission (
    role_id character varying(255) NOT NULL,
    permission_id character varying(255) NOT NULL
);


--
-- Name: type_acte; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.type_acte (
    id character varying(255) NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    is_delete character varying(255) NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    actif boolean NOT NULL,
    code character varying(255) NOT NULL,
    description character varying(255),
    libelle character varying(255) NOT NULL,
    CONSTRAINT type_acte_is_delete_check CHECK (((is_delete)::text = ANY ((ARRAY['Yes'::character varying, 'No'::character varying])::text[])))
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id character varying(255) NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    is_delete character varying(255) NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    code character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    fonction character varying(255),
    must_change_password boolean DEFAULT false NOT NULL,
    nom character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    prenom character varying(255) NOT NULL,
    reset_password_token character varying(255),
    statut character varying(255),
    telephone character varying(255),
    username character varying(255) NOT NULL,
    commune_id uuid,
    prefecture_id uuid,
    region_id uuid,
    role_id character varying(255) NOT NULL,
    CONSTRAINT users_is_delete_check CHECK (((is_delete)::text = ANY ((ARRAY['Yes'::character varying, 'No'::character varying])::text[]))),
    CONSTRAINT users_statut_check CHECK (((statut)::text = ANY ((ARRAY['Activated'::character varying, 'Desactivated'::character varying])::text[])))
);


--
-- Name: valid_birth; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.valid_birth (
    id character varying(255) NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    is_delete character varying(255) NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    annee_naissance character varying(255),
    annee_registre character varying(255),
    annee_des_faits character varying(255),
    autre_nationalite_du_membre character varying(255),
    autre_pays_de_nais character varying(255),
    autre_profession character varying(255),
    code_pays_nais_membre character varying(255),
    code_place_de_nais_membre character varying(255),
    code_place_de_redaction character varying(255),
    code_profession character varying(255),
    commune character varying(255),
    commune_de_nais character varying(255),
    date_action timestamp(6) without time zone,
    date_declarant character varying(255),
    date_naissance character varying(255),
    date_naissance_mere character varying(255),
    date_naissance_pere character varying(255),
    date_etablissement_acte character varying(255),
    district character varying(255),
    district_de_nais character varying(255),
    domicile_parent character varying(255),
    extension character varying(255),
    feuillet character varying(255),
    genre character varying(255),
    heure_naissance character varying(255),
    images text,
    is_deleted smallint,
    jour_naissance character varying(255),
    jours_des_faits character varying(255),
    lien_de_prarente_avec_le_declarant character varying(255),
    minute_naissance character varying(255),
    mois_naissance character varying(255),
    mois_des_faits character varying(255),
    motif_rejet text,
    nationalite_declarant character varying(255),
    nationalite_mere character varying(255),
    nationalite_pere character varying(255),
    nationalite_du_membre character varying(255),
    nom character varying(255),
    nom_declarant character varying(255),
    nom_mere character varying(255),
    nom_officier character varying(255),
    nom_pere character varying(255),
    numero_acte character varying(255),
    numero_registre character varying(255),
    numero_volet character varying(255),
    pays_de_naissance character varying(255),
    place_de_naissance character varying(255),
    prefecture character varying(255),
    prefecture_de_nais character varying(255),
    prenom_declarant character varying(255),
    prenom_mere character varying(255),
    prenom_offichier character varying(255),
    prenom_pere character varying(255),
    prenoms character varying(255),
    profession_declarant character varying(255),
    profession_mere character varying(255),
    profession_officier character varying(255),
    profession_pere character varying(255),
    rang_naissance character varying(255),
    ravec_id character varying(255),
    region character varying(255),
    secteur character varying(255),
    statut character varying(255) NOT NULL,
    agent_id character varying(255),
    validateur_id character varying(255),
    CONSTRAINT valid_birth_is_delete_check CHECK (((is_delete)::text = ANY ((ARRAY['Yes'::character varying, 'No'::character varying])::text[]))),
    CONSTRAINT valid_birth_is_deleted_check CHECK (((is_deleted >= 0) AND (is_deleted <= 1))),
    CONSTRAINT valid_birth_statut_check CHECK (((statut)::text = ANY ((ARRAY['EN_ATTENTE'::character varying, 'VALIDE'::character varying, 'REJETE'::character varying])::text[])))
);


--
-- Name: ville; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ville (
    id uuid NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    is_delete character varying(255) NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    code character varying(255),
    code_pays character varying(255),
    nom character varying(255),
    pays_id uuid,
    CONSTRAINT ville_is_delete_check CHECK (((is_delete)::text = ANY ((ARRAY['Yes'::character varying, 'No'::character varying])::text[])))
);


--
-- Name: acte_deces acte_deces_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_deces
    ADD CONSTRAINT acte_deces_pkey PRIMARY KEY (id);


--
-- Name: acte_mariage acte_mariage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_mariage
    ADD CONSTRAINT acte_mariage_pkey PRIMARY KEY (id);


--
-- Name: acte_naissance acte_naissance_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_naissance
    ADD CONSTRAINT acte_naissance_pkey PRIMARY KEY (id);


--
-- Name: cause_deces cause_deces_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cause_deces
    ADD CONSTRAINT cause_deces_pkey PRIMARY KEY (id);


--
-- Name: commune commune_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commune
    ADD CONSTRAINT commune_pkey PRIMARY KEY (id);


--
-- Name: document_acte document_acte_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.document_acte
    ADD CONSTRAINT document_acte_pkey PRIMARY KEY (id);


--
-- Name: nationalite nationalite_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nationalite
    ADD CONSTRAINT nationalite_pkey PRIMARY KEY (code);


--
-- Name: pays pays_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pays
    ADD CONSTRAINT pays_pkey PRIMARY KEY (id);


--
-- Name: permission permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- Name: personne personne_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personne
    ADD CONSTRAINT personne_pkey PRIMARY KEY (id);


--
-- Name: prefecture prefecture_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prefecture
    ADD CONSTRAINT prefecture_pkey PRIMARY KEY (id);


--
-- Name: profession profession_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profession
    ADD CONSTRAINT profession_pkey PRIMARY KEY (code);


--
-- Name: quartier quartier_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quartier
    ADD CONSTRAINT quartier_pkey PRIMARY KEY (id);


--
-- Name: region region_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (id);


--
-- Name: role_permission role_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_permission
    ADD CONSTRAINT role_permission_pkey PRIMARY KEY (role_id, permission_id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: type_acte type_acte_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.type_acte
    ADD CONSTRAINT type_acte_pkey PRIMARY KEY (id);


--
-- Name: users uk6dotkott2kjsp8vw4d0m25fb7; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email);


--
-- Name: role uk6u1k6pqq7suwepwcfskympy3s; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT uk6u1k6pqq7suwepwcfskympy3s UNIQUE (nom);


--
-- Name: users uk71vrxovabe8x9tom8xwefi3e7; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk71vrxovabe8x9tom8xwefi3e7 UNIQUE (code);


--
-- Name: type_acte ukgh1fnmgaboi7vmlsyv8yhn7aq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.type_acte
    ADD CONSTRAINT ukgh1fnmgaboi7vmlsyv8yhn7aq UNIQUE (code);


--
-- Name: users ukr43af9ap4edm43mmtq01oddj6; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT ukr43af9ap4edm43mmtq01oddj6 UNIQUE (username);


--
-- Name: permission uks1inbmd8duat28me7n9rwxvwu; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT uks1inbmd8duat28me7n9rwxvwu UNIQUE (nom);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: valid_birth valid_birth_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valid_birth
    ADD CONSTRAINT valid_birth_pkey PRIMARY KEY (id);


--
-- Name: ville ville_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ville
    ADD CONSTRAINT ville_pkey PRIMARY KEY (id);


--
-- Name: acte_deces fk1b6t824mp42858mx3ilc26hor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_deces
    ADD CONSTRAINT fk1b6t824mp42858mx3ilc26hor FOREIGN KEY (commune_id) REFERENCES public.commune(id);


--
-- Name: acte_deces fk1iknrdgcx4iqjiwriuitwj6dr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_deces
    ADD CONSTRAINT fk1iknrdgcx4iqjiwriuitwj6dr FOREIGN KEY (pere_id) REFERENCES public.personne(id);


--
-- Name: quartier fk1y7t5ejlx7xl3n9shhrgjuaa0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quartier
    ADD CONSTRAINT fk1y7t5ejlx7xl3n9shhrgjuaa0 FOREIGN KEY (commune_id) REFERENCES public.commune(id);


--
-- Name: acte_naissance fk28oyd1tjq3l1jcdy6ivi2kjfk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_naissance
    ADD CONSTRAINT fk28oyd1tjq3l1jcdy6ivi2kjfk FOREIGN KEY (agent_id) REFERENCES public.users(id);


--
-- Name: acte_mariage fk2wjxu0jgg2ddg987sc25p7hm3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_mariage
    ADD CONSTRAINT fk2wjxu0jgg2ddg987sc25p7hm3 FOREIGN KEY (epoux_id) REFERENCES public.personne(id);


--
-- Name: acte_mariage fk4eqr3j4jvx5ygqan3ivhs3yj5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_mariage
    ADD CONSTRAINT fk4eqr3j4jvx5ygqan3ivhs3yj5 FOREIGN KEY (commune_id) REFERENCES public.commune(id);


--
-- Name: acte_mariage fk4i97ymi6d6yj789elcbni78yo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_mariage
    ADD CONSTRAINT fk4i97ymi6d6yj789elcbni78yo FOREIGN KEY (temoin2_id) REFERENCES public.personne(id);


--
-- Name: prefecture fk4lk4kcdnemod52qlo0qrrp9r2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prefecture
    ADD CONSTRAINT fk4lk4kcdnemod52qlo0qrrp9r2 FOREIGN KEY (region_id) REFERENCES public.region(id);


--
-- Name: users fk4qu1gr772nnf6ve5af002rwya; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk4qu1gr772nnf6ve5af002rwya FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- Name: ville fk5ak72iyy65hfya4frs9pkprin; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ville
    ADD CONSTRAINT fk5ak72iyy65hfya4frs9pkprin FOREIGN KEY (pays_id) REFERENCES public.pays(id);


--
-- Name: acte_deces fk60topajv5u03o44hy3y1e4cv9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_deces
    ADD CONSTRAINT fk60topajv5u03o44hy3y1e4cv9 FOREIGN KEY (mere_id) REFERENCES public.personne(id);


--
-- Name: acte_naissance fk6cy5ei1ae1re9bb9e70bgn936; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_naissance
    ADD CONSTRAINT fk6cy5ei1ae1re9bb9e70bgn936 FOREIGN KEY (type_acte_id) REFERENCES public.type_acte(id);


--
-- Name: acte_deces fk70v1nrfuki7n5v09r19buvmii; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_deces
    ADD CONSTRAINT fk70v1nrfuki7n5v09r19buvmii FOREIGN KEY (type_acte_id) REFERENCES public.type_acte(id);


--
-- Name: acte_mariage fk76jbwj4l941gwx0p547qcb1le; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_mariage
    ADD CONSTRAINT fk76jbwj4l941gwx0p547qcb1le FOREIGN KEY (temoin1_id) REFERENCES public.personne(id);


--
-- Name: acte_deces fk7a16p0xm3dvxqiykksvdritjp; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_deces
    ADD CONSTRAINT fk7a16p0xm3dvxqiykksvdritjp FOREIGN KEY (defunt_id) REFERENCES public.personne(id);


--
-- Name: acte_deces fk8smr0aa5oyk13u0neq8iamdy9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_deces
    ADD CONSTRAINT fk8smr0aa5oyk13u0neq8iamdy9 FOREIGN KEY (agent_id) REFERENCES public.users(id);


--
-- Name: acte_mariage fk963v4870xx5l7b4y7xwf81eqx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_mariage
    ADD CONSTRAINT fk963v4870xx5l7b4y7xwf81eqx FOREIGN KEY (mere_epouse_id) REFERENCES public.personne(id);


--
-- Name: acte_naissance fk9mjtu15is10y5aaf1p9qs8h8o; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_naissance
    ADD CONSTRAINT fk9mjtu15is10y5aaf1p9qs8h8o FOREIGN KEY (validateur_id) REFERENCES public.users(id);


--
-- Name: document_acte fk9u856g3031pm2n3axeo0773ub; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.document_acte
    ADD CONSTRAINT fk9u856g3031pm2n3axeo0773ub FOREIGN KEY (acte_deces_id) REFERENCES public.acte_deces(id);


--
-- Name: role_permission fka6jx8n8xkesmjmv6jqug6bg68; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_permission
    ADD CONSTRAINT fka6jx8n8xkesmjmv6jqug6bg68 FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- Name: document_acte fkalbxb9qnm6t38u6dahmxhccq5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.document_acte
    ADD CONSTRAINT fkalbxb9qnm6t38u6dahmxhccq5 FOREIGN KEY (acte_naissance_id) REFERENCES public.acte_naissance(id);


--
-- Name: acte_naissance fkbnnsypfq994e0soasvtqhs86e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_naissance
    ADD CONSTRAINT fkbnnsypfq994e0soasvtqhs86e FOREIGN KEY (mere_id) REFERENCES public.personne(id);


--
-- Name: acte_mariage fkc79edlvhc65bc6dyd6eoubg2g; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_mariage
    ADD CONSTRAINT fkc79edlvhc65bc6dyd6eoubg2g FOREIGN KEY (validateur_id) REFERENCES public.users(id);


--
-- Name: role_permission fkf8yllw1ecvwqy3ehyxawqa1qp; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_permission
    ADD CONSTRAINT fkf8yllw1ecvwqy3ehyxawqa1qp FOREIGN KEY (permission_id) REFERENCES public.permission(id);


--
-- Name: acte_mariage fkg3cc5ujv35kr8co92xovwtc6k; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_mariage
    ADD CONSTRAINT fkg3cc5ujv35kr8co92xovwtc6k FOREIGN KEY (agent_id) REFERENCES public.users(id);


--
-- Name: acte_mariage fkhrtn6dqaepc8vwgy2vw55i2xa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_mariage
    ADD CONSTRAINT fkhrtn6dqaepc8vwgy2vw55i2xa FOREIGN KEY (declarant_id) REFERENCES public.personne(id);


--
-- Name: users fki4hdfrxinycelo1adm78s9bhh; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fki4hdfrxinycelo1adm78s9bhh FOREIGN KEY (commune_id) REFERENCES public.commune(id);


--
-- Name: acte_naissance fkjv4p835hqmk2rudtc8hpalv9g; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_naissance
    ADD CONSTRAINT fkjv4p835hqmk2rudtc8hpalv9g FOREIGN KEY (commune_id) REFERENCES public.commune(id);


--
-- Name: acte_naissance fkle7x4t0w4vdig1wmk4jyi9tup; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_naissance
    ADD CONSTRAINT fkle7x4t0w4vdig1wmk4jyi9tup FOREIGN KEY (pere_id) REFERENCES public.personne(id);


--
-- Name: acte_mariage fklpmuencortgomd21va6l6u7ct; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_mariage
    ADD CONSTRAINT fklpmuencortgomd21va6l6u7ct FOREIGN KEY (epouse_id) REFERENCES public.personne(id);


--
-- Name: acte_mariage fklvolkjloaintlrhwhlxw17f72; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_mariage
    ADD CONSTRAINT fklvolkjloaintlrhwhlxw17f72 FOREIGN KEY (pere_epouse_id) REFERENCES public.personne(id);


--
-- Name: commune fkmq0u90gecy9hdlousb6wbun1r; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commune
    ADD CONSTRAINT fkmq0u90gecy9hdlousb6wbun1r FOREIGN KEY (prefecture_id) REFERENCES public.prefecture(id);


--
-- Name: users fknakgjl7c8boaqsc3ifuhmyqrv; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fknakgjl7c8boaqsc3ifuhmyqrv FOREIGN KEY (region_id) REFERENCES public.region(id);


--
-- Name: acte_naissance fko4cp8q3qk1c2yhl9o2pntfp77; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_naissance
    ADD CONSTRAINT fko4cp8q3qk1c2yhl9o2pntfp77 FOREIGN KEY (enfant_id) REFERENCES public.personne(id);


--
-- Name: acte_deces fkpp9rrwss30ctmqsw9ete5osig; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_deces
    ADD CONSTRAINT fkpp9rrwss30ctmqsw9ete5osig FOREIGN KEY (declarant_id) REFERENCES public.personne(id);


--
-- Name: acte_naissance fkqdathguhbluq2cltckjjeuev2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_naissance
    ADD CONSTRAINT fkqdathguhbluq2cltckjjeuev2 FOREIGN KEY (declarant_id) REFERENCES public.personne(id);


--
-- Name: valid_birth fkrsvag9f8hme3ue0368iftiptr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valid_birth
    ADD CONSTRAINT fkrsvag9f8hme3ue0368iftiptr FOREIGN KEY (agent_id) REFERENCES public.users(id);


--
-- Name: acte_deces fkru3djwt5a2t5rwh9ad95lst5i; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_deces
    ADD CONSTRAINT fkru3djwt5a2t5rwh9ad95lst5i FOREIGN KEY (validateur_id) REFERENCES public.users(id);


--
-- Name: valid_birth fks53mdgho66qo3oefighkj25sa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valid_birth
    ADD CONSTRAINT fks53mdgho66qo3oefighkj25sa FOREIGN KEY (validateur_id) REFERENCES public.users(id);


--
-- Name: acte_mariage fkt8j5hbj701vrmolyrkef25tld; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_mariage
    ADD CONSTRAINT fkt8j5hbj701vrmolyrkef25tld FOREIGN KEY (type_acte_id) REFERENCES public.type_acte(id);


--
-- Name: users fktbnrxiksg62jb56iuw2dq26hl; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fktbnrxiksg62jb56iuw2dq26hl FOREIGN KEY (prefecture_id) REFERENCES public.prefecture(id);


--
-- Name: acte_mariage fktcib86ie0t7whsru3nb4wedq4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_mariage
    ADD CONSTRAINT fktcib86ie0t7whsru3nb4wedq4 FOREIGN KEY (pere_epoux_id) REFERENCES public.personne(id);


--
-- Name: acte_mariage fkti8iv2qky36s77oc1vquekaus; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_mariage
    ADD CONSTRAINT fkti8iv2qky36s77oc1vquekaus FOREIGN KEY (mere_epoux_id) REFERENCES public.personne(id);


--
-- Name: acte_deces fkwtdgf1gvpl25evnpvvcwit2n; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acte_deces
    ADD CONSTRAINT fkwtdgf1gvpl25evnpvvcwit2n FOREIGN KEY (conjoint_id) REFERENCES public.personne(id);


--
-- PostgreSQL database dump complete
--

\unrestrict a7FqtIbaNcFj2yuGR5RutcjUFM10rGiPwXBZvLBzZSYBYcp3jPr0JRM7mN8yWcM

