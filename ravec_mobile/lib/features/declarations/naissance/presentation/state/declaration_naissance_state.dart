import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/error/failure.dart';
import '../../domain/entities/acte_resume.dart';
import '../../domain/entities/declaration_naissance.dart';

part 'declaration_naissance_state.freezed.dart';

/// Étapes du formulaire (assistant pas-à-pas).
enum EtapeDeclaration {
  nouveauNe,
  parents,
  piecesJointes,
  geolocalisation,
  recapitulatif,
}

/// Statut global de l'écran.
enum StatutEnvoi { edition, envoiEnCours, succes, echec }

@freezed
class DeclarationNaissanceState with _$DeclarationNaissanceState {
  const DeclarationNaissanceState._();

  const factory DeclarationNaissanceState({
    required DeclarationNaissance declaration,
    @Default(EtapeDeclaration.nouveauNe) EtapeDeclaration etape,
    @Default(StatutEnvoi.edition) StatutEnvoi statut,
    @Default(<String, String>{}) Map<String, String> erreurs,
    Failure? echec,
    ActeResume? resultat,
  }) = _DeclarationNaissanceState;

  bool get estPremiereEtape => etape == EtapeDeclaration.values.first;
  bool get estDerniereEtape => etape == EtapeDeclaration.values.last;
  bool get enChargement => statut == StatutEnvoi.envoiEnCours;
}
