import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { MatDialog } from '@angular/material/dialog';
import { Observable, startWith, map } from 'rxjs';
import { ConfirmLeaveDialogComponent } from '../../shared/confirm-leave-dialog/confirm-leave-dialog.component';
import { GeodataService } from '../../services/geodata.service';
import { CommuneDTO, RegionDTO, PrefectureDTO, QuartierDTO } from '../../models/geodata';
import { ActeNaissanceService, ActeMariageDTO } from '../../services/acte-naissance.service';
import { ToastService } from '../../services/toast.service';
import { ProfessionService, Profession } from '../../services/profession.service';
import { NationaliteService, Nationalite } from '../../services/nationalite.service';

export interface StepMariage { number: number; label: string; }

@Component({
  selector: 'app-marriage-act-creation',
  templateUrl: './marriage-act-creation.component.html',
  styleUrls: ['./marriage-act-creation.component.css'],
})
export class MarriageActCreationComponent implements OnInit {

  currentStep = 1;
  readonly today = new Date();
  isSaving   = false;

  readonly steps: StepMariage[] = [
    { number: 1, label: 'Mariage' },
    { number: 2, label: 'Époux' },
    { number: 3, label: 'Épouse' },
    { number: 4, label: 'Témoins' },
    { number: 5, label: 'Acte' },
  ];

  mariageForm!:     FormGroup;
  epouxForm!:       FormGroup;
  epouseForm!:      FormGroup;
  temoinsForm!:     FormGroup;
  acteForm!:        FormGroup;

  communes: CommuneDTO[] = [];
  isLoadingCommunes = false;

  // ── Cascades domicile époux ───────────────────────────────────
  epouxRegions:     RegionDTO[]     = [];
  epouxPrefectures: PrefectureDTO[] = [];
  epouxCommunes:    CommuneDTO[]    = [];
  epouxQuartiers:   QuartierDTO[]   = [];

  // ── Cascades domicile épouse ──────────────────────────────────
  epouseRegions:     RegionDTO[]     = [];
  epousePrefectures: PrefectureDTO[] = [];
  epouseCommunes:    CommuneDTO[]    = [];
  epouseQuartiers:   QuartierDTO[]   = [];

  professions:  Profession[]  = [];
  nationalites: Nationalite[] = [];

  filteredProfessionsEpoux$:      Observable<Profession[]> | null = null;
  filteredProfessionsEpouse$:     Observable<Profession[]> | null = null;
  filteredProfessionsPereEpoux$:  Observable<Profession[]> | null = null;
  filteredProfessionsMereEpoux$:  Observable<Profession[]> | null = null;
  filteredProfessionsPereEpouse$: Observable<Profession[]> | null = null;
  filteredProfessionsMereEpouse$: Observable<Profession[]> | null = null;
  filteredProfessionsT1$:         Observable<Profession[]> | null = null;
  filteredProfessionsT2$:         Observable<Profession[]> | null = null;

  get isNonSignature(): boolean {
    const v = this.acteForm?.get('signatureDeclarant')?.value;
    return v === 'neSachant' || v === 'nePouvant';
  }

  constructor(
    private fb:             FormBuilder,
    private router:         Router,
    private activatedRoute: ActivatedRoute,
    private geodata:        GeodataService,
    private dialog:         MatDialog,
    private acteService:    ActeNaissanceService,
    private toast:          ToastService,
    private professionSvc:  ProfessionService,
    private nationaliteSvc: NationaliteService,
  ) {}

  private getCurrentTime(): string {
    const now = new Date();
    return `${String(now.getHours()).padStart(2,'0')}:${String(now.getMinutes()).padStart(2,'0')}`;
  }

  ngOnInit(): void {
    this.mariageForm = this.fb.group({
      typeMariage:       ['CIVIL', Validators.required],
      dateMariage:       [null, Validators.required],
      heureMariage:      [''],
      communeMariage:    ['', Validators.required],
      lieuMariage:       [''],
      regimeMatrimonial: ['communaute_biens'],
    });

    this.epouxForm = this.fb.group({
      hasNpiEpoux:         ['non'],
      npiEpoux:            [''],
      prenomEpoux:         ['', Validators.required],
      nomEpoux:            ['', Validators.required],
      dateNaissanceEpoux:  [null],
      communeNaissanceEpoux: [''],
      nationaliteEpoux:    [''],
      professionEpoux:     [''],
      telephoneEpoux:      [''],
      etatCivilAntEpoux:   ['celibataire'],
      adresseEpoux:           [''],
      regionDomicileEpoux:    [''],
      prefectureDomicileEpoux:[{ value: '', disabled: true }],
      communeDomicileEpoux:   [{ value: '', disabled: true }],
      quartierDomicileEpoux:  [{ value: '', disabled: true }],
      // Parents de l'époux
      prenomPereEpoux:    [''],
      nomPereEpoux:       [''],
      professionPereEpoux:[''],
      nationalitePereEpoux:[''],
      prenomMereEpoux:    [''],
      nomMereEpoux:       [''],
      professionMereEpoux:[''],
      nationaliteMereEpoux:[''],
    });

    this.epouseForm = this.fb.group({
      hasNpiEpouse:         ['non'],
      npiEpouse:            [''],
      prenomEpouse:         ['', Validators.required],
      nomEpouse:            ['', Validators.required],
      dateNaissanceEpouse:  [null],
      communeNaissanceEpouse: [''],
      nationaliteEpouse:    [''],
      professionEpouse:     [''],
      telephoneEpouse:      [''],
      etatCivilAntEpouse:   ['celibataire'],
      adresseEpouse:           [''],
      regionDomicileEpouse:    [''],
      prefectureDomicileEpouse:[{ value: '', disabled: true }],
      communeDomicileEpouse:   [{ value: '', disabled: true }],
      quartierDomicileEpouse:  [{ value: '', disabled: true }],
      // Parents de l'épouse
      prenomPereEpouse:    [''],
      nomPereEpouse:       [''],
      professionPereEpouse:[''],
      nationalitePereEpouse:[''],
      prenomMereEpouse:    [''],
      nomMereEpouse:       [''],
      professionMereEpouse:[''],
      nationaliteMereEpouse:[''],
    });

    this.temoinsForm = this.fb.group({
      // Témoin 1
      hasNpiTemoin1:     ['non'],
      npiTemoin1:        [''],
      prenomTemoin1:     ['', Validators.required],
      nomTemoin1:        ['', Validators.required],
      sexeTemoin1:       ['M'],
      professionTemoin1: [''],
      telephoneTemoin1:  [''],
      adresseTemoin1:    [''],
      // Témoin 2
      hasNpiTemoin2:     ['non'],
      npiTemoin2:        [''],
      prenomTemoin2:     ['', Validators.required],
      nomTemoin2:        ['', Validators.required],
      sexeTemoin2:       ['M'],
      professionTemoin2: [''],
      telephoneTemoin2:  [''],
      adresseTemoin2:    [''],
    });

    this.acteForm = this.fb.group({
      prenomDeclarant:    [''],
      nomDeclarant:       [''],
      qualiteDeclarant:   [''],
      dateDeclaration:    [new Date(), Validators.required],
      signatureDeclarant: ['oui'],
      pointCollecte:      [''],
      dateDressage:       [new Date(), Validators.required],
      heureDressage:      [this.getCurrentTime()],
      actionsFaire:       ['en_cours_saisie', Validators.required],
    });

    this.isLoadingCommunes = true;
    this.geodata.getAllCommunes().subscribe({
      next:  d => { this.communes = d; this.isLoadingCommunes = false; },
      error: () => this.isLoadingCommunes = false,
    });

    this.geodata.getAllRegions().subscribe(data => {
      this.epouxRegions  = data;
      this.epouseRegions = data;
    });

    this.professionSvc.getProfessions().subscribe(data => {
      this.professions = data;
      this.filteredProfessionsEpoux$ = this.epouxForm.get('professionEpoux')!.valueChanges.pipe(
        startWith(''), map(v => this._filterProf(v || ''))
      );
      this.filteredProfessionsEpouse$ = this.epouseForm.get('professionEpouse')!.valueChanges.pipe(
        startWith(''), map(v => this._filterProf(v || ''))
      );
      this.filteredProfessionsPereEpoux$ = this.epouxForm.get('professionPereEpoux')!.valueChanges.pipe(
        startWith(''), map(v => this._filterProf(v || ''))
      );
      this.filteredProfessionsMereEpoux$ = this.epouxForm.get('professionMereEpoux')!.valueChanges.pipe(
        startWith(''), map(v => this._filterProf(v || ''))
      );
      this.filteredProfessionsPereEpouse$ = this.epouseForm.get('professionPereEpouse')!.valueChanges.pipe(
        startWith(''), map(v => this._filterProf(v || ''))
      );
      this.filteredProfessionsMereEpouse$ = this.epouseForm.get('professionMereEpouse')!.valueChanges.pipe(
        startWith(''), map(v => this._filterProf(v || ''))
      );
      this.filteredProfessionsT1$ = this.temoinsForm.get('professionTemoin1')!.valueChanges.pipe(
        startWith(''), map(v => this._filterProf(v || ''))
      );
      this.filteredProfessionsT2$ = this.temoinsForm.get('professionTemoin2')!.valueChanges.pipe(
        startWith(''), map(v => this._filterProf(v || ''))
      );
    });

    this.nationaliteSvc.getNationalites().subscribe(d => this.nationalites = d);
  }

  get epouxHasNpi():  boolean { return this.epouxForm?.get('hasNpiEpoux')?.value  === 'oui'; }
  get epouseHasNpi(): boolean { return this.epouseForm?.get('hasNpiEpouse')?.value === 'oui'; }
  get temoin1HasNpi():boolean { return this.temoinsForm?.get('hasNpiTemoin1')?.value === 'oui'; }
  get temoin2HasNpi():boolean { return this.temoinsForm?.get('hasNpiTemoin2')?.value === 'oui'; }

  get currentForm(): FormGroup {
    const map: Record<number, FormGroup> = {
      1: this.mariageForm, 2: this.epouxForm, 3: this.epouseForm,
      4: this.temoinsForm, 5: this.acteForm,
    };
    return map[this.currentStep] ?? this.mariageForm;
  }

  isStepCompleted(n: number): boolean {
    if (n >= this.currentStep) return false;
    const forms: Record<number, FormGroup> = {
      1: this.mariageForm, 2: this.epouxForm, 3: this.epouseForm, 4: this.temoinsForm,
    };
    return forms[n]?.valid ?? false;
  }

  goTo(step: number): void {
    if (step < this.currentStep || this.isStepCompleted(step - 1) || step === 1) this.currentStep = step;
  }
  goNext(): void { this.currentStep < 5 ? this.currentStep++ : this.enregistrer(); }
  goPrev(): void { if (this.currentStep > 1) this.currentStep--; }

  cancel(): void {
    const dirty = [this.mariageForm, this.epouxForm, this.epouseForm, this.temoinsForm, this.acteForm].some(f => f?.dirty);
    if (dirty) {
      this.dialog.open(ConfirmLeaveDialogComponent, {
        width: '460px', maxWidth: '96vw', disableClose: true,
        panelClass: 'confirm-leave-panel',
      }).afterClosed().subscribe((ok: boolean) => { if (ok) this.router.navigate(['/admin/actes']); });
    } else {
      this.router.navigate(['/admin/actes']);
    }
  }

  enregistrer(): void {
    if (this.isSaving) return;
    const mar  = this.mariageForm.value;
    const ex   = this.epouxForm.getRawValue();
    const se   = this.epouseForm.getRawValue();
    const tem  = this.temoinsForm.value;
    const acte = this.acteForm.value;

    const payload: ActeMariageDTO = {
      typeMariage:      mar.typeMariage,
      dateMariage:      mar.dateMariage,
      heureMariage:     mar.heureMariage,
      communeMariage:   mar.communeMariage,
      lieuMariage:      mar.lieuMariage,
      regimeMatrimonial: mar.regimeMatrimonial,
      // Époux
      npiEpoux:          ex.npiEpoux,
      prenomEpoux:       ex.prenomEpoux,
      nomEpoux:          ex.nomEpoux,
      dateNaissanceEpoux: ex.dateNaissanceEpoux,
      communeNaissanceEpoux: ex.communeNaissanceEpoux,
      nationaliteEpoux:  ex.nationaliteEpoux,
      professionEpoux:   ex.professionEpoux,
      telephoneEpoux:    ex.telephoneEpoux,
      etatCivilAntEpoux: ex.etatCivilAntEpoux,
      adresseEpoux:      ex.adresseEpoux,
      communeDomicileEpoux:  ex.communeDomicileEpoux,
      quartierDomicileEpoux: ex.quartierDomicileEpoux,
      // Parents époux
      prenomPereEpoux:      ex.prenomPereEpoux,
      nomPereEpoux:         ex.nomPereEpoux,
      professionPereEpoux:  ex.professionPereEpoux,
      nationalitePereEpoux: ex.nationalitePereEpoux,
      prenomMereEpoux:      ex.prenomMereEpoux,
      nomMereEpoux:         ex.nomMereEpoux,
      professionMereEpoux:  ex.professionMereEpoux,
      nationaliteMereEpoux: ex.nationaliteMereEpoux,
      // Épouse
      npiEpouse:          se.npiEpouse,
      prenomEpouse:       se.prenomEpouse,
      nomEpouse:          se.nomEpouse,
      dateNaissanceEpouse: se.dateNaissanceEpouse,
      communeNaissanceEpouse: se.communeNaissanceEpouse,
      nationaliteEpouse:  se.nationaliteEpouse,
      professionEpouse:   se.professionEpouse,
      telephoneEpouse:    se.telephoneEpouse,
      etatCivilAntEpouse: se.etatCivilAntEpouse,
      adresseEpouse:      se.adresseEpouse,
      communeDomicileEpouse:  se.communeDomicileEpouse,
      quartierDomicileEpouse: se.quartierDomicileEpouse,
      // Parents épouse
      prenomPereEpouse:      se.prenomPereEpouse,
      nomPereEpouse:         se.nomPereEpouse,
      professionPereEpouse:  se.professionPereEpouse,
      nationalitePereEpouse: se.nationalitePereEpouse,
      prenomMereEpouse:      se.prenomMereEpouse,
      nomMereEpouse:         se.nomMereEpouse,
      professionMereEpouse:  se.professionMereEpouse,
      nationaliteMereEpouse: se.nationaliteMereEpouse,
      // Témoins
      npiTemoin1:        tem.npiTemoin1,
      prenomTemoin1:     tem.prenomTemoin1,
      nomTemoin1:        tem.nomTemoin1,
      sexeTemoin1:       tem.sexeTemoin1,
      professionTemoin1: tem.professionTemoin1,
      telephoneTemoin1:  tem.telephoneTemoin1,
      adresseTemoin1:    tem.adresseTemoin1,
      npiTemoin2:        tem.npiTemoin2,
      prenomTemoin2:     tem.prenomTemoin2,
      nomTemoin2:        tem.nomTemoin2,
      sexeTemoin2:       tem.sexeTemoin2,
      professionTemoin2: tem.professionTemoin2,
      telephoneTemoin2:  tem.telephoneTemoin2,
      adresseTemoin2:    tem.adresseTemoin2,
      // Acte
      prenomDeclarant:    acte.prenomDeclarant,
      nomDeclarant:       acte.nomDeclarant,
      qualiteDeclarant:   acte.qualiteDeclarant,
      dateDeclaration:    acte.dateDeclaration,
      signatureDeclarant: acte.signatureDeclarant,
      pointCollecte:      acte.pointCollecte,
      dateDressage:       acte.dateDressage,
      heureDressage:      acte.heureDressage,
      actionsFaire:       acte.actionsFaire,
    };

    this.isSaving = true;
    this.acteService.createDeclarationMariage(payload).subscribe({
      next: () => {
        this.isSaving = false;
        this.toast.success('Acte de mariage enregistré.');
        this.router.navigate(['/admin/actes']);
      },
      error: err => {
        this.isSaving = false;
        console.error('Erreur enregistrement mariage', err);
        this.toast.error('Une erreur est survenue lors de l\'enregistrement.');
      },
    });
  }

  _filterProf(value: string): Profession[] {
    const q = value.toLowerCase();
    return this.professions.filter(p =>
      p.masculin.toLowerCase().includes(q) || p.feminin.toLowerCase().includes(q)
    );
  }

  // ── Cascades domicile époux ───────────────────────────────────
  onEpouxRegionChange(code: string): void {
    this.epouxPrefectures = []; this.epouxCommunes = []; this.epouxQuartiers = [];
    this.epouxForm.patchValue({ prefectureDomicileEpoux: '', communeDomicileEpoux: '', quartierDomicileEpoux: '' });
    this.epouxForm.get('prefectureDomicileEpoux')!.disable();
    this.epouxForm.get('communeDomicileEpoux')!.disable();
    this.epouxForm.get('quartierDomicileEpoux')!.disable();
    if (!code) return;
    this.geodata.getPrefecturesByRegion(code).subscribe({
      next: data => { this.epouxPrefectures = data; this.epouxForm.get('prefectureDomicileEpoux')!.enable(); },
    });
  }
  onEpouxPrefectureChange(code: string): void {
    this.epouxCommunes = []; this.epouxQuartiers = [];
    this.epouxForm.patchValue({ communeDomicileEpoux: '', quartierDomicileEpoux: '' });
    this.epouxForm.get('communeDomicileEpoux')!.disable();
    this.epouxForm.get('quartierDomicileEpoux')!.disable();
    if (!code) return;
    this.geodata.getCommunesByPrefecture(code).subscribe({
      next: data => { this.epouxCommunes = data; this.epouxForm.get('communeDomicileEpoux')!.enable(); },
    });
  }
  onEpouxCommuneChange(code: string): void {
    this.epouxQuartiers = [];
    this.epouxForm.patchValue({ quartierDomicileEpoux: '' });
    this.epouxForm.get('quartierDomicileEpoux')!.disable();
    if (!code) return;
    this.geodata.getQuartiersByCommune(code).subscribe({
      next: data => { this.epouxQuartiers = data; this.epouxForm.get('quartierDomicileEpoux')!.enable(); },
    });
  }

  // ── Cascades domicile épouse ──────────────────────────────────
  onEpouseRegionChange(code: string): void {
    this.epousePrefectures = []; this.epouseCommunes = []; this.epouseQuartiers = [];
    this.epouseForm.patchValue({ prefectureDomicileEpouse: '', communeDomicileEpouse: '', quartierDomicileEpouse: '' });
    this.epouseForm.get('prefectureDomicileEpouse')!.disable();
    this.epouseForm.get('communeDomicileEpouse')!.disable();
    this.epouseForm.get('quartierDomicileEpouse')!.disable();
    if (!code) return;
    this.geodata.getPrefecturesByRegion(code).subscribe({
      next: data => { this.epousePrefectures = data; this.epouseForm.get('prefectureDomicileEpouse')!.enable(); },
    });
  }
  onEpousePrefectureChange(code: string): void {
    this.epouseCommunes = []; this.epouseQuartiers = [];
    this.epouseForm.patchValue({ communeDomicileEpouse: '', quartierDomicileEpouse: '' });
    this.epouseForm.get('communeDomicileEpouse')!.disable();
    this.epouseForm.get('quartierDomicileEpouse')!.disable();
    if (!code) return;
    this.geodata.getCommunesByPrefecture(code).subscribe({
      next: data => { this.epouseCommunes = data; this.epouseForm.get('communeDomicileEpouse')!.enable(); },
    });
  }
  onEpouseCommuneChange(code: string): void {
    this.epouseQuartiers = [];
    this.epouseForm.patchValue({ quartierDomicileEpouse: '' });
    this.epouseForm.get('quartierDomicileEpouse')!.disable();
    if (!code) return;
    this.geodata.getQuartiersByCommune(code).subscribe({
      next: data => { this.epouseQuartiers = data; this.epouseForm.get('quartierDomicileEpouse')!.enable(); },
    });
  }
}
