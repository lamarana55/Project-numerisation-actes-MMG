import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/error/failure.dart';
import '../../domain/entities/acte_resume.dart';
import '../../domain/entities/declaration_mariage.dart';

part 'declaration_mariage_state.freezed.dart';

/// Étapes du formulaire de mariage.
enum EtapeMariage {
  mariage,
  epoux,
  epouse,
  parents,
  temoins,
  recapitulatif,
}

enum StatutEnvoi { edition, envoiEnCours, succes, echec }

@freezed
class DeclarationMariageState with _$DeclarationMariageState {
  const DeclarationMariageState._();

  const factory DeclarationMariageState({
    required DeclarationMariage declaration,
    @Default(EtapeMariage.mariage) EtapeMariage etape,
    @Default(StatutEnvoi.edition) StatutEnvoi statut,
    @Default(<String, String>{}) Map<String, String> erreurs,
    Failure? echec,
    ActeResume? resultat,
  }) = _DeclarationMariageState;

  bool get estPremiereEtape => etape == EtapeMariage.values.first;
  bool get estDerniereEtape => etape == EtapeMariage.values.last;
  bool get enChargement => statut == StatutEnvoi.envoiEnCours;
}
