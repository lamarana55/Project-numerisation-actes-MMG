/// Chemins relatifs des endpoints backend (relatifs à [ApiConfig.baseUrl]).
class ApiEndpoints {
  const ApiEndpoints._();

  // ── Authentification ──────────────────────────────────────
  static const String signin = '/auth/signin';
  static const String me = '/auth/me';

  // ── Authentification par téléphone + OTP (à créer côté backend) ──
  static const String otpRequest = '/auth/otp/request';
  static const String otpVerify = '/auth/otp/verify';

  // ── Actes de naissance ────────────────────────────────────
  static const String declarationNaissance = '/actes/naissance';
  static const String transcriptionNaissance = '/actes/naissance/transcription';

  static String acteNaissanceById(String id) => '/actes/naissance/$id';
  static String acteNaissancePdf(String id) => '/actes/naissance/$id/pdf';

  // ── Actes de décès ────────────────────────────────────────
  static const String declarationDeces = '/actes/deces';
  static const String transcriptionDeces = '/actes/deces/transcription';

  static String acteDecesById(String id) => '/actes/deces/$id';

  // ── Actes de mariage ──────────────────────────────────────
  static const String declarationMariage = '/actes/mariage';

  static String acteMariageById(String id) => '/actes/mariage/$id';

  /// Référentiel des causes de décès.
  static const String causesDeces = '/causes-deces';

  // ── Géodonnées (cascade) ──────────────────────────────────
  static const String regions = '/geodata/regions';
  static const String pays = '/geodata/pays';
  static String prefecturesByRegion(String codeRegion) =>
      '/geodata/regions/$codeRegion/prefectures';
  static String communesByPrefecture(String codePrefecture) =>
      '/geodata/prefectures/$codePrefecture/communes';
  static String quartiersByCommune(String codeCommune) =>
      '/geodata/communes/$codeCommune/quartiers';

  // ── Référentiels ──────────────────────────────────────────
  static const String nationalites = '/nationalites';
  static const String professions = '/professions';
}
