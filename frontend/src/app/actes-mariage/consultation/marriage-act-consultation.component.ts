import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ActeNaissanceService, ActeMariageDetail } from '../../services/acte-naissance.service';
import { ToastService } from '../../services/toast.service';
import { NationaliteService, Nationalite } from '../../services/nationalite.service';
import { GeodataService } from '../../services/geodata.service';
import { ProfessionService, Profession } from '../../services/profession.service';
import { RegionDTO, PrefectureDTO, CommuneDTO } from '../../models/geodata';
import * as QRCode from 'qrcode';

@Component({
  selector: 'app-marriage-act-consultation',
  templateUrl: './marriage-act-consultation.component.html',
  styleUrls: ['./marriage-act-consultation.component.css'],
})
export class MarriageActConsultationComponent implements OnInit {

  acte: ActeMariageDetail | null = null;
  isLoading    = true;
  hasError     = false;
  isValidating = false;

  nationalites: Nationalite[]   = [];
  communes:     CommuneDTO[]    = [];
  professions:  Profession[]    = [];

  qrDataUrl = '';
  activeTab: 'acte' | 'copie' = 'acte';

  constructor(
    private route:          ActivatedRoute,
    private router:         Router,
    private acteService:    ActeNaissanceService,
    private toast:          ToastService,
    private nationaliteSvc: NationaliteService,
    private geodata:        GeodataService,
    private professionSvc:  ProfessionService,
  ) {}

  ngOnInit(): void {
    this.nationaliteSvc.getNationalites().subscribe(d => this.nationalites = d);
    this.geodata.getAllCommunes().subscribe(d => this.communes = d);
    this.professionSvc.getProfessions().subscribe(d => this.professions = d);

    this.route.queryParams.subscribe(params => {
      const id = params['id'];
      if (!id) { this.hasError = true; this.isLoading = false; return; }
      this.acteService.getByIdMariage(id).subscribe({
        next: detail => {
          this.acte = detail;
          this.isLoading = false;
          this.generateQrCode(detail);
        },
        error: () => { this.hasError = true; this.isLoading = false; },
      });
    });
  }

  private generateQrCode(acte: ActeMariageDetail): void {
    const content = [
      acte.id,
      acte.prenomEpoux, acte.nomEpoux,
      acte.prenomEpouse, acte.nomEpouse,
      acte.dateMariage,
      acte.numeroActe,
    ].filter(Boolean).join('|');

    QRCode.toDataURL(content, {
      errorCorrectionLevel: 'M',
      margin: 1,
      width: 120,
      color: { dark: '#000000', light: '#ffffff' },
    }).then(url => { this.qrDataUrl = url; })
      .catch(() => { this.qrDataUrl = ''; });
  }

  setTab(tab: 'acte' | 'copie'): void { this.activeTab = tab; }

  fmtCommune(code: string | undefined | null): string {
    if (!code) return '—';
    const up = code.trim().toUpperCase();
    return this.communes.find(c => c.code?.toUpperCase() === up)?.nom ?? code;
  }

  fmtDate(dateStr: string | undefined | null): string {
    if (!dateStr) return '—';
    try {
      return new Date(dateStr).toLocaleDateString('fr-FR', { day: 'numeric', month: 'long', year: 'numeric' });
    } catch { return dateStr; }
  }

  fmtTypeMariage(t: string | undefined | null): string {
    const map: Record<string, string> = { CIVIL: 'Civil', RELIGIEUX: 'Religieux', COUTUMIER: 'Coutumier' };
    return t ? (map[t] ?? t) : '—';
  }

  fmtRegime(r: string | undefined | null): string {
    const map: Record<string, string> = {
      communaute_biens: 'Communauté des biens',
      separation_biens: 'Séparation des biens',
      polygamie: 'Polygamie',
    };
    return r ? (map[r] ?? r) : '—';
  }

  fmtEtatCivil(e: string | undefined | null): string {
    const map: Record<string, string> = {
      celibataire: 'Célibataire', divorce: 'Divorcé', divorcee: 'Divorcée',
      veuf: 'Veuf', veuve: 'Veuve',
    };
    return e ? (map[e] ?? e) : '—';
  }

  getNatLabel(code: string | undefined | null, sexe: 'M' | 'F' = 'M'): string {
    return this.nationaliteSvc.getLibelle(code, sexe, this.nationalites);
  }

  get isValide(): boolean { return this.acte?.statut === 'VALIDE'; }
  get canValider(): boolean { return this.acte?.statut !== 'VALIDE'; }

  get bannerClass(): string {
    if (this.acte?.statut === 'VALIDE') return 'statut-banner statut-banner--valide';
    if (this.acte?.statut === 'A_CORRIGER') return 'statut-banner statut-banner--corriger';
    return 'statut-banner statut-banner--brouillon';
  }

  get bannerIcon(): string {
    if (this.acte?.statut === 'VALIDE') return 'verified';
    if (this.acte?.statut === 'A_CORRIGER') return 'report_problem';
    return 'edit_note';
  }

  get statutLabel(): string {
    const map: Record<string, string> = {
      VALIDE: 'Acte validé', EN_ATTENTE: 'En attente de validation',
      A_CORRIGER: 'À corriger', EN_COURS_SAISIE: 'En cours de saisie',
    };
    return this.acte?.statut ? (map[this.acte.statut] ?? this.acte.statut) : '';
  }

  get sourceLabel(): string {
    const map: Record<string, string> = { DECLARATION: 'Déclaration', TRANSCRIPTION: 'Transcription' };
    return this.acte?.source ? (map[this.acte.source] ?? this.acte.source) : '';
  }

  retour(): void { this.router.navigate(['/admin/actes/listes']); }

  valider(): void {
    if (!this.acte || this.isValidating) return;
    this.isValidating = true;
    this.acteService.validerMariage(this.acte.id).subscribe({
      next: () => {
        this.isValidating = false;
        this.toast.success('Acte de mariage validé.');
        if (this.acte) this.acte.statut = 'VALIDE';
      },
      error: () => {
        this.isValidating = false;
        this.toast.error('Erreur lors de la validation.');
      },
    });
  }
}
