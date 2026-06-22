import 'package:intl/intl.dart';

/// Formatage des dates pour l'échange avec le backend.
///
/// Les `LocalDate` Java sont attendus en ISO `yyyy-MM-dd`.
class DateFormatter {
  const DateFormatter._();

  static final DateFormat _iso = DateFormat('yyyy-MM-dd');
  static final DateFormat _affichage = DateFormat('dd/MM/yyyy', 'fr_FR');

  /// `yyyy-MM-dd` (ou null si la date est null).
  static String? toIsoDate(DateTime? date) => date == null ? null : _iso.format(date);

  /// Affichage humain `dd/MM/yyyy`.
  static String toAffichage(DateTime? date) => date == null ? '—' : _affichage.format(date);
}
