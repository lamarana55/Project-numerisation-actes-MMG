// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'declaration_naissance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LieuAdministratif {
  String? get pays => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  String? get prefecture => throw _privateConstructorUsedError;
  String? get commune => throw _privateConstructorUsedError;
  String? get quartier => throw _privateConstructorUsedError;
  String? get ville => throw _privateConstructorUsedError;

  /// Create a copy of LieuAdministratif
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LieuAdministratifCopyWith<LieuAdministratif> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LieuAdministratifCopyWith<$Res> {
  factory $LieuAdministratifCopyWith(
          LieuAdministratif value, $Res Function(LieuAdministratif) then) =
      _$LieuAdministratifCopyWithImpl<$Res, LieuAdministratif>;
  @useResult
  $Res call(
      {String? pays,
      String? region,
      String? prefecture,
      String? commune,
      String? quartier,
      String? ville});
}

/// @nodoc
class _$LieuAdministratifCopyWithImpl<$Res, $Val extends LieuAdministratif>
    implements $LieuAdministratifCopyWith<$Res> {
  _$LieuAdministratifCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LieuAdministratif
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pays = freezed,
    Object? region = freezed,
    Object? prefecture = freezed,
    Object? commune = freezed,
    Object? quartier = freezed,
    Object? ville = freezed,
  }) {
    return _then(_value.copyWith(
      pays: freezed == pays
          ? _value.pays
          : pays // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      prefecture: freezed == prefecture
          ? _value.prefecture
          : prefecture // ignore: cast_nullable_to_non_nullable
              as String?,
      commune: freezed == commune
          ? _value.commune
          : commune // ignore: cast_nullable_to_non_nullable
              as String?,
      quartier: freezed == quartier
          ? _value.quartier
          : quartier // ignore: cast_nullable_to_non_nullable
              as String?,
      ville: freezed == ville
          ? _value.ville
          : ville // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LieuAdministratifImplCopyWith<$Res>
    implements $LieuAdministratifCopyWith<$Res> {
  factory _$$LieuAdministratifImplCopyWith(_$LieuAdministratifImpl value,
          $Res Function(_$LieuAdministratifImpl) then) =
      __$$LieuAdministratifImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? pays,
      String? region,
      String? prefecture,
      String? commune,
      String? quartier,
      String? ville});
}

/// @nodoc
class __$$LieuAdministratifImplCopyWithImpl<$Res>
    extends _$LieuAdministratifCopyWithImpl<$Res, _$LieuAdministratifImpl>
    implements _$$LieuAdministratifImplCopyWith<$Res> {
  __$$LieuAdministratifImplCopyWithImpl(_$LieuAdministratifImpl _value,
      $Res Function(_$LieuAdministratifImpl) _then)
      : super(_value, _then);

  /// Create a copy of LieuAdministratif
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pays = freezed,
    Object? region = freezed,
    Object? prefecture = freezed,
    Object? commune = freezed,
    Object? quartier = freezed,
    Object? ville = freezed,
  }) {
    return _then(_$LieuAdministratifImpl(
      pays: freezed == pays
          ? _value.pays
          : pays // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      prefecture: freezed == prefecture
          ? _value.prefecture
          : prefecture // ignore: cast_nullable_to_non_nullable
              as String?,
      commune: freezed == commune
          ? _value.commune
          : commune // ignore: cast_nullable_to_non_nullable
              as String?,
      quartier: freezed == quartier
          ? _value.quartier
          : quartier // ignore: cast_nullable_to_non_nullable
              as String?,
      ville: freezed == ville
          ? _value.ville
          : ville // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LieuAdministratifImpl implements _LieuAdministratif {
  const _$LieuAdministratifImpl(
      {this.pays,
      this.region,
      this.prefecture,
      this.commune,
      this.quartier,
      this.ville});

  @override
  final String? pays;
  @override
  final String? region;
  @override
  final String? prefecture;
  @override
  final String? commune;
  @override
  final String? quartier;
  @override
  final String? ville;

  @override
  String toString() {
    return 'LieuAdministratif(pays: $pays, region: $region, prefecture: $prefecture, commune: $commune, quartier: $quartier, ville: $ville)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LieuAdministratifImpl &&
            (identical(other.pays, pays) || other.pays == pays) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.prefecture, prefecture) ||
                other.prefecture == prefecture) &&
            (identical(other.commune, commune) || other.commune == commune) &&
            (identical(other.quartier, quartier) ||
                other.quartier == quartier) &&
            (identical(other.ville, ville) || other.ville == ville));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, pays, region, prefecture, commune, quartier, ville);

  /// Create a copy of LieuAdministratif
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LieuAdministratifImplCopyWith<_$LieuAdministratifImpl> get copyWith =>
      __$$LieuAdministratifImplCopyWithImpl<_$LieuAdministratifImpl>(
          this, _$identity);
}

abstract class _LieuAdministratif implements LieuAdministratif {
  const factory _LieuAdministratif(
      {final String? pays,
      final String? region,
      final String? prefecture,
      final String? commune,
      final String? quartier,
      final String? ville}) = _$LieuAdministratifImpl;

  @override
  String? get pays;
  @override
  String? get region;
  @override
  String? get prefecture;
  @override
  String? get commune;
  @override
  String? get quartier;
  @override
  String? get ville;

  /// Create a copy of LieuAdministratif
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LieuAdministratifImplCopyWith<_$LieuAdministratifImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Geolocalisation {
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  double? get precisionMetres => throw _privateConstructorUsedError;
  DateTime? get capturedAt => throw _privateConstructorUsedError;

  /// Adresse lisible (renseignée ou reverse-géocodée).
  String? get adresseLieu => throw _privateConstructorUsedError;

  /// Sélection administrative associée.
  LieuAdministratif get lieu => throw _privateConstructorUsedError;

  /// Create a copy of Geolocalisation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeolocalisationCopyWith<Geolocalisation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeolocalisationCopyWith<$Res> {
  factory $GeolocalisationCopyWith(
          Geolocalisation value, $Res Function(Geolocalisation) then) =
      _$GeolocalisationCopyWithImpl<$Res, Geolocalisation>;
  @useResult
  $Res call(
      {double? latitude,
      double? longitude,
      double? precisionMetres,
      DateTime? capturedAt,
      String? adresseLieu,
      LieuAdministratif lieu});

  $LieuAdministratifCopyWith<$Res> get lieu;
}

/// @nodoc
class _$GeolocalisationCopyWithImpl<$Res, $Val extends Geolocalisation>
    implements $GeolocalisationCopyWith<$Res> {
  _$GeolocalisationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Geolocalisation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? precisionMetres = freezed,
    Object? capturedAt = freezed,
    Object? adresseLieu = freezed,
    Object? lieu = null,
  }) {
    return _then(_value.copyWith(
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      precisionMetres: freezed == precisionMetres
          ? _value.precisionMetres
          : precisionMetres // ignore: cast_nullable_to_non_nullable
              as double?,
      capturedAt: freezed == capturedAt
          ? _value.capturedAt
          : capturedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      adresseLieu: freezed == adresseLieu
          ? _value.adresseLieu
          : adresseLieu // ignore: cast_nullable_to_non_nullable
              as String?,
      lieu: null == lieu
          ? _value.lieu
          : lieu // ignore: cast_nullable_to_non_nullable
              as LieuAdministratif,
    ) as $Val);
  }

  /// Create a copy of Geolocalisation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LieuAdministratifCopyWith<$Res> get lieu {
    return $LieuAdministratifCopyWith<$Res>(_value.lieu, (value) {
      return _then(_value.copyWith(lieu: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GeolocalisationImplCopyWith<$Res>
    implements $GeolocalisationCopyWith<$Res> {
  factory _$$GeolocalisationImplCopyWith(_$GeolocalisationImpl value,
          $Res Function(_$GeolocalisationImpl) then) =
      __$$GeolocalisationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? latitude,
      double? longitude,
      double? precisionMetres,
      DateTime? capturedAt,
      String? adresseLieu,
      LieuAdministratif lieu});

  @override
  $LieuAdministratifCopyWith<$Res> get lieu;
}

/// @nodoc
class __$$GeolocalisationImplCopyWithImpl<$Res>
    extends _$GeolocalisationCopyWithImpl<$Res, _$GeolocalisationImpl>
    implements _$$GeolocalisationImplCopyWith<$Res> {
  __$$GeolocalisationImplCopyWithImpl(
      _$GeolocalisationImpl _value, $Res Function(_$GeolocalisationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Geolocalisation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? precisionMetres = freezed,
    Object? capturedAt = freezed,
    Object? adresseLieu = freezed,
    Object? lieu = null,
  }) {
    return _then(_$GeolocalisationImpl(
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      precisionMetres: freezed == precisionMetres
          ? _value.precisionMetres
          : precisionMetres // ignore: cast_nullable_to_non_nullable
              as double?,
      capturedAt: freezed == capturedAt
          ? _value.capturedAt
          : capturedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      adresseLieu: freezed == adresseLieu
          ? _value.adresseLieu
          : adresseLieu // ignore: cast_nullable_to_non_nullable
              as String?,
      lieu: null == lieu
          ? _value.lieu
          : lieu // ignore: cast_nullable_to_non_nullable
              as LieuAdministratif,
    ));
  }
}

/// @nodoc

class _$GeolocalisationImpl implements _Geolocalisation {
  const _$GeolocalisationImpl(
      {this.latitude,
      this.longitude,
      this.precisionMetres,
      this.capturedAt,
      this.adresseLieu,
      this.lieu = const LieuAdministratif()});

  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final double? precisionMetres;
  @override
  final DateTime? capturedAt;

  /// Adresse lisible (renseignée ou reverse-géocodée).
  @override
  final String? adresseLieu;

  /// Sélection administrative associée.
  @override
  @JsonKey()
  final LieuAdministratif lieu;

  @override
  String toString() {
    return 'Geolocalisation(latitude: $latitude, longitude: $longitude, precisionMetres: $precisionMetres, capturedAt: $capturedAt, adresseLieu: $adresseLieu, lieu: $lieu)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeolocalisationImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.precisionMetres, precisionMetres) ||
                other.precisionMetres == precisionMetres) &&
            (identical(other.capturedAt, capturedAt) ||
                other.capturedAt == capturedAt) &&
            (identical(other.adresseLieu, adresseLieu) ||
                other.adresseLieu == adresseLieu) &&
            (identical(other.lieu, lieu) || other.lieu == lieu));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude,
      precisionMetres, capturedAt, adresseLieu, lieu);

  /// Create a copy of Geolocalisation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeolocalisationImplCopyWith<_$GeolocalisationImpl> get copyWith =>
      __$$GeolocalisationImplCopyWithImpl<_$GeolocalisationImpl>(
          this, _$identity);
}

abstract class _Geolocalisation implements Geolocalisation {
  const factory _Geolocalisation(
      {final double? latitude,
      final double? longitude,
      final double? precisionMetres,
      final DateTime? capturedAt,
      final String? adresseLieu,
      final LieuAdministratif lieu}) = _$GeolocalisationImpl;

  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  double? get precisionMetres;
  @override
  DateTime? get capturedAt;

  /// Adresse lisible (renseignée ou reverse-géocodée).
  @override
  String? get adresseLieu;

  /// Sélection administrative associée.
  @override
  LieuAdministratif get lieu;

  /// Create a copy of Geolocalisation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeolocalisationImplCopyWith<_$GeolocalisationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NouveauNe {
  String? get prenom => throw _privateConstructorUsedError;
  String? get nom => throw _privateConstructorUsedError;
  Sexe? get sexe => throw _privateConstructorUsedError;
  DateTime? get dateNaissance => throw _privateConstructorUsedError;
  String? get heureNaissance => throw _privateConstructorUsedError;
  String? get lieuAccouchement => throw _privateConstructorUsedError;
  String? get formationSanitaire => throw _privateConstructorUsedError;
  bool get naissanceMultiple => throw _privateConstructorUsedError;
  String? get typeNaissanceMultiple => throw _privateConstructorUsedError;
  int? get rangEnfant => throw _privateConstructorUsedError;
  LieuAdministratif get lieuNaissance => throw _privateConstructorUsedError;

  /// Create a copy of NouveauNe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NouveauNeCopyWith<NouveauNe> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NouveauNeCopyWith<$Res> {
  factory $NouveauNeCopyWith(NouveauNe value, $Res Function(NouveauNe) then) =
      _$NouveauNeCopyWithImpl<$Res, NouveauNe>;
  @useResult
  $Res call(
      {String? prenom,
      String? nom,
      Sexe? sexe,
      DateTime? dateNaissance,
      String? heureNaissance,
      String? lieuAccouchement,
      String? formationSanitaire,
      bool naissanceMultiple,
      String? typeNaissanceMultiple,
      int? rangEnfant,
      LieuAdministratif lieuNaissance});

  $LieuAdministratifCopyWith<$Res> get lieuNaissance;
}

/// @nodoc
class _$NouveauNeCopyWithImpl<$Res, $Val extends NouveauNe>
    implements $NouveauNeCopyWith<$Res> {
  _$NouveauNeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NouveauNe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prenom = freezed,
    Object? nom = freezed,
    Object? sexe = freezed,
    Object? dateNaissance = freezed,
    Object? heureNaissance = freezed,
    Object? lieuAccouchement = freezed,
    Object? formationSanitaire = freezed,
    Object? naissanceMultiple = null,
    Object? typeNaissanceMultiple = freezed,
    Object? rangEnfant = freezed,
    Object? lieuNaissance = null,
  }) {
    return _then(_value.copyWith(
      prenom: freezed == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String?,
      nom: freezed == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String?,
      sexe: freezed == sexe
          ? _value.sexe
          : sexe // ignore: cast_nullable_to_non_nullable
              as Sexe?,
      dateNaissance: freezed == dateNaissance
          ? _value.dateNaissance
          : dateNaissance // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      heureNaissance: freezed == heureNaissance
          ? _value.heureNaissance
          : heureNaissance // ignore: cast_nullable_to_non_nullable
              as String?,
      lieuAccouchement: freezed == lieuAccouchement
          ? _value.lieuAccouchement
          : lieuAccouchement // ignore: cast_nullable_to_non_nullable
              as String?,
      formationSanitaire: freezed == formationSanitaire
          ? _value.formationSanitaire
          : formationSanitaire // ignore: cast_nullable_to_non_nullable
              as String?,
      naissanceMultiple: null == naissanceMultiple
          ? _value.naissanceMultiple
          : naissanceMultiple // ignore: cast_nullable_to_non_nullable
              as bool,
      typeNaissanceMultiple: freezed == typeNaissanceMultiple
          ? _value.typeNaissanceMultiple
          : typeNaissanceMultiple // ignore: cast_nullable_to_non_nullable
              as String?,
      rangEnfant: freezed == rangEnfant
          ? _value.rangEnfant
          : rangEnfant // ignore: cast_nullable_to_non_nullable
              as int?,
      lieuNaissance: null == lieuNaissance
          ? _value.lieuNaissance
          : lieuNaissance // ignore: cast_nullable_to_non_nullable
              as LieuAdministratif,
    ) as $Val);
  }

  /// Create a copy of NouveauNe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LieuAdministratifCopyWith<$Res> get lieuNaissance {
    return $LieuAdministratifCopyWith<$Res>(_value.lieuNaissance, (value) {
      return _then(_value.copyWith(lieuNaissance: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NouveauNeImplCopyWith<$Res>
    implements $NouveauNeCopyWith<$Res> {
  factory _$$NouveauNeImplCopyWith(
          _$NouveauNeImpl value, $Res Function(_$NouveauNeImpl) then) =
      __$$NouveauNeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? prenom,
      String? nom,
      Sexe? sexe,
      DateTime? dateNaissance,
      String? heureNaissance,
      String? lieuAccouchement,
      String? formationSanitaire,
      bool naissanceMultiple,
      String? typeNaissanceMultiple,
      int? rangEnfant,
      LieuAdministratif lieuNaissance});

  @override
  $LieuAdministratifCopyWith<$Res> get lieuNaissance;
}

/// @nodoc
class __$$NouveauNeImplCopyWithImpl<$Res>
    extends _$NouveauNeCopyWithImpl<$Res, _$NouveauNeImpl>
    implements _$$NouveauNeImplCopyWith<$Res> {
  __$$NouveauNeImplCopyWithImpl(
      _$NouveauNeImpl _value, $Res Function(_$NouveauNeImpl) _then)
      : super(_value, _then);

  /// Create a copy of NouveauNe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prenom = freezed,
    Object? nom = freezed,
    Object? sexe = freezed,
    Object? dateNaissance = freezed,
    Object? heureNaissance = freezed,
    Object? lieuAccouchement = freezed,
    Object? formationSanitaire = freezed,
    Object? naissanceMultiple = null,
    Object? typeNaissanceMultiple = freezed,
    Object? rangEnfant = freezed,
    Object? lieuNaissance = null,
  }) {
    return _then(_$NouveauNeImpl(
      prenom: freezed == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String?,
      nom: freezed == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String?,
      sexe: freezed == sexe
          ? _value.sexe
          : sexe // ignore: cast_nullable_to_non_nullable
              as Sexe?,
      dateNaissance: freezed == dateNaissance
          ? _value.dateNaissance
          : dateNaissance // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      heureNaissance: freezed == heureNaissance
          ? _value.heureNaissance
          : heureNaissance // ignore: cast_nullable_to_non_nullable
              as String?,
      lieuAccouchement: freezed == lieuAccouchement
          ? _value.lieuAccouchement
          : lieuAccouchement // ignore: cast_nullable_to_non_nullable
              as String?,
      formationSanitaire: freezed == formationSanitaire
          ? _value.formationSanitaire
          : formationSanitaire // ignore: cast_nullable_to_non_nullable
              as String?,
      naissanceMultiple: null == naissanceMultiple
          ? _value.naissanceMultiple
          : naissanceMultiple // ignore: cast_nullable_to_non_nullable
              as bool,
      typeNaissanceMultiple: freezed == typeNaissanceMultiple
          ? _value.typeNaissanceMultiple
          : typeNaissanceMultiple // ignore: cast_nullable_to_non_nullable
              as String?,
      rangEnfant: freezed == rangEnfant
          ? _value.rangEnfant
          : rangEnfant // ignore: cast_nullable_to_non_nullable
              as int?,
      lieuNaissance: null == lieuNaissance
          ? _value.lieuNaissance
          : lieuNaissance // ignore: cast_nullable_to_non_nullable
              as LieuAdministratif,
    ));
  }
}

/// @nodoc

class _$NouveauNeImpl implements _NouveauNe {
  const _$NouveauNeImpl(
      {this.prenom,
      this.nom,
      this.sexe,
      this.dateNaissance,
      this.heureNaissance,
      this.lieuAccouchement,
      this.formationSanitaire,
      this.naissanceMultiple = false,
      this.typeNaissanceMultiple,
      this.rangEnfant,
      this.lieuNaissance = const LieuAdministratif()});

  @override
  final String? prenom;
  @override
  final String? nom;
  @override
  final Sexe? sexe;
  @override
  final DateTime? dateNaissance;
  @override
  final String? heureNaissance;
  @override
  final String? lieuAccouchement;
  @override
  final String? formationSanitaire;
  @override
  @JsonKey()
  final bool naissanceMultiple;
  @override
  final String? typeNaissanceMultiple;
  @override
  final int? rangEnfant;
  @override
  @JsonKey()
  final LieuAdministratif lieuNaissance;

  @override
  String toString() {
    return 'NouveauNe(prenom: $prenom, nom: $nom, sexe: $sexe, dateNaissance: $dateNaissance, heureNaissance: $heureNaissance, lieuAccouchement: $lieuAccouchement, formationSanitaire: $formationSanitaire, naissanceMultiple: $naissanceMultiple, typeNaissanceMultiple: $typeNaissanceMultiple, rangEnfant: $rangEnfant, lieuNaissance: $lieuNaissance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NouveauNeImpl &&
            (identical(other.prenom, prenom) || other.prenom == prenom) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.sexe, sexe) || other.sexe == sexe) &&
            (identical(other.dateNaissance, dateNaissance) ||
                other.dateNaissance == dateNaissance) &&
            (identical(other.heureNaissance, heureNaissance) ||
                other.heureNaissance == heureNaissance) &&
            (identical(other.lieuAccouchement, lieuAccouchement) ||
                other.lieuAccouchement == lieuAccouchement) &&
            (identical(other.formationSanitaire, formationSanitaire) ||
                other.formationSanitaire == formationSanitaire) &&
            (identical(other.naissanceMultiple, naissanceMultiple) ||
                other.naissanceMultiple == naissanceMultiple) &&
            (identical(other.typeNaissanceMultiple, typeNaissanceMultiple) ||
                other.typeNaissanceMultiple == typeNaissanceMultiple) &&
            (identical(other.rangEnfant, rangEnfant) ||
                other.rangEnfant == rangEnfant) &&
            (identical(other.lieuNaissance, lieuNaissance) ||
                other.lieuNaissance == lieuNaissance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      prenom,
      nom,
      sexe,
      dateNaissance,
      heureNaissance,
      lieuAccouchement,
      formationSanitaire,
      naissanceMultiple,
      typeNaissanceMultiple,
      rangEnfant,
      lieuNaissance);

  /// Create a copy of NouveauNe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NouveauNeImplCopyWith<_$NouveauNeImpl> get copyWith =>
      __$$NouveauNeImplCopyWithImpl<_$NouveauNeImpl>(this, _$identity);
}

abstract class _NouveauNe implements NouveauNe {
  const factory _NouveauNe(
      {final String? prenom,
      final String? nom,
      final Sexe? sexe,
      final DateTime? dateNaissance,
      final String? heureNaissance,
      final String? lieuAccouchement,
      final String? formationSanitaire,
      final bool naissanceMultiple,
      final String? typeNaissanceMultiple,
      final int? rangEnfant,
      final LieuAdministratif lieuNaissance}) = _$NouveauNeImpl;

  @override
  String? get prenom;
  @override
  String? get nom;
  @override
  Sexe? get sexe;
  @override
  DateTime? get dateNaissance;
  @override
  String? get heureNaissance;
  @override
  String? get lieuAccouchement;
  @override
  String? get formationSanitaire;
  @override
  bool get naissanceMultiple;
  @override
  String? get typeNaissanceMultiple;
  @override
  int? get rangEnfant;
  @override
  LieuAdministratif get lieuNaissance;

  /// Create a copy of NouveauNe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NouveauNeImplCopyWith<_$NouveauNeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Parent {
  String? get npi => throw _privateConstructorUsedError;
  bool get connu => throw _privateConstructorUsedError;
  bool get decede => throw _privateConstructorUsedError;
  String? get prenom => throw _privateConstructorUsedError;
  String? get nom => throw _privateConstructorUsedError;
  DateTime? get dateNaissance => throw _privateConstructorUsedError;
  String? get nationalite => throw _privateConstructorUsedError;
  String? get profession => throw _privateConstructorUsedError;
  String? get telephone => throw _privateConstructorUsedError;
  String? get situationMatrimoniale => throw _privateConstructorUsedError;
  String? get adresse => throw _privateConstructorUsedError;
  LieuAdministratif get lieuNaissance => throw _privateConstructorUsedError;
  LieuAdministratif get domicile => throw _privateConstructorUsedError;

  /// Create a copy of Parent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParentCopyWith<Parent> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParentCopyWith<$Res> {
  factory $ParentCopyWith(Parent value, $Res Function(Parent) then) =
      _$ParentCopyWithImpl<$Res, Parent>;
  @useResult
  $Res call(
      {String? npi,
      bool connu,
      bool decede,
      String? prenom,
      String? nom,
      DateTime? dateNaissance,
      String? nationalite,
      String? profession,
      String? telephone,
      String? situationMatrimoniale,
      String? adresse,
      LieuAdministratif lieuNaissance,
      LieuAdministratif domicile});

  $LieuAdministratifCopyWith<$Res> get lieuNaissance;
  $LieuAdministratifCopyWith<$Res> get domicile;
}

/// @nodoc
class _$ParentCopyWithImpl<$Res, $Val extends Parent>
    implements $ParentCopyWith<$Res> {
  _$ParentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Parent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? npi = freezed,
    Object? connu = null,
    Object? decede = null,
    Object? prenom = freezed,
    Object? nom = freezed,
    Object? dateNaissance = freezed,
    Object? nationalite = freezed,
    Object? profession = freezed,
    Object? telephone = freezed,
    Object? situationMatrimoniale = freezed,
    Object? adresse = freezed,
    Object? lieuNaissance = null,
    Object? domicile = null,
  }) {
    return _then(_value.copyWith(
      npi: freezed == npi
          ? _value.npi
          : npi // ignore: cast_nullable_to_non_nullable
              as String?,
      connu: null == connu
          ? _value.connu
          : connu // ignore: cast_nullable_to_non_nullable
              as bool,
      decede: null == decede
          ? _value.decede
          : decede // ignore: cast_nullable_to_non_nullable
              as bool,
      prenom: freezed == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String?,
      nom: freezed == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String?,
      dateNaissance: freezed == dateNaissance
          ? _value.dateNaissance
          : dateNaissance // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nationalite: freezed == nationalite
          ? _value.nationalite
          : nationalite // ignore: cast_nullable_to_non_nullable
              as String?,
      profession: freezed == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String?,
      telephone: freezed == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String?,
      situationMatrimoniale: freezed == situationMatrimoniale
          ? _value.situationMatrimoniale
          : situationMatrimoniale // ignore: cast_nullable_to_non_nullable
              as String?,
      adresse: freezed == adresse
          ? _value.adresse
          : adresse // ignore: cast_nullable_to_non_nullable
              as String?,
      lieuNaissance: null == lieuNaissance
          ? _value.lieuNaissance
          : lieuNaissance // ignore: cast_nullable_to_non_nullable
              as LieuAdministratif,
      domicile: null == domicile
          ? _value.domicile
          : domicile // ignore: cast_nullable_to_non_nullable
              as LieuAdministratif,
    ) as $Val);
  }

  /// Create a copy of Parent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LieuAdministratifCopyWith<$Res> get lieuNaissance {
    return $LieuAdministratifCopyWith<$Res>(_value.lieuNaissance, (value) {
      return _then(_value.copyWith(lieuNaissance: value) as $Val);
    });
  }

  /// Create a copy of Parent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LieuAdministratifCopyWith<$Res> get domicile {
    return $LieuAdministratifCopyWith<$Res>(_value.domicile, (value) {
      return _then(_value.copyWith(domicile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ParentImplCopyWith<$Res> implements $ParentCopyWith<$Res> {
  factory _$$ParentImplCopyWith(
          _$ParentImpl value, $Res Function(_$ParentImpl) then) =
      __$$ParentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? npi,
      bool connu,
      bool decede,
      String? prenom,
      String? nom,
      DateTime? dateNaissance,
      String? nationalite,
      String? profession,
      String? telephone,
      String? situationMatrimoniale,
      String? adresse,
      LieuAdministratif lieuNaissance,
      LieuAdministratif domicile});

  @override
  $LieuAdministratifCopyWith<$Res> get lieuNaissance;
  @override
  $LieuAdministratifCopyWith<$Res> get domicile;
}

/// @nodoc
class __$$ParentImplCopyWithImpl<$Res>
    extends _$ParentCopyWithImpl<$Res, _$ParentImpl>
    implements _$$ParentImplCopyWith<$Res> {
  __$$ParentImplCopyWithImpl(
      _$ParentImpl _value, $Res Function(_$ParentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Parent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? npi = freezed,
    Object? connu = null,
    Object? decede = null,
    Object? prenom = freezed,
    Object? nom = freezed,
    Object? dateNaissance = freezed,
    Object? nationalite = freezed,
    Object? profession = freezed,
    Object? telephone = freezed,
    Object? situationMatrimoniale = freezed,
    Object? adresse = freezed,
    Object? lieuNaissance = null,
    Object? domicile = null,
  }) {
    return _then(_$ParentImpl(
      npi: freezed == npi
          ? _value.npi
          : npi // ignore: cast_nullable_to_non_nullable
              as String?,
      connu: null == connu
          ? _value.connu
          : connu // ignore: cast_nullable_to_non_nullable
              as bool,
      decede: null == decede
          ? _value.decede
          : decede // ignore: cast_nullable_to_non_nullable
              as bool,
      prenom: freezed == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String?,
      nom: freezed == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String?,
      dateNaissance: freezed == dateNaissance
          ? _value.dateNaissance
          : dateNaissance // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nationalite: freezed == nationalite
          ? _value.nationalite
          : nationalite // ignore: cast_nullable_to_non_nullable
              as String?,
      profession: freezed == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String?,
      telephone: freezed == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String?,
      situationMatrimoniale: freezed == situationMatrimoniale
          ? _value.situationMatrimoniale
          : situationMatrimoniale // ignore: cast_nullable_to_non_nullable
              as String?,
      adresse: freezed == adresse
          ? _value.adresse
          : adresse // ignore: cast_nullable_to_non_nullable
              as String?,
      lieuNaissance: null == lieuNaissance
          ? _value.lieuNaissance
          : lieuNaissance // ignore: cast_nullable_to_non_nullable
              as LieuAdministratif,
      domicile: null == domicile
          ? _value.domicile
          : domicile // ignore: cast_nullable_to_non_nullable
              as LieuAdministratif,
    ));
  }
}

/// @nodoc

class _$ParentImpl implements _Parent {
  const _$ParentImpl(
      {this.npi,
      this.connu = true,
      this.decede = false,
      this.prenom,
      this.nom,
      this.dateNaissance,
      this.nationalite,
      this.profession,
      this.telephone,
      this.situationMatrimoniale,
      this.adresse,
      this.lieuNaissance = const LieuAdministratif(),
      this.domicile = const LieuAdministratif()});

  @override
  final String? npi;
  @override
  @JsonKey()
  final bool connu;
  @override
  @JsonKey()
  final bool decede;
  @override
  final String? prenom;
  @override
  final String? nom;
  @override
  final DateTime? dateNaissance;
  @override
  final String? nationalite;
  @override
  final String? profession;
  @override
  final String? telephone;
  @override
  final String? situationMatrimoniale;
  @override
  final String? adresse;
  @override
  @JsonKey()
  final LieuAdministratif lieuNaissance;
  @override
  @JsonKey()
  final LieuAdministratif domicile;

  @override
  String toString() {
    return 'Parent(npi: $npi, connu: $connu, decede: $decede, prenom: $prenom, nom: $nom, dateNaissance: $dateNaissance, nationalite: $nationalite, profession: $profession, telephone: $telephone, situationMatrimoniale: $situationMatrimoniale, adresse: $adresse, lieuNaissance: $lieuNaissance, domicile: $domicile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParentImpl &&
            (identical(other.npi, npi) || other.npi == npi) &&
            (identical(other.connu, connu) || other.connu == connu) &&
            (identical(other.decede, decede) || other.decede == decede) &&
            (identical(other.prenom, prenom) || other.prenom == prenom) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.dateNaissance, dateNaissance) ||
                other.dateNaissance == dateNaissance) &&
            (identical(other.nationalite, nationalite) ||
                other.nationalite == nationalite) &&
            (identical(other.profession, profession) ||
                other.profession == profession) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.situationMatrimoniale, situationMatrimoniale) ||
                other.situationMatrimoniale == situationMatrimoniale) &&
            (identical(other.adresse, adresse) || other.adresse == adresse) &&
            (identical(other.lieuNaissance, lieuNaissance) ||
                other.lieuNaissance == lieuNaissance) &&
            (identical(other.domicile, domicile) ||
                other.domicile == domicile));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      npi,
      connu,
      decede,
      prenom,
      nom,
      dateNaissance,
      nationalite,
      profession,
      telephone,
      situationMatrimoniale,
      adresse,
      lieuNaissance,
      domicile);

  /// Create a copy of Parent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParentImplCopyWith<_$ParentImpl> get copyWith =>
      __$$ParentImplCopyWithImpl<_$ParentImpl>(this, _$identity);
}

abstract class _Parent implements Parent {
  const factory _Parent(
      {final String? npi,
      final bool connu,
      final bool decede,
      final String? prenom,
      final String? nom,
      final DateTime? dateNaissance,
      final String? nationalite,
      final String? profession,
      final String? telephone,
      final String? situationMatrimoniale,
      final String? adresse,
      final LieuAdministratif lieuNaissance,
      final LieuAdministratif domicile}) = _$ParentImpl;

  @override
  String? get npi;
  @override
  bool get connu;
  @override
  bool get decede;
  @override
  String? get prenom;
  @override
  String? get nom;
  @override
  DateTime? get dateNaissance;
  @override
  String? get nationalite;
  @override
  String? get profession;
  @override
  String? get telephone;
  @override
  String? get situationMatrimoniale;
  @override
  String? get adresse;
  @override
  LieuAdministratif get lieuNaissance;
  @override
  LieuAdministratif get domicile;

  /// Create a copy of Parent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParentImplCopyWith<_$ParentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Declarant {
  String? get npi => throw _privateConstructorUsedError;
  String? get qualite => throw _privateConstructorUsedError;
  String? get prenom => throw _privateConstructorUsedError;
  String? get nom => throw _privateConstructorUsedError;
  Sexe? get sexe => throw _privateConstructorUsedError;
  String? get telephone => throw _privateConstructorUsedError;
  DateTime? get dateDeclaration => throw _privateConstructorUsedError;

  /// Create a copy of Declarant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeclarantCopyWith<Declarant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeclarantCopyWith<$Res> {
  factory $DeclarantCopyWith(Declarant value, $Res Function(Declarant) then) =
      _$DeclarantCopyWithImpl<$Res, Declarant>;
  @useResult
  $Res call(
      {String? npi,
      String? qualite,
      String? prenom,
      String? nom,
      Sexe? sexe,
      String? telephone,
      DateTime? dateDeclaration});
}

/// @nodoc
class _$DeclarantCopyWithImpl<$Res, $Val extends Declarant>
    implements $DeclarantCopyWith<$Res> {
  _$DeclarantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Declarant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? npi = freezed,
    Object? qualite = freezed,
    Object? prenom = freezed,
    Object? nom = freezed,
    Object? sexe = freezed,
    Object? telephone = freezed,
    Object? dateDeclaration = freezed,
  }) {
    return _then(_value.copyWith(
      npi: freezed == npi
          ? _value.npi
          : npi // ignore: cast_nullable_to_non_nullable
              as String?,
      qualite: freezed == qualite
          ? _value.qualite
          : qualite // ignore: cast_nullable_to_non_nullable
              as String?,
      prenom: freezed == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String?,
      nom: freezed == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String?,
      sexe: freezed == sexe
          ? _value.sexe
          : sexe // ignore: cast_nullable_to_non_nullable
              as Sexe?,
      telephone: freezed == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String?,
      dateDeclaration: freezed == dateDeclaration
          ? _value.dateDeclaration
          : dateDeclaration // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeclarantImplCopyWith<$Res>
    implements $DeclarantCopyWith<$Res> {
  factory _$$DeclarantImplCopyWith(
          _$DeclarantImpl value, $Res Function(_$DeclarantImpl) then) =
      __$$DeclarantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? npi,
      String? qualite,
      String? prenom,
      String? nom,
      Sexe? sexe,
      String? telephone,
      DateTime? dateDeclaration});
}

/// @nodoc
class __$$DeclarantImplCopyWithImpl<$Res>
    extends _$DeclarantCopyWithImpl<$Res, _$DeclarantImpl>
    implements _$$DeclarantImplCopyWith<$Res> {
  __$$DeclarantImplCopyWithImpl(
      _$DeclarantImpl _value, $Res Function(_$DeclarantImpl) _then)
      : super(_value, _then);

  /// Create a copy of Declarant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? npi = freezed,
    Object? qualite = freezed,
    Object? prenom = freezed,
    Object? nom = freezed,
    Object? sexe = freezed,
    Object? telephone = freezed,
    Object? dateDeclaration = freezed,
  }) {
    return _then(_$DeclarantImpl(
      npi: freezed == npi
          ? _value.npi
          : npi // ignore: cast_nullable_to_non_nullable
              as String?,
      qualite: freezed == qualite
          ? _value.qualite
          : qualite // ignore: cast_nullable_to_non_nullable
              as String?,
      prenom: freezed == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String?,
      nom: freezed == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String?,
      sexe: freezed == sexe
          ? _value.sexe
          : sexe // ignore: cast_nullable_to_non_nullable
              as Sexe?,
      telephone: freezed == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String?,
      dateDeclaration: freezed == dateDeclaration
          ? _value.dateDeclaration
          : dateDeclaration // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$DeclarantImpl implements _Declarant {
  const _$DeclarantImpl(
      {this.npi,
      this.qualite,
      this.prenom,
      this.nom,
      this.sexe,
      this.telephone,
      this.dateDeclaration});

  @override
  final String? npi;
  @override
  final String? qualite;
  @override
  final String? prenom;
  @override
  final String? nom;
  @override
  final Sexe? sexe;
  @override
  final String? telephone;
  @override
  final DateTime? dateDeclaration;

  @override
  String toString() {
    return 'Declarant(npi: $npi, qualite: $qualite, prenom: $prenom, nom: $nom, sexe: $sexe, telephone: $telephone, dateDeclaration: $dateDeclaration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeclarantImpl &&
            (identical(other.npi, npi) || other.npi == npi) &&
            (identical(other.qualite, qualite) || other.qualite == qualite) &&
            (identical(other.prenom, prenom) || other.prenom == prenom) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.sexe, sexe) || other.sexe == sexe) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.dateDeclaration, dateDeclaration) ||
                other.dateDeclaration == dateDeclaration));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, npi, qualite, prenom, nom, sexe, telephone, dateDeclaration);

  /// Create a copy of Declarant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeclarantImplCopyWith<_$DeclarantImpl> get copyWith =>
      __$$DeclarantImplCopyWithImpl<_$DeclarantImpl>(this, _$identity);
}

abstract class _Declarant implements Declarant {
  const factory _Declarant(
      {final String? npi,
      final String? qualite,
      final String? prenom,
      final String? nom,
      final Sexe? sexe,
      final String? telephone,
      final DateTime? dateDeclaration}) = _$DeclarantImpl;

  @override
  String? get npi;
  @override
  String? get qualite;
  @override
  String? get prenom;
  @override
  String? get nom;
  @override
  Sexe? get sexe;
  @override
  String? get telephone;
  @override
  DateTime? get dateDeclaration;

  /// Create a copy of Declarant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeclarantImplCopyWith<_$DeclarantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PieceJointe {
  String get id => throw _privateConstructorUsedError;
  String get nomFichier => throw _privateConstructorUsedError;
  String get cheminLocal => throw _privateConstructorUsedError;
  TypePieceJointe get type => throw _privateConstructorUsedError;
  int? get tailleOctets => throw _privateConstructorUsedError;

  /// Create a copy of PieceJointe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PieceJointeCopyWith<PieceJointe> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PieceJointeCopyWith<$Res> {
  factory $PieceJointeCopyWith(
          PieceJointe value, $Res Function(PieceJointe) then) =
      _$PieceJointeCopyWithImpl<$Res, PieceJointe>;
  @useResult
  $Res call(
      {String id,
      String nomFichier,
      String cheminLocal,
      TypePieceJointe type,
      int? tailleOctets});
}

/// @nodoc
class _$PieceJointeCopyWithImpl<$Res, $Val extends PieceJointe>
    implements $PieceJointeCopyWith<$Res> {
  _$PieceJointeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PieceJointe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nomFichier = null,
    Object? cheminLocal = null,
    Object? type = null,
    Object? tailleOctets = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nomFichier: null == nomFichier
          ? _value.nomFichier
          : nomFichier // ignore: cast_nullable_to_non_nullable
              as String,
      cheminLocal: null == cheminLocal
          ? _value.cheminLocal
          : cheminLocal // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypePieceJointe,
      tailleOctets: freezed == tailleOctets
          ? _value.tailleOctets
          : tailleOctets // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PieceJointeImplCopyWith<$Res>
    implements $PieceJointeCopyWith<$Res> {
  factory _$$PieceJointeImplCopyWith(
          _$PieceJointeImpl value, $Res Function(_$PieceJointeImpl) then) =
      __$$PieceJointeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String nomFichier,
      String cheminLocal,
      TypePieceJointe type,
      int? tailleOctets});
}

/// @nodoc
class __$$PieceJointeImplCopyWithImpl<$Res>
    extends _$PieceJointeCopyWithImpl<$Res, _$PieceJointeImpl>
    implements _$$PieceJointeImplCopyWith<$Res> {
  __$$PieceJointeImplCopyWithImpl(
      _$PieceJointeImpl _value, $Res Function(_$PieceJointeImpl) _then)
      : super(_value, _then);

  /// Create a copy of PieceJointe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nomFichier = null,
    Object? cheminLocal = null,
    Object? type = null,
    Object? tailleOctets = freezed,
  }) {
    return _then(_$PieceJointeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nomFichier: null == nomFichier
          ? _value.nomFichier
          : nomFichier // ignore: cast_nullable_to_non_nullable
              as String,
      cheminLocal: null == cheminLocal
          ? _value.cheminLocal
          : cheminLocal // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypePieceJointe,
      tailleOctets: freezed == tailleOctets
          ? _value.tailleOctets
          : tailleOctets // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$PieceJointeImpl implements _PieceJointe {
  const _$PieceJointeImpl(
      {required this.id,
      required this.nomFichier,
      required this.cheminLocal,
      required this.type,
      this.tailleOctets});

  @override
  final String id;
  @override
  final String nomFichier;
  @override
  final String cheminLocal;
  @override
  final TypePieceJointe type;
  @override
  final int? tailleOctets;

  @override
  String toString() {
    return 'PieceJointe(id: $id, nomFichier: $nomFichier, cheminLocal: $cheminLocal, type: $type, tailleOctets: $tailleOctets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PieceJointeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nomFichier, nomFichier) ||
                other.nomFichier == nomFichier) &&
            (identical(other.cheminLocal, cheminLocal) ||
                other.cheminLocal == cheminLocal) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.tailleOctets, tailleOctets) ||
                other.tailleOctets == tailleOctets));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, nomFichier, cheminLocal, type, tailleOctets);

  /// Create a copy of PieceJointe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PieceJointeImplCopyWith<_$PieceJointeImpl> get copyWith =>
      __$$PieceJointeImplCopyWithImpl<_$PieceJointeImpl>(this, _$identity);
}

abstract class _PieceJointe implements PieceJointe {
  const factory _PieceJointe(
      {required final String id,
      required final String nomFichier,
      required final String cheminLocal,
      required final TypePieceJointe type,
      final int? tailleOctets}) = _$PieceJointeImpl;

  @override
  String get id;
  @override
  String get nomFichier;
  @override
  String get cheminLocal;
  @override
  TypePieceJointe get type;
  @override
  int? get tailleOctets;

  /// Create a copy of PieceJointe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PieceJointeImplCopyWith<_$PieceJointeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DeclarationNaissance {
  /// Clé d'idempotence (anti-doublon lors de la synchronisation hors ligne).
  String get idempotencyKey => throw _privateConstructorUsedError;
  TypeDeclaration get type => throw _privateConstructorUsedError;
  NouveauNe get nouveauNe => throw _privateConstructorUsedError;
  Parent get pere => throw _privateConstructorUsedError;
  Parent get mere => throw _privateConstructorUsedError;
  Declarant get declarant => throw _privateConstructorUsedError;
  Geolocalisation get geolocalisation => throw _privateConstructorUsedError;
  List<PieceJointe> get pieces => throw _privateConstructorUsedError;
  bool get parentsMaries => throw _privateConstructorUsedError;

  /// Create a copy of DeclarationNaissance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeclarationNaissanceCopyWith<DeclarationNaissance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeclarationNaissanceCopyWith<$Res> {
  factory $DeclarationNaissanceCopyWith(DeclarationNaissance value,
          $Res Function(DeclarationNaissance) then) =
      _$DeclarationNaissanceCopyWithImpl<$Res, DeclarationNaissance>;
  @useResult
  $Res call(
      {String idempotencyKey,
      TypeDeclaration type,
      NouveauNe nouveauNe,
      Parent pere,
      Parent mere,
      Declarant declarant,
      Geolocalisation geolocalisation,
      List<PieceJointe> pieces,
      bool parentsMaries});

  $NouveauNeCopyWith<$Res> get nouveauNe;
  $ParentCopyWith<$Res> get pere;
  $ParentCopyWith<$Res> get mere;
  $DeclarantCopyWith<$Res> get declarant;
  $GeolocalisationCopyWith<$Res> get geolocalisation;
}

/// @nodoc
class _$DeclarationNaissanceCopyWithImpl<$Res,
        $Val extends DeclarationNaissance>
    implements $DeclarationNaissanceCopyWith<$Res> {
  _$DeclarationNaissanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeclarationNaissance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idempotencyKey = null,
    Object? type = null,
    Object? nouveauNe = null,
    Object? pere = null,
    Object? mere = null,
    Object? declarant = null,
    Object? geolocalisation = null,
    Object? pieces = null,
    Object? parentsMaries = null,
  }) {
    return _then(_value.copyWith(
      idempotencyKey: null == idempotencyKey
          ? _value.idempotencyKey
          : idempotencyKey // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeDeclaration,
      nouveauNe: null == nouveauNe
          ? _value.nouveauNe
          : nouveauNe // ignore: cast_nullable_to_non_nullable
              as NouveauNe,
      pere: null == pere
          ? _value.pere
          : pere // ignore: cast_nullable_to_non_nullable
              as Parent,
      mere: null == mere
          ? _value.mere
          : mere // ignore: cast_nullable_to_non_nullable
              as Parent,
      declarant: null == declarant
          ? _value.declarant
          : declarant // ignore: cast_nullable_to_non_nullable
              as Declarant,
      geolocalisation: null == geolocalisation
          ? _value.geolocalisation
          : geolocalisation // ignore: cast_nullable_to_non_nullable
              as Geolocalisation,
      pieces: null == pieces
          ? _value.pieces
          : pieces // ignore: cast_nullable_to_non_nullable
              as List<PieceJointe>,
      parentsMaries: null == parentsMaries
          ? _value.parentsMaries
          : parentsMaries // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of DeclarationNaissance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NouveauNeCopyWith<$Res> get nouveauNe {
    return $NouveauNeCopyWith<$Res>(_value.nouveauNe, (value) {
      return _then(_value.copyWith(nouveauNe: value) as $Val);
    });
  }

  /// Create a copy of DeclarationNaissance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ParentCopyWith<$Res> get pere {
    return $ParentCopyWith<$Res>(_value.pere, (value) {
      return _then(_value.copyWith(pere: value) as $Val);
    });
  }

  /// Create a copy of DeclarationNaissance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ParentCopyWith<$Res> get mere {
    return $ParentCopyWith<$Res>(_value.mere, (value) {
      return _then(_value.copyWith(mere: value) as $Val);
    });
  }

  /// Create a copy of DeclarationNaissance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeclarantCopyWith<$Res> get declarant {
    return $DeclarantCopyWith<$Res>(_value.declarant, (value) {
      return _then(_value.copyWith(declarant: value) as $Val);
    });
  }

  /// Create a copy of DeclarationNaissance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeolocalisationCopyWith<$Res> get geolocalisation {
    return $GeolocalisationCopyWith<$Res>(_value.geolocalisation, (value) {
      return _then(_value.copyWith(geolocalisation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeclarationNaissanceImplCopyWith<$Res>
    implements $DeclarationNaissanceCopyWith<$Res> {
  factory _$$DeclarationNaissanceImplCopyWith(_$DeclarationNaissanceImpl value,
          $Res Function(_$DeclarationNaissanceImpl) then) =
      __$$DeclarationNaissanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idempotencyKey,
      TypeDeclaration type,
      NouveauNe nouveauNe,
      Parent pere,
      Parent mere,
      Declarant declarant,
      Geolocalisation geolocalisation,
      List<PieceJointe> pieces,
      bool parentsMaries});

  @override
  $NouveauNeCopyWith<$Res> get nouveauNe;
  @override
  $ParentCopyWith<$Res> get pere;
  @override
  $ParentCopyWith<$Res> get mere;
  @override
  $DeclarantCopyWith<$Res> get declarant;
  @override
  $GeolocalisationCopyWith<$Res> get geolocalisation;
}

/// @nodoc
class __$$DeclarationNaissanceImplCopyWithImpl<$Res>
    extends _$DeclarationNaissanceCopyWithImpl<$Res, _$DeclarationNaissanceImpl>
    implements _$$DeclarationNaissanceImplCopyWith<$Res> {
  __$$DeclarationNaissanceImplCopyWithImpl(_$DeclarationNaissanceImpl _value,
      $Res Function(_$DeclarationNaissanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeclarationNaissance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idempotencyKey = null,
    Object? type = null,
    Object? nouveauNe = null,
    Object? pere = null,
    Object? mere = null,
    Object? declarant = null,
    Object? geolocalisation = null,
    Object? pieces = null,
    Object? parentsMaries = null,
  }) {
    return _then(_$DeclarationNaissanceImpl(
      idempotencyKey: null == idempotencyKey
          ? _value.idempotencyKey
          : idempotencyKey // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeDeclaration,
      nouveauNe: null == nouveauNe
          ? _value.nouveauNe
          : nouveauNe // ignore: cast_nullable_to_non_nullable
              as NouveauNe,
      pere: null == pere
          ? _value.pere
          : pere // ignore: cast_nullable_to_non_nullable
              as Parent,
      mere: null == mere
          ? _value.mere
          : mere // ignore: cast_nullable_to_non_nullable
              as Parent,
      declarant: null == declarant
          ? _value.declarant
          : declarant // ignore: cast_nullable_to_non_nullable
              as Declarant,
      geolocalisation: null == geolocalisation
          ? _value.geolocalisation
          : geolocalisation // ignore: cast_nullable_to_non_nullable
              as Geolocalisation,
      pieces: null == pieces
          ? _value._pieces
          : pieces // ignore: cast_nullable_to_non_nullable
              as List<PieceJointe>,
      parentsMaries: null == parentsMaries
          ? _value.parentsMaries
          : parentsMaries // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DeclarationNaissanceImpl implements _DeclarationNaissance {
  const _$DeclarationNaissanceImpl(
      {required this.idempotencyKey,
      this.type = TypeDeclaration.declaration,
      this.nouveauNe = const NouveauNe(),
      this.pere = const Parent(),
      this.mere = const Parent(),
      this.declarant = const Declarant(),
      this.geolocalisation = const Geolocalisation(),
      final List<PieceJointe> pieces = const <PieceJointe>[],
      this.parentsMaries = false})
      : _pieces = pieces;

  /// Clé d'idempotence (anti-doublon lors de la synchronisation hors ligne).
  @override
  final String idempotencyKey;
  @override
  @JsonKey()
  final TypeDeclaration type;
  @override
  @JsonKey()
  final NouveauNe nouveauNe;
  @override
  @JsonKey()
  final Parent pere;
  @override
  @JsonKey()
  final Parent mere;
  @override
  @JsonKey()
  final Declarant declarant;
  @override
  @JsonKey()
  final Geolocalisation geolocalisation;
  final List<PieceJointe> _pieces;
  @override
  @JsonKey()
  List<PieceJointe> get pieces {
    if (_pieces is EqualUnmodifiableListView) return _pieces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pieces);
  }

  @override
  @JsonKey()
  final bool parentsMaries;

  @override
  String toString() {
    return 'DeclarationNaissance(idempotencyKey: $idempotencyKey, type: $type, nouveauNe: $nouveauNe, pere: $pere, mere: $mere, declarant: $declarant, geolocalisation: $geolocalisation, pieces: $pieces, parentsMaries: $parentsMaries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeclarationNaissanceImpl &&
            (identical(other.idempotencyKey, idempotencyKey) ||
                other.idempotencyKey == idempotencyKey) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.nouveauNe, nouveauNe) ||
                other.nouveauNe == nouveauNe) &&
            (identical(other.pere, pere) || other.pere == pere) &&
            (identical(other.mere, mere) || other.mere == mere) &&
            (identical(other.declarant, declarant) ||
                other.declarant == declarant) &&
            (identical(other.geolocalisation, geolocalisation) ||
                other.geolocalisation == geolocalisation) &&
            const DeepCollectionEquality().equals(other._pieces, _pieces) &&
            (identical(other.parentsMaries, parentsMaries) ||
                other.parentsMaries == parentsMaries));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      idempotencyKey,
      type,
      nouveauNe,
      pere,
      mere,
      declarant,
      geolocalisation,
      const DeepCollectionEquality().hash(_pieces),
      parentsMaries);

  /// Create a copy of DeclarationNaissance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeclarationNaissanceImplCopyWith<_$DeclarationNaissanceImpl>
      get copyWith =>
          __$$DeclarationNaissanceImplCopyWithImpl<_$DeclarationNaissanceImpl>(
              this, _$identity);
}

abstract class _DeclarationNaissance implements DeclarationNaissance {
  const factory _DeclarationNaissance(
      {required final String idempotencyKey,
      final TypeDeclaration type,
      final NouveauNe nouveauNe,
      final Parent pere,
      final Parent mere,
      final Declarant declarant,
      final Geolocalisation geolocalisation,
      final List<PieceJointe> pieces,
      final bool parentsMaries}) = _$DeclarationNaissanceImpl;

  /// Clé d'idempotence (anti-doublon lors de la synchronisation hors ligne).
  @override
  String get idempotencyKey;
  @override
  TypeDeclaration get type;
  @override
  NouveauNe get nouveauNe;
  @override
  Parent get pere;
  @override
  Parent get mere;
  @override
  Declarant get declarant;
  @override
  Geolocalisation get geolocalisation;
  @override
  List<PieceJointe> get pieces;
  @override
  bool get parentsMaries;

  /// Create a copy of DeclarationNaissance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeclarationNaissanceImplCopyWith<_$DeclarationNaissanceImpl>
      get copyWith => throw _privateConstructorUsedError;
}
