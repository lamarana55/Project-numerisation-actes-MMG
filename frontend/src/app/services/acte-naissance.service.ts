import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

export type TypeCreation = 'DECLARATION' | 'TRANSCRIPTION';
export type ActionFaire  = 'en_cours_saisie' | 'a_corriger' | 'a_valider';

export interface ActeNaissanceDTO {
  // ── Type ──────────────────────────────────────────────
  typeCreation?: TypeCreation;

  // ── Jugement (transcription) ───────────────────────────
  dateJugement?:   string | null;
  numeroJugement?: string;
  tribunal?:       string;

  // ── Enfant ────────────────────────────────────────────
  prenom?:              string;
  nom?:                 string;
  sexe?:                string;
  dateNaissance?:       string | null;
  heureNaissance?:      string;
  paysNaissance?:       string;
  regionNaissance?:     string;
  prefectureNaissance?: string;
  communeNaissance?:    string;
  quartier?:            string;
  villeNaissance?:      string;
  lieuAccouchement?:    string;
  formationSanitaire?:  string;
  adresseLieu?:         string;

  // ── Naissance (déclaration) ────────────────────────────
  naissanceMultiple?:     string;
  typeNaissanceMultiple?: string;
  rangEnfant?:            number | null;
  rangNaissanceMere?:     number | null;

  // ── Père ──────────────────────────────────────────────
  npiPere?:                 string;
  pereConnu?:               string;
  pereDecede?:              string;
  prenomPere?:              string;
  nomPere?:                 string;
  dateNaissancePere?:       string | null;
  paysNaissancePere?:       string;
  regionNaissancePere?:     string;
  prefectureNaissancePere?: string;
  communeNaissancePere?:    string;
  quartierNaissancePere?:   string;
  villeNaissancePere?:      string;
  nationalitePere?:         string;
  professionPere?:          string;
  telephonePere?:           string;
  situationMatrimPere?:     string;
  adressePere?:             string;
  paysResidencePere?:       string;
  regionDomicilePere?:      string;
  prefectureDomicilePere?:  string;
  communeDomicilePere?:     string;
  quartierDomicilePere?:    string;

  // ── Mère ──────────────────────────────────────────────
  npiMere?:                  string;
  mereConnue?:               string;
  mereDecedee?:              string;
  prenomMere?:               string;
  nomMere?:                  string;
  dateNaissanceMere?:        string | null;
  paysNaissanceMere?:        string;
  regionNaissanceMere?:      string;
  prefectureNaissanceMere?:  string;
  communeNaissanceMere?:     string;
  quartierNaissanceMere?:    string;
  villeNaissanceMere?:       string;
  nationaliteMere?:          string;
  professionMere?:           string;
  telephoneMere?:            string;
  situationMatrimMere?:      string;
  memeDomicileQuePere?:      string;
  adresseMere?:              string;
  paysResidenceMere?:        string;
  regionDomicileMere?:       string;
  prefectureDomicileMere?:   string;
  communeDomicileMere?:      string;
  quartierDomicileMere?:     string;
  parentsMaries?:            string;
  documentMariage?:          string;
  numeroActeMariage?:        string;
  dateMariage?:              string | null;
  communeMariage?:           string;

  // ── Déclarant (déclaration) ────────────────────────────
  npiDeclarant?:          string;
  qualiteDeclarant?:      string;
  dateDeclaration?:       string | null;
  prenomDeclarant?:       string;
  nomDeclarant?:          string;
  sexeDeclarant?:         string;
  telephoneDeclarant?:    string;
  signatureDeclarant?:    string;
  raisonNonSignature?:    string;

  // ── Acte / Inscription ────────────────────────────────
  dateInscription?:  string | null;
  heureInscription?: string;
  dateDressage?:     string | null;
  heureDressage?:    string;
  pointCollecte?:    string;
  actionsFaire?:     ActionFaire;
}

export interface ActeNaissanceSearchParams {
  nom?:        string;
  prenom?:     string;
  npi?:        string;
  numero?:     string;
  typeActe?:   string;
  typeCreation?: string;
  dateDebut?:  string;
  dateFin?:    string;
  page?:       number;
  size?:       number;
}

export interface ActeNaissancePage {
  content:          ActeNaissanceSummary[];
  totalElements:    number;
  totalPages:       number;
  size:             number;
  number:           number;
  numberOfElements: number;
  first:            boolean;
  last:             boolean;
  empty:            boolean;
}

export interface ActeNaissanceSummary {
  id:               string;
  typeCreation?:    TypeCreation | string;
  source?:          string;   // 'FORMULAIRE' | 'NUMERISATION' | 'INDEXATION'
  typeActe?:        string;   // 'naissance' | 'deces'
  prenom?:          string;
  nom?:             string;
  sexe?:            string;
  dateNaissance?:   string;
  prenomPere?:      string;
  nomPere?:         string;
  prenomMere?:      string;
  nomMere?:         string;
  dateInscription?: string;
  dateDressage?:    string;
  actionsFaire?:    ActionFaire;
  statut?:          string;
  numeroActe?:      string;
  commune?:         string;
  agentNomComplet?: string;
  createdAt?:       string;
  npi?:             string;
}

// ══════════════════════════════════════════════════════════════════
//  DÉCÈS — DTOs
// ══════════════════════════════════════════════════════════════════

export interface ActeDecesDTO {
  // Jugement (transcription)
  dateJugement?:   string | null;
  numeroJugement?: string;
  tribunal?:       string;
  // Notification
  numeroNotification?: string;
  // Défunt
  hasNpi?:             string;
  npiDefunt?:          string;
  prenom?:             string;
  nom?:                string;
  sexe?:               string;
  dateNaissance?:      string | null;
  communeNaissance?:   string;
  nationaliteConnue?:  string;
  nationalite?:        string;
  profession?:         string;
  // Domicile du défunt
  adresseDomicile?:    string;
  communeDomicile?:    string;
  quartierDomicile?:   string;
  secteurDomicile?:    string;
  // Parents — Père
  pereDecede?:          string;
  pereHasNpi?:          string;
  npiPere?:             string;
  prenomPere?:          string;
  nomPere?:             string;
  dateNaissancePere?:   string | null;
  communeNaissancePere?: string;
  pereNationaliteConnue?: string;
  nationalitePere?:     string;
  professionPere?:      string;
  telephonePere?:       string;
  etatCivilPere?:       string;
  adresseDomicilePere?:  string;
  communeDomicilePere?:  string;
  quartierDomicilePere?: string;
  secteurDomicilePere?:  string;
  // Parents — Mère
  mereDecedee?:          string;
  mereHasNpi?:           string;
  npiMere?:              string;
  prenomMere?:           string;
  nomMere?:              string;
  dateNaissanceMere?:    string | null;
  communeNaissanceMere?: string;
  mereNationaliteConnue?: string;
  nationaliteMere?:      string;
  professionMere?:       string;
  telephoneMere?:        string;
  etatCivilMere?:        string;
  memeDomicilePere?:     string;
  adresseDomicileMere?:  string;
  communeDomicileMere?:  string;
  quartierDomicileMere?: string;
  secteurDomicileMere?:  string;
  // Décès
  dateDecesConnue?:    string;
  dateDeces?:          string | null;
  heureDeces?:         string;
  decesAuDomicile?:    string;
  endroitDeces?:       string;
  communeDeces?:       string;
  lieuDeces?:          string;
  causeDeces?:         string;
  // Conjoints
  situationMatrimoniale?: string;
  prenomConjoint?:      string;
  nomConjoint?:         string;
  nationaliteConjoint?: string;
  professionConjoint?:  string;
  // Déclarant
  hasNpiDeclarant?:          string;
  npiDeclarant?:             string;
  prenomDeclarant?:          string;
  nomDeclarant?:             string;
  sexeDeclarant?:            string;
  dateNaissanceDeclarant?:   string | null;
  communeNaissanceDeclarant?: string;
  nationaliteDeclarant?:     string;
  professionDeclarant?:      string;
  adresseDeclarant?:         string;
  communeDomicileDeclarant?: string;
  quartierDeclarant?:        string;
  secteurDeclarant?:         string;
  lienParente?:              string;
  telephoneDeclarant?:       string;
  situationMatrimDeclarant?: string;
  dateDeclaration?:          string | null;
  signatureDeclarant?:       string;
  raisonNonSignature?:       string;
  // Acte
  pointCollecte?: string;
  dateDressage?:  string | null;
  heureDressage?: string;
  actionsFaire?:  ActionFaire;
}

export interface ActeDecesDetail {
  id:                   string;
  source?:              string;
  typeActe?:            string;
  statut?:              string;
  actionsFaire?:        string;
  numeroActe?:          string;
  anneeRegistre?:       string;
  // Notification
  numeroNotification?:  string;
  // Défunt
  hasNpi?:              string;
  npiDefunt?:           string;
  prenom?:              string;
  nom?:                 string;
  sexe?:                string;
  dateNaissance?:       string;
  communeNaissance?:    string;
  nationaliteConnue?:   string;
  nationalite?:         string;
  profession?:          string;
  adresseDomicile?:     string;
  communeDomicile?:     string;
  quartierDomicile?:    string;
  secteurDomicile?:     string;
  // Parents — Père
  pereDecede?:           string;
  pereHasNpi?:           string;
  npiPere?:              string;
  prenomPere?:           string;
  nomPere?:              string;
  dateNaissancePere?:    string;
  communeNaissancePere?: string;
  pereNationaliteConnue?: string;
  nationalitePere?:      string;
  professionPere?:       string;
  telephonePere?:        string;
  etatCivilPere?:        string;
  adresseDomicilePere?:  string;
  communeDomicilePere?:  string;
  quartierDomicilePere?: string;
  secteurDomicilePere?:  string;
  // Parents — Mère
  mereDecedee?:          string;
  mereHasNpi?:           string;
  npiMere?:              string;
  prenomMere?:           string;
  nomMere?:              string;
  dateNaissanceMere?:    string;
  communeNaissanceMere?: string;
  mereNationaliteConnue?: string;
  nationaliteMere?:      string;
  professionMere?:       string;
  telephoneMere?:        string;
  etatCivilMere?:        string;
  memeDomicilePere?:     string;
  adresseDomicileMere?:  string;
  communeDomicileMere?:  string;
  quartierDomicileMere?: string;
  secteurDomicileMere?:  string;
  // Décès
  dateDecesConnue?:     string;
  dateDeces?:           string;
  heureDeces?:          string;
  decesAuDomicile?:     string;
  endroitDeces?:        string;
  communeDeces?:        string;
  lieuDeces?:           string;
  causeDeces?:          string;
  // Conjoints
  situationMatrimoniale?: string;
  prenomConjoint?:       string;
  nomConjoint?:          string;
  nationaliteConjoint?:  string;
  professionConjoint?:   string;
  // Déclarant
  hasNpiDeclarant?:           string;
  npiDeclarant?:              string;
  prenomDeclarant?:           string;
  nomDeclarant?:              string;
  sexeDeclarant?:             string;
  dateNaissanceDeclarant?:    string;
  communeNaissanceDeclarant?: string;
  nationaliteDeclarant?:      string;
  professionDeclarant?:       string;
  adresseDeclarant?:          string;
  communeDomicileDeclarant?:  string;
  quartierDeclarant?:         string;
  secteurDeclarant?:          string;
  lienParente?:               string;
  telephoneDeclarant?:        string;
  situationMatrimDeclarant?:  string;
  dateDeclaration?:           string;
  signatureDeclarant?:        string;
  raisonNonSignature?:        string;
  // Acte
  pointCollecte?:       string;
  dateDressage?:        string;
  heureDressage?:       string;
  // Transcription
  tribunal?:            string;
  numeroJugement?:      string;
  dateJugement?:        string;
  // Méta
  commune?:             string;
  agentNomComplet?:     string;
  validateurNomComplet?: string;
  createdAt?:           string;
}

/** DTO complet pour la consultation / modification d'un acte de naissance */
export interface ActeNaissanceDetail {
  id:                       string;
  source?:                  string;
  typeActe?:                string;
  statut?:                  string;
  actionsFaire?:            string;
  numeroActe?:              string;
  anneeRegistre?:           string;
  feuillet?:                string;
  numeroVolume?:            string;
  // Enfant
  prenom?:                  string;
  nom?:                     string;
  sexe?:                    string;
  dateNaissance?:           string;
  heureNaissance?:          string;
  npiEnfant?:               string;
  paysNaissance?:           string;
  regionNaissance?:         string;
  prefectureNaissance?:     string;
  communeNaissance?:        string;
  quartierNaissance?:       string;
  villeNaissance?:          string;
  lieuAccouchement?:        string;
  formationSanitaire?:      string;
  adresseLieu?:             string;
  naissanceMultiple?:       string;
  typeNaissanceMultiple?:   string;
  rangEnfant?:              number;
  rangNaissanceMere?:       number;
  // Père
  pereConnu?:               string;
  pereDecede?:              string;
  prenomPere?:              string;
  nomPere?:                 string;
  dateNaissancePere?:       string;
  npiPere?:                 string;
  paysNaissancePere?:       string;
  regionNaissancePere?:     string;
  prefectureNaissancePere?: string;
  communeNaissancePere?:    string;
  quartierNaissancePere?:   string;
  villeNaissancePere?:      string;
  nationalitePere?:         string;
  professionPere?:          string;
  telephonePere?:           string;
  situationMatrimPere?:     string;
  adressePere?:             string;
  paysResidencePere?:       string;
  regionDomicilePere?:      string;
  prefectureDomicilePere?:  string;
  communeDomicilePere?:     string;
  quartierDomicilePere?:    string;
  // Mère
  mereConnue?:              string;
  mereDecedee?:             string;
  prenomMere?:              string;
  nomMere?:                 string;
  dateNaissanceMere?:       string;
  npiMere?:                 string;
  paysNaissanceMere?:       string;
  regionNaissanceMere?:     string;
  prefectureNaissanceMere?: string;
  communeNaissanceMere?:    string;
  quartierNaissanceMere?:   string;
  villeNaissanceMere?:      string;
  nationaliteMere?:         string;
  professionMere?:          string;
  telephoneMere?:           string;
  situationMatrimMere?:     string;
  memeDomicileQuePere?:     string;
  adresseMere?:             string;
  paysResidenceMere?:       string;
  regionDomicileMere?:      string;
  prefectureDomicileMere?:  string;
  communeDomicileMere?:     string;
  quartierDomicileMere?:    string;
  parentsMaries?:           string;
  documentMariage?:         string;
  numeroActeMariage?:       string;
  dateMariage?:             string;
  communeMariage?:          string;
  // Déclarant
  qualiteDeclarant?:        string;
  dateDeclaration?:         string;
  prenomDeclarant?:         string;
  nomDeclarant?:            string;
  sexeDeclarant?:           string;
  telephoneDeclarant?:      string;
  signatureDeclarant?:      string;
  raisonNonSignature?:      string;
  // Transcription
  dateJugement?:            string;
  numeroJugement?:          string;
  tribunal?:                string;
  // Inscription
  dateInscription?:         string;
  heureInscription?:        string;
  dateDressage?:            string;
  heureDressage?:           string;
  pointCollecte?:           string;
  // Méta
  commune?:                 string;
  agentNomComplet?:         string;
  validateurNomComplet?:    string;
  createdAt?:               string;
}

// ══════════════════════════════════════════════════════════════════
//  MARIAGE — DTOs
// ══════════════════════════════════════════════════════════════════

export interface ActeMariageDTO {
  typeMariage?:      string;
  dateMariage?:      string | null;
  heureMariage?:     string;
  communeMariage?:   string;
  lieuMariage?:      string;
  regimeMatrimonial?: string;
  // Époux
  npiEpoux?:          string;
  prenomEpoux?:       string;
  nomEpoux?:          string;
  dateNaissanceEpoux?: string | null;
  communeNaissanceEpoux?: string;
  nationaliteEpoux?:  string;
  professionEpoux?:   string;
  telephoneEpoux?:    string;
  etatCivilAntEpoux?: string;
  adresseEpoux?:      string;
  communeDomicileEpoux?:  string;
  quartierDomicileEpoux?: string;
  // Parents époux
  prenomPereEpoux?:       string;
  nomPereEpoux?:          string;
  professionPereEpoux?:   string;
  nationalitePereEpoux?:  string;
  prenomMereEpoux?:       string;
  nomMereEpoux?:          string;
  professionMereEpoux?:   string;
  nationaliteMereEpoux?:  string;
  // Épouse
  npiEpouse?:          string;
  prenomEpouse?:       string;
  nomEpouse?:          string;
  dateNaissanceEpouse?: string | null;
  communeNaissanceEpouse?: string;
  nationaliteEpouse?:  string;
  professionEpouse?:   string;
  telephoneEpouse?:    string;
  etatCivilAntEpouse?: string;
  adresseEpouse?:      string;
  communeDomicileEpouse?:  string;
  quartierDomicileEpouse?: string;
  // Parents épouse
  prenomPereEpouse?:      string;
  nomPereEpouse?:         string;
  professionPereEpouse?:  string;
  nationalitePereEpouse?: string;
  prenomMereEpouse?:      string;
  nomMereEpouse?:         string;
  professionMereEpouse?:  string;
  nationaliteMereEpouse?: string;
  // Témoin 1
  npiTemoin1?:        string;
  prenomTemoin1?:     string;
  nomTemoin1?:        string;
  sexeTemoin1?:       string;
  professionTemoin1?: string;
  telephoneTemoin1?:  string;
  adresseTemoin1?:    string;
  // Témoin 2
  npiTemoin2?:        string;
  prenomTemoin2?:     string;
  nomTemoin2?:        string;
  sexeTemoin2?:       string;
  professionTemoin2?: string;
  telephoneTemoin2?:  string;
  adresseTemoin2?:    string;
  // Officier / Déclarant
  prenomDeclarant?:    string;
  nomDeclarant?:       string;
  qualiteDeclarant?:   string;
  dateDeclaration?:    string | null;
  signatureDeclarant?: string;
  // Inscription
  pointCollecte?:  string;
  dateDressage?:   string | null;
  heureDressage?:  string;
  actionsFaire?:   ActionFaire;
}

export interface ActeMariageDetail {
  id:                  string;
  source?:             string;
  typeActe?:           string;
  statut?:             string;
  actionsFaire?:       string;
  numeroActe?:         string;
  anneeRegistre?:      string;
  feuillet?:           string;
  // Mariage
  dateMariage?:        string;
  heureMariage?:       string;
  typeMariage?:        string;
  lieuMariage?:        string;
  regimeMatrimonial?:  string;
  etatCivilAntEpoux?:  string;
  etatCivilAntEpouse?: string;
  // Époux
  npiEpoux?:           string;
  prenomEpoux?:        string;
  nomEpoux?:           string;
  dateNaissanceEpoux?: string;
  communeNaissanceEpoux?: string;
  nationaliteEpoux?:   string;
  professionEpoux?:    string;
  telephoneEpoux?:     string;
  adresseEpoux?:       string;
  communeDomicileEpoux?:  string;
  quartierDomicileEpoux?: string;
  // Parents époux
  prenomPereEpoux?:       string;
  nomPereEpoux?:          string;
  professionPereEpoux?:   string;
  nationalitePereEpoux?:  string;
  prenomMereEpoux?:       string;
  nomMereEpoux?:          string;
  professionMereEpoux?:   string;
  nationaliteMereEpoux?:  string;
  // Épouse
  npiEpouse?:          string;
  prenomEpouse?:       string;
  nomEpouse?:          string;
  dateNaissanceEpouse?: string;
  communeNaissanceEpouse?: string;
  nationaliteEpouse?:  string;
  professionEpouse?:   string;
  telephoneEpouse?:    string;
  adresseEpouse?:      string;
  communeDomicileEpouse?:  string;
  quartierDomicileEpouse?: string;
  // Parents épouse
  prenomPereEpouse?:      string;
  nomPereEpouse?:         string;
  professionPereEpouse?:  string;
  nationalitePereEpouse?: string;
  prenomMereEpouse?:      string;
  nomMereEpouse?:         string;
  professionMereEpouse?:  string;
  nationaliteMereEpouse?: string;
  // Témoin 1
  npiTemoin1?:         string;
  prenomTemoin1?:      string;
  nomTemoin1?:         string;
  sexeTemoin1?:        string;
  professionTemoin1?:  string;
  telephoneTemoin1?:   string;
  adresseTemoin1?:     string;
  // Témoin 2
  npiTemoin2?:         string;
  prenomTemoin2?:      string;
  nomTemoin2?:         string;
  sexeTemoin2?:        string;
  professionTemoin2?:  string;
  telephoneTemoin2?:   string;
  adresseTemoin2?:     string;
  // Déclarant
  prenomDeclarant?:    string;
  nomDeclarant?:       string;
  dateDeclaration?:    string;
  signatureDeclarant?: string;
  // Inscription
  dateDressage?:       string;
  heureDressage?:      string;
  pointCollecte?:      string;
  // Méta
  commune?:            string;
  agentNomComplet?:    string;
  validateurNomComplet?: string;
  createdAt?:          string;
}

@Injectable({ providedIn: 'root' })
export class ActeNaissanceService {
  private readonly base   = `${environment.apiURL}/actes/naissance`;
  private readonly global = `${environment.apiURL}/actes`;

  constructor(private http: HttpClient) {}

  /** Enregistrer une déclaration dans les délais */
  createDeclaration(payload: ActeNaissanceDTO): Observable<ActeNaissanceSummary> {
    return this.http.post<ActeNaissanceSummary>(`${this.base}`, {
      ...payload,
      typeCreation: 'DECLARATION',
    });
  }

  /** Enregistrer une transcription de jugement supplétif */
  createTranscription(payload: ActeNaissanceDTO): Observable<ActeNaissanceSummary> {
    return this.http.post<ActeNaissanceSummary>(`${this.base}/transcription`, {
      ...payload,
      typeCreation: 'TRANSCRIPTION',
    });
  }

  /** Rechercher/lister les actes de naissance (formulaire) */
  search(params: ActeNaissanceSearchParams = {}): Observable<ActeNaissancePage> {
    return this.http.get<ActeNaissancePage>(this.base, { params: this.buildParams(params) });
  }

  /**
   * Lister TOUS les actes (numérisés + indexés + formulaire).
   * Endpoint global : GET /actes
   */
  searchAll(params: ActeNaissanceSearchParams = {}): Observable<ActeNaissancePage> {
    return this.http.get<ActeNaissancePage>(this.global, { params: this.buildParams(params) });
  }

  /** Consulter le détail complet d'un acte de naissance */
  getByIdNaissance(id: string): Observable<ActeNaissanceDetail> {
    return this.http.get<ActeNaissanceDetail>(`${this.base}/${id}`);
  }

  /** Mettre à jour un acte de naissance */
  updateNaissance(id: string, payload: ActeNaissanceDTO): Observable<ActeNaissanceSummary> {
    return this.http.put<ActeNaissanceSummary>(`${this.base}/${id}`, payload);
  }

  /** Valider un acte de naissance */
  validerNaissance(id: string): Observable<ActeNaissanceSummary> {
    return this.http.put<ActeNaissanceSummary>(`${this.base}/${id}/valider`, {});
  }

  /** Télécharger le PDF copie intégrale d'un acte de naissance */
  downloadPdfNaissance(id: string): Observable<Blob> {
    return this.http.get(`${this.base}/${id}/pdf`, { responseType: 'blob' });
  }

  /** Télécharger le PDF copie intégrale d'un acte de décès */
  downloadPdfDeces(id: string): Observable<Blob> {
    return this.http.get(`${environment.apiURL}/actes/deces/${id}/pdf`, { responseType: 'blob' });
  }

  /** Supprimer logiquement un acte de naissance */
  deleteNaissance(id: string): Observable<void> {
    return this.http.delete<void>(`${this.base}/${id}`);
  }

  /** Supprimer logiquement un acte de décès */
  deleteDeces(id: string): Observable<void> {
    return this.http.delete<void>(`${environment.apiURL}/actes/deces/${id}`);
  }

  /** Enregistrer une déclaration de décès */
  createDeclarationDeces(payload: ActeDecesDTO): Observable<ActeNaissanceSummary> {
    return this.http.post<ActeNaissanceSummary>(`${environment.apiURL}/actes/deces`, {
      ...payload,
      typeCreation: 'DECLARATION',
    });
  }

  /** Consulter le détail complet d'un acte de décès */
  getByIdDeces(id: string): Observable<ActeDecesDetail> {
    return this.http.get<ActeDecesDetail>(`${environment.apiURL}/actes/deces/${id}`);
  }

  /** Valider un acte de décès */
  validerDeces(id: string): Observable<ActeNaissanceSummary> {
    return this.http.put<ActeNaissanceSummary>(`${environment.apiURL}/actes/deces/${id}/valider`, {});
  }

  /** Mettre à jour un acte de décès */
  updateDeces(id: string, payload: ActeDecesDTO): Observable<ActeNaissanceSummary> {
    return this.http.put<ActeNaissanceSummary>(`${environment.apiURL}/actes/deces/${id}`, payload);
  }

  /** Enregistrer une transcription de jugement supplétif de décès */
  createTranscriptionDeces(payload: ActeDecesDTO): Observable<ActeNaissanceSummary> {
    return this.http.post<ActeNaissanceSummary>(`${environment.apiURL}/actes/deces/transcription`, {
      ...payload,
      typeCreation: 'TRANSCRIPTION',
    });
  }

  /** Enregistrer une déclaration de mariage */
  createDeclarationMariage(payload: ActeMariageDTO): Observable<ActeNaissanceSummary> {
    return this.http.post<ActeNaissanceSummary>(`${environment.apiURL}/actes/mariage`, {
      ...payload,
      typeCreation: 'DECLARATION',
    });
  }

  /** Consulter le détail complet d'un acte de mariage */
  getByIdMariage(id: string): Observable<ActeMariageDetail> {
    return this.http.get<ActeMariageDetail>(`${environment.apiURL}/actes/mariage/${id}`);
  }

  /** Valider un acte de mariage */
  validerMariage(id: string): Observable<ActeNaissanceSummary> {
    return this.http.put<ActeNaissanceSummary>(`${environment.apiURL}/actes/mariage/${id}/valider`, {});
  }

  /** Supprimer logiquement un acte de mariage */
  deleteMariage(id: string): Observable<void> {
    return this.http.delete<void>(`${environment.apiURL}/actes/mariage/${id}`);
  }

  private buildParams(params: ActeNaissanceSearchParams): HttpParams {
    let hp = new HttpParams();
    if (params.nom)          hp = hp.set('nom',          params.nom);
    if (params.prenom)       hp = hp.set('prenom',        params.prenom);
    if (params.npi)          hp = hp.set('npi',           params.npi);
    if (params.numero)       hp = hp.set('numero',        params.numero);
    if (params.typeActe)     hp = hp.set('typeActe',      params.typeActe);
    if (params.typeCreation) hp = hp.set('typeCreation',  params.typeCreation);
    if (params.dateDebut)    hp = hp.set('dateDebut',     params.dateDebut);
    if (params.dateFin)      hp = hp.set('dateFin',       params.dateFin);
    hp = hp.set('page', String(params.page ?? 0));
    hp = hp.set('size', String(params.size ?? 25));
    return hp;
  }
}
