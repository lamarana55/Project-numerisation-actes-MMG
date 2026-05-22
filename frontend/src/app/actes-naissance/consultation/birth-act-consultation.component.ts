import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ActeNaissanceService, ActeNaissanceDetail } from '../../services/acte-naissance.service';
import { ToastService } from '../../services/toast.service';
import { NationaliteService, Nationalite } from '../../services/nationalite.service';
import { GeodataService } from '../../services/geodata.service';
import { ProfessionService, Profession } from '../../services/profession.service';
import { RegionDTO, PrefectureDTO, CommuneDTO, PaysDTO } from '../../models/geodata';
import * as QRCode from 'qrcode';

@Component({
  selector: 'app-birth-act-consultation',
  templateUrl: './birth-act-consultation.component.html',
  styleUrls: ['./birth-act-consultation.component.css'],
})
export class BirthActConsultationComponent implements OnInit {

  acte: ActeNaissanceDetail | null = null;
  isLoading    = true;
  hasError     = false;
  isValidating = false;

  nationalites: Nationalite[]  = [];
  regions:      RegionDTO[]    = [];
  prefectures:  PrefectureDTO[] = [];
  communes:     CommuneDTO[]   = [];
  pays:         PaysDTO[]      = [];
  professions:  Profession[]   = [];

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
    this.geodata.getAllRegions().subscribe(d => this.regions = d);
    this.geodata.getAllPrefectures().subscribe(d => this.prefectures = d);
    this.geodata.getAllCommunes().subscribe(d => this.communes = d);
    this.geodata.getAllPays().subscribe(d => this.pays = d);
    this.professionSvc.getProfessions().subscribe(d => this.professions = d);

    this.route.queryParams.subscribe(params => {
      const id = params['id'];
      if (!id) { this.hasError = true; this.isLoading = false; return; }
      this.acteService.getByIdNaissance(id).subscribe({
        next: detail => {
          this.acte = detail;
          this.isLoading = false;
          this.generateQrCode(detail);
        },
        error: () => { this.hasError = true; this.isLoading = false; },
      });
    });
  }

  private generateQrCode(acte: ActeNaissanceDetail): void {
    const content = [
      acte.npiEnfant || acte.id,
      acte.prenom, acte.nom,
      acte.dateNaissance,
      acte.numeroActe,
      acte.anneeRegistre,
    ].filter(Boolean).join('|');

    QRCode.toDataURL(content, {
      errorCorrectionLevel: 'M',
      margin: 1,
      width: 120,
      color: { dark: '#000000', light: '#ffffff' },
    }).then(url => { this.qrDataUrl = url; })
      .catch(() => { this.qrDataUrl = ''; });
  }

  setTab(tab: 'acte' | 'copie'): void {
    this.activeTab = tab;
  }

  /* ── Résolution codes → noms ──────────────────────────────── */
  fmtRegion(code: string | undefined | null): string {
    if (!code) return '—';
    const up = code.trim().toUpperCase();
    return this.regions.find(r => r.code?.toUpperCase() === up)?.nom ?? code;
  }

  fmtPrefecture(code: string | undefined | null): string {
    if (!code) return '—';
    const up = code.trim().toUpperCase();
    return this.prefectures.find(p => p.code?.toUpperCase() === up)?.nom ?? code;
  }

  fmtCommune(code: string | undefined | null): string {
    if (!code) return '—';
    const up = code.trim().toUpperCase();
    return this.communes.find(c => c.code?.toUpperCase() === up)?.nom ?? code;
  }

  fmtPays(code: string | undefined | null): string {
    if (!code) return '—';
    const up = code.trim().toUpperCase();
    return this.pays.find(p => p.code?.toUpperCase() === up)?.nom ?? code;
  }

  fmtProfession(value: string | undefined | null, sexe: 'M' | 'F' = 'M'): string {
    if (!value) return '—';
    const num = parseInt(value, 10);
    if (!isNaN(num) && this.professions.length) {
      const found = this.professions.find(p => p.code === num);
      if (found) return sexe === 'F' ? found.feminin : found.masculin;
    }
    return value;
  }

  private isGuinee(paysCode?: string|null): boolean {
    return !paysCode || paysCode.trim().toUpperCase() === 'GIN';
  }

  /* Lieu de naissance de l'enfant : quartier+commune+préfecture+pays si Guinée, ville+pays si étranger */
  fmtLieuNaissance(quartier?: string|null, commune?: string|null, prefecture?: string|null, paysCode?: string|null, ville?: string|null): string {
    if (this.isGuinee(paysCode)) {
      const parts = [
        quartier   ? this.fmt(quartier)            : null,
        commune    ? this.fmtCommune(commune)       : null,
        prefecture ? this.fmtPrefecture(prefecture) : null,
        paysCode   ? this.fmtPays(paysCode)         : null,
      ];
      return parts.filter(p => p && p !== '—').join(', ') || '—';
    }
    const parts = [
      ville    ? this.fmt(ville)         : null,
      paysCode ? this.fmtPays(paysCode)  : null,
    ];
    return parts.filter(p => p && p !== '—').join(', ') || '—';
  }

  /* Lieu de naissance d'un parent : commune + préfecture */
  fmtLieuParent(commune?: string|null, prefecture?: string|null): string {
    const parts = [
      commune    ? this.fmtCommune(commune)       : null,
      prefecture ? this.fmtPrefecture(prefecture) : null,
    ];
    return parts.filter(p => p && p !== '—').join(', ') || '—';
  }

  /* Domicile : quartier+commune+préfecture (toujours local) */
  fmtLieu(quartier?: string|null, commune?: string|null, prefecture?: string|null): string {
    const parts = [
      quartier   ? this.fmt(quartier)            : null,
      commune    ? this.fmtCommune(commune)       : null,
      prefecture ? this.fmtPrefecture(prefecture) : null,
    ];
    return parts.filter(p => p && p !== '—').join(', ') || '—';
  }

  getNatLabel(code: string | undefined | null, sexe: 'M' | 'F' = 'F'): string {
    return this.nationaliteSvc.getLibelle(code, sexe, this.nationalites);
  }

  /* ── Statut ───────────────────────────────────────────────── */
  get isValide(): boolean    { return this.acte?.statut === 'VALIDE'; }
  get canValider(): boolean  {
    const af = (this.acte?.actionsFaire ?? '').toUpperCase();
    return af === 'A_VALIDER';
  }

  get statutLabel(): string {
    const s  = (this.acte?.statut       ?? '').toUpperCase();
    const af = (this.acte?.actionsFaire ?? '').toUpperCase();
    if (s === 'VALIDE') return 'Validé';
    if (s === 'REJETE') return 'Rejeté';
    const m: Record<string, string> = {
      EN_COURS_SAISIE: 'En cours de saisie',
      A_CORRIGER: 'À corriger',
      A_VALIDER:  'Brouillon',
      EN_ATTENTE: 'Brouillon',
    };
    return m[af] || m[s] || s || '—';
  }

  get bannerClass(): string {
    const s  = (this.acte?.statut       ?? '').toUpperCase();
    const af = (this.acte?.actionsFaire ?? '').toUpperCase();
    if (s === 'VALIDE') return 'statut-banner statut-banner--valide';
    if (s === 'REJETE' || af === 'A_CORRIGER') return 'statut-banner statut-banner--corriger';
    return 'statut-banner statut-banner--brouillon';
  }

  get bannerIcon(): string {
    const s  = (this.acte?.statut       ?? '').toUpperCase();
    const af = (this.acte?.actionsFaire ?? '').toUpperCase();
    if (s === 'VALIDE') return 'verified';
    if (s === 'REJETE' || af === 'A_CORRIGER') return 'cancel';
    return 'draft';
  }

  get sourceLabel(): string {
    const map: Record<string, string> = {
      DECLARATION:   'Déclaration dans les délais',
      TRANSCRIPTION: 'Transcription jugement supplétif',
      NUMERISATION:  'Numérisation',
      INDEXATION:    'Indexation',
    };
    return map[this.acte?.source ?? ''] || this.acte?.source || '—';
  }

  /* ── Actions ──────────────────────────────────────────────── */
  valider(): void {
    if (!this.acte || this.isValidating) return;
    this.isValidating = true;
    this.acteService.validerNaissance(this.acte.id).subscribe({
      next: () => {
        this.isValidating = false;
        if (this.acte) this.acte.statut = 'VALIDE';
        this.toast.success('Acte de naissance validé avec succès.');
      },
      error: () => {
        this.isValidating = false;
        this.toast.error('Impossible de valider l\'acte. Veuillez réessayer.');
      },
    });
  }

  async telechargerPdf(): Promise<void> {
    if (!this.acte) return;

    const prevTab = this.activeTab;
    this.activeTab = 'copie';
    await new Promise(r => setTimeout(r, 300));

    const docEl = document.querySelector('.acte-document') as HTMLElement | null;
    if (!docEl) { this.activeTab = prevTab; return; }

    // Charger les images en base64 pour les intégrer dans le CSS
    const imgPaths = [
      '/assets/armoiries_guinee.png',
      '/assets/images/gn.png',
      '/assets/filigrane.png',
    ];
    const imgMap: Record<string, string> = {};
    await Promise.all(imgPaths.map(async path => {
      try {
        const res  = await fetch(path);
        const blob = await res.blob();
        imgMap[path] = await new Promise<string>(resolve => {
          const reader = new FileReader();
          reader.onloadend = () => resolve(reader.result as string);
          reader.readAsDataURL(blob);
        });
      } catch { imgMap[path] = ''; }
    }));

    // Extraire toutes les règles CSS depuis le DOM
    let styles = Array.from(document.styleSheets)
      .flatMap(sheet => {
        try { return Array.from(sheet.cssRules).map(r => r.cssText); }
        catch { return []; }
      })
      .join('\n');

    // Remplacer chaque URL image par son équivalent base64
    for (const [path, dataUrl] of Object.entries(imgMap)) {
      if (!dataUrl) continue;
      const esc = path.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
      styles = styles
        .replace(new RegExp(`url\\(["']?${esc}["']?\\)`, 'g'), `url("${dataUrl}")`)
        .replace(new RegExp(`url\\(["']?${esc.replace(/^\\/,'').replace(/^\//,'')}["']?\\)`, 'g'), `url("${dataUrl}")`);
    }

    const nom = [this.acte!.prenom, this.acte!.nom].filter(Boolean).join(' ') || 'Acte';

    const printWin = window.open('', '_blank');
    if (!printWin) {
      this.toast.error('Autorisez les popups pour générer le PDF.');
      this.activeTab = prevTab;
      return;
    }

    printWin.document.write(`<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <title>Acte de naissance – ${nom}</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap">
  <style>
    ${styles}
    @page { size: A4 portrait; margin: 0; }
    html, body {
      margin: 0; padding: 0;
      width: 210mm; height: 297mm;
      overflow: hidden;
      background: white;
      -webkit-print-color-adjust: exact;
      print-color-adjust: exact;
    }
    .acte-document {
      width: 210mm !important;
      margin: 0 !important;
      box-shadow: none !important;
      border: none !important;
      overflow: visible !important;
      transform-origin: top left;
    }
  </style>
</head>
<body>
  ${docEl.outerHTML}
  <script>
    document.fonts.ready.then(function() {
      var el = document.querySelector('.acte-document');
      if (el) {
        /* Calcul du facteur d'echelle pour tenir sur une page A4 */
        var a4W = 210 / 25.4 * 96;   /* ~793px */
        var a4H = 297 / 25.4 * 96;   /* ~1123px */
        var elW = el.scrollWidth  || el.offsetWidth;
        var elH = el.scrollHeight || el.offsetHeight;
        var scale = Math.min(a4W / elW, a4H / elH, 1);
        if (scale < 1) {
          el.style.transform = 'scale(' + scale + ')';
          el.style.transformOrigin = 'top left';
          document.body.style.width  = Math.ceil(elW * scale) + 'px';
          document.body.style.height = Math.ceil(elH * scale) + 'px';
        }
      }
      var imgs = Array.from(document.images).filter(function(i){ return !i.complete; });
      Promise.all(imgs.map(function(i){
        return new Promise(function(r){ i.onload=r; i.onerror=r; });
      })).then(function(){
        setTimeout(function(){ window.focus(); window.print(); }, 250);
      });
    });
    window.addEventListener('afterprint', function(){ window.close(); });
  </script>
</body>
</html>`);

    printWin.document.close();
    setTimeout(() => { this.activeTab = prevTab; }, 2000);
  }

  modifier(): void {
    if (!this.acte) return;
    this.router.navigate(['/admin/actes-naissance/creation'],
      { queryParams: { id: this.acte.id, mode: 'edit' } });
  }

  retour(): void {
    this.router.navigate(['/admin/actes/listes']);
  }

  fmt(value: string | undefined | null): string { return value?.trim() || '—'; }

  fmtDate(value: string | undefined | null): string {
    if (!value) return '—';
    try {
      return new Date(value).toLocaleDateString('fr-FR', { day: '2-digit', month: 'long', year: 'numeric' });
    } catch { return value; }
  }

  fmtSexe(v: string | undefined | null): string {
    if (v === 'M') return 'Masculin';
    if (v === 'F') return 'Féminin';
    return v || '—';
  }

  join(parts: (string | undefined | null)[], sep = ', '): string {
    return parts.filter(p => p && p.trim()).join(sep) || '—';
  }
}
