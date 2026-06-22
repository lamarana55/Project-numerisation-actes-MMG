import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/error/failure.dart';
import '../../domain/entities/acte_resume.dart';
import '../../domain/entities/declaration_deces.dart';

part 'declaration_deces_state.freezed.dart';

/// Étapes du formulaire de décès.
enum EtapeDeces {
  defunt,
  circonstances,
  filiation,
  declarant,
  recapitulatif,
}

enum StatutEnvoi { edition, envoiEnCours, succes, echec }

@freezed
class DeclarationDecesState with _$DeclarationDecesState {
  const DeclarationDecesState._();

  const factory DeclarationDecesState({
    required DeclarationDeces declaration,
    @Default(EtapeDeces.defunt) EtapeDeces etape,
    @Default(StatutEnvoi.edition) StatutEnvoi statut,
    @Default(<String, String>{}) Map<String, String> erreurs,
    Failure? echec,
    ActeResume? resultat,
  }) = _DeclarationDecesState;

  bool get estPremiereEtape => etape == EtapeDeces.values.first;
  bool get estDerniereEtape => etape == EtapeDeces.values.last;
  bool get enChargement => statut == StatutEnvoi.envoiEnCours;
}
