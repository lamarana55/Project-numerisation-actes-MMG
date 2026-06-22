// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'declaration_deces.dart';

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
      {String? pays, String? region, String? prefecture, String? commune});
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
      {String? pays, String? region, String? prefecture, String? commune});
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
    ));
  }
}

/// @nodoc

class _$LieuAdministratifImpl implements _LieuAdministratif {
  const _$LieuAdministratifImpl(
      {this.pays, this.region, this.prefecture, this.commune});

  @override
  final String? pays;
  @override
  final String? region;
  @override
  final String? prefecture;
  @override
  final String? commune;

  @override
  String toString() {
    return 'LieuAdministratif(pays: $pays, region: $region, prefecture: $prefecture, commune: $commune)';
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
            (identical(other.commune, commune) || other.commune == commune));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, pays, region, prefecture, commune);

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
      final String? commune}) = _$LieuAdministratifImpl;

  @override
  String? get pays;
  @override
  String? get region;
  @override
  String? get prefecture;
  @override
  String? get commune;

  /// Create a copy of LieuAdministratif
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LieuAdministratifImplCopyWith<_$LieuAdministratifImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Defunt {
  String? get prenom => throw _privateConstructorUsedError;
  String? get nom => throw _privateConstructorUsedError;
  Sexe? get sexe => throw _privateConstructorUsedError;
  DateTime? get dateNaissance => throw _privateConstructorUsedError;
  String? get nationalite => throw _privateConstructorUsedError;
  String? get profession => throw _privateConstructorUsedError;
  String? get situationMatrimoniale => throw _privateConstructorUsedError;
  LieuAdministratif get lieuNaissance => throw _privateConstructorUsedError;

  /// Create a copy of Defunt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DefuntCopyWith<Defunt> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefuntCopyWith<$Res> {
  factory $DefuntCopyWith(Defunt value, $Res Function(Defunt) then) =
      _$DefuntCopyWithImpl<$Res, Defunt>;
  @useResult
  $Res call(
      {String? prenom,
      String? nom,
      Sexe? sexe,
      DateTime? dateNaissance,
      String? nationalite,
      String? profession,
      String? situationMatrimoniale,
      LieuAdministratif lieuNaissance});

  $LieuAdministratifCopyWith<$Res> get lieuNaissance;
}

/// @nodoc
class _$DefuntCopyWithImpl<$Res, $Val extends Defunt>
    implements $DefuntCopyWith<$Res> {
  _$DefuntCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Defunt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prenom = freezed,
    Object? nom = freezed,
    Object? sexe = freezed,
    Object? dateNaissance = freezed,
    Object? nationalite = freezed,
    Object? profession = freezed,
    Object? situationMatrimoniale = freezed,
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
      nationalite: freezed == nationalite
          ? _value.nationalite
          : nationalite // ignore: cast_nullable_to_non_nullable
              as String?,
      profession: freezed == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String?,
      situationMatrimoniale: freezed == situationMatrimoniale
          ? _value.situationMatrimoniale
          : situationMatrimoniale // ignore: cast_nullable_to_non_nullable
              as String?,
      lieuNaissance: null == lieuNaissance
          ? _value.lieuNaissance
          : lieuNaissance // ignore: cast_nullable_to_non_nullable
              as LieuAdministratif,
    ) as $Val);
  }

  /// Create a copy of Defunt
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
abstract class _$$DefuntImplCopyWith<$Res> implements $DefuntCopyWith<$Res> {
  factory _$$DefuntImplCopyWith(
          _$DefuntImpl value, $Res Function(_$DefuntImpl) then) =
      __$$DefuntImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? prenom,
      String? nom,
      Sexe? sexe,
      DateTime? dateNaissance,
      String? nationalite,
      String? profession,
      String? situationMatrimoniale,
      LieuAdministratif lieuNaissance});

  @override
  $LieuAdministratifCopyWith<$Res> get lieuNaissance;
}

/// @nodoc
class __$$DefuntImplCopyWithImpl<$Res>
    extends _$DefuntCopyWithImpl<$Res, _$DefuntImpl>
    implements _$$DefuntImplCopyWith<$Res> {
  __$$DefuntImplCopyWithImpl(
      _$DefuntImpl _value, $Res Function(_$DefuntImpl) _then)
      : super(_value, _then);

  /// Create a copy of Defunt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prenom = freezed,
    Object? nom = freezed,
    Object? sexe = freezed,
    Object? dateNaissance = freezed,
    Object? nationalite = freezed,
    Object? profession = freezed,
    Object? situationMatrimoniale = freezed,
    Object? lieuNaissance = null,
  }) {
    return _then(_$DefuntImpl(
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
      nationalite: freezed == nationalite
          ? _value.nationalite
          : nationalite // ignore: cast_nullable_to_non_nullable
              as String?,
      profession: freezed == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String?,
      situationMatrimoniale: freezed == situationMatrimoniale
          ? _value.situationMatrimoniale
          : situationMatrimoniale // ignore: cast_nullable_to_non_nullable
              as String?,
      lieuNaissance: null == lieuNaissance
          ? _value.lieuNaissance
          : lieuNaissance // ignore: cast_nullable_to_non_nullable
              as LieuAdministratif,
    ));
  }
}

/// @nodoc

class _$DefuntImpl implements _Defunt {
  const _$DefuntImpl(
      {this.prenom,
      this.nom,
      this.sexe,
      this.dateNaissance,
      this.nationalite,
      this.profession,
      this.situationMatrimoniale,
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
  final String? nationalite;
  @override
  final String? profession;
  @override
  final String? situationMatrimoniale;
  @override
  @JsonKey()
  final LieuAdministratif lieuNaissance;

  @override
  String toString() {
    return 'Defunt(prenom: $prenom, nom: $nom, sexe: $sexe, dateNaissance: $dateNaissance, nationalite: $nationalite, profession: $profession, situationMatrimoniale: $situationMatrimoniale, lieuNaissance: $lieuNaissance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DefuntImpl &&
            (identical(other.prenom, prenom) || other.prenom == prenom) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.sexe, sexe) || other.sexe == sexe) &&
            (identical(other.dateNaissance, dateNaissance) ||
                other.dateNaissance == dateNaissance) &&
            (identical(other.nationalite, nationalite) ||
                other.nationalite == nationalite) &&
            (identical(other.profession, profession) ||
                other.profession == profession) &&
            (identical(other.situationMatrimoniale, situationMatrimoniale) ||
                other.situationMatrimoniale == situationMatrimoniale) &&
            (identical(other.lieuNaissance, lieuNaissance) ||
                other.lieuNaissance == lieuNaissance));
  }

  @override
  int get hashCode => Object.hash(runtimeType, prenom, nom, sexe, dateNaissance,
      nationalite, profession, situationMatrimoniale, lieuNaissance);

  /// Create a copy of Defunt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DefuntImplCopyWith<_$DefuntImpl> get copyWith =>
      __$$DefuntImplCopyWithImpl<_$DefuntImpl>(this, _$identity);
}

abstract class _Defunt implements Defunt {
  const factory _Defunt(
      {final String? prenom,
      final String? nom,
      final Sexe? sexe,
      final DateTime? dateNaissance,
      final String? nationalite,
      final String? profession,
      final String? situationMatrimoniale,
      final LieuAdministratif lieuNaissance}) = _$DefuntImpl;

  @override
  String? get prenom;
  @override
  String? get nom;
  @override
  Sexe? get sexe;
  @override
  DateTime? get dateNaissance;
  @override
  String? get nationalite;
  @override
  String? get profession;
  @override
  String? get situationMatrimoniale;
  @override
  LieuAdministratif get lieuNaissance;

  /// Create a copy of Defunt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DefuntImplCopyWith<_$DefuntImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InformationsDeces {
  DateTime? get dateDeces => throw _privateConstructorUsedError;
  String? get heureDeces => throw _privateConstructorUsedError;
  String? get lieuDeces => throw _privateConstructorUsedError;
  String? get causeDeces => throw _privateConstructorUsedError;
  String? get typeDeces => throw _privateConstructorUsedError;

  /// Create a copy of InformationsDeces
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InformationsDecesCopyWith<InformationsDeces> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InformationsDecesCopyWith<$Res> {
  factory $InformationsDecesCopyWith(
          InformationsDeces value, $Res Function(InformationsDeces) then) =
      _$InformationsDecesCopyWithImpl<$Res, InformationsDeces>;
  @useResult
  $Res call(
      {DateTime? dateDeces,
      String? heureDeces,
      String? lieuDeces,
      String? causeDeces,
      String? typeDeces});
}

/// @nodoc
class _$InformationsDecesCopyWithImpl<$Res, $Val extends InformationsDeces>
    implements $InformationsDecesCopyWith<$Res> {
  _$InformationsDecesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InformationsDeces
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateDeces = freezed,
    Object? heureDeces = freezed,
    Object? lieuDeces = freezed,
    Object? causeDeces = freezed,
    Object? typeDeces = freezed,
  }) {
    return _then(_value.copyWith(
      dateDeces: freezed == dateDeces
          ? _value.dateDeces
          : dateDeces // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      heureDeces: freezed == heureDeces
          ? _value.heureDeces
          : heureDeces // ignore: cast_nullable_to_non_nullable
              as String?,
      lieuDeces: freezed == lieuDeces
          ? _value.lieuDeces
          : lieuDeces // ignore: cast_nullable_to_non_nullable
              as String?,
      causeDeces: freezed == causeDeces
          ? _value.causeDeces
          : causeDeces // ignore: cast_nullable_to_non_nullable
              as String?,
      typeDeces: freezed == typeDeces
          ? _value.typeDeces
          : typeDeces // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InformationsDecesImplCopyWith<$Res>
    implements $InformationsDecesCopyWith<$Res> {
  factory _$$InformationsDecesImplCopyWith(_$InformationsDecesImpl value,
          $Res Function(_$InformationsDecesImpl) then) =
      __$$InformationsDecesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? dateDeces,
      String? heureDeces,
      String? lieuDeces,
      String? causeDeces,
      String? typeDeces});
}

/// @nodoc
class __$$InformationsDecesImplCopyWithImpl<$Res>
    extends _$InformationsDecesCopyWithImpl<$Res, _$InformationsDecesImpl>
    implements _$$InformationsDecesImplCopyWith<$Res> {
  __$$InformationsDecesImplCopyWithImpl(_$InformationsDecesImpl _value,
      $Res Function(_$InformationsDecesImpl) _then)
      : super(_value, _then);

  /// Create a copy of InformationsDeces
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateDeces = freezed,
    Object? heureDeces = freezed,
    Object? lieuDeces = freezed,
    Object? causeDeces = freezed,
    Object? typeDeces = freezed,
  }) {
    return _then(_$InformationsDecesImpl(
      dateDeces: freezed == dateDeces
          ? _value.dateDeces
          : dateDeces // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      heureDeces: freezed == heureDeces
          ? _value.heureDeces
          : heureDeces // ignore: cast_nullable_to_non_nullable
              as String?,
      lieuDeces: freezed == lieuDeces
          ? _value.lieuDeces
          : lieuDeces // ignore: cast_nullable_to_non_nullable
              as String?,
      causeDeces: freezed == causeDeces
          ? _value.causeDeces
          : causeDeces // ignore: cast_nullable_to_non_nullable
              as String?,
      typeDeces: freezed == typeDeces
          ? _value.typeDeces
          : typeDeces // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InformationsDecesImpl implements _InformationsDeces {
  const _$InformationsDecesImpl(
      {this.dateDeces,
      this.heureDeces,
      this.lieuDeces,
      this.causeDeces,
      this.typeDeces});

  @override
  final DateTime? dateDeces;
  @override
  final String? heureDeces;
  @override
  final String? lieuDeces;
  @override
  final String? causeDeces;
  @override
  final String? typeDeces;

  @override
  String toString() {
    return 'InformationsDeces(dateDeces: $dateDeces, heureDeces: $heureDeces, lieuDeces: $lieuDeces, causeDeces: $causeDeces, typeDeces: $typeDeces)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InformationsDecesImpl &&
            (identical(other.dateDeces, dateDeces) ||
                other.dateDeces == dateDeces) &&
            (identical(other.heureDeces, heureDeces) ||
                other.heureDeces == heureDeces) &&
            (identical(other.lieuDeces, lieuDeces) ||
                other.lieuDeces == lieuDeces) &&
            (identical(other.causeDeces, causeDeces) ||
                other.causeDeces == causeDeces) &&
            (identical(other.typeDeces, typeDeces) ||
                other.typeDeces == typeDeces));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, dateDeces, heureDeces, lieuDeces, causeDeces, typeDeces);

  /// Create a copy of InformationsDeces
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InformationsDecesImplCopyWith<_$InformationsDecesImpl> get copyWith =>
      __$$InformationsDecesImplCopyWithImpl<_$InformationsDecesImpl>(
          this, _$identity);
}

abstract class _InformationsDeces implements InformationsDeces {
  const factory _InformationsDeces(
      {final DateTime? dateDeces,
      final String? heureDeces,
      final String? lieuDeces,
      final String? causeDeces,
      final String? typeDeces}) = _$InformationsDecesImpl;

  @override
  DateTime? get dateDeces;
  @override
  String? get heureDeces;
  @override
  String? get lieuDeces;
  @override
  String? get causeDeces;
  @override
  String? get typeDeces;

  /// Create a copy of InformationsDeces
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InformationsDecesImplCopyWith<_$InformationsDecesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Conjoint {
  bool get connu => throw _privateConstructorUsedError;
  String? get prenom => throw _privateConstructorUsedError;
  String? get nom => throw _privateConstructorUsedError;
  Sexe? get sexe => throw _privateConstructorUsedError;
  String? get nationalite => throw _privateConstructorUsedError;
  String? get profession => throw _privateConstructorUsedError;

  /// Create a copy of Conjoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConjointCopyWith<Conjoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConjointCopyWith<$Res> {
  factory $ConjointCopyWith(Conjoint value, $Res Function(Conjoint) then) =
      _$ConjointCopyWithImpl<$Res, Conjoint>;
  @useResult
  $Res call(
      {bool connu,
      String? prenom,
      String? nom,
      Sexe? sexe,
      String? nationalite,
      String? profession});
}

/// @nodoc
class _$ConjointCopyWithImpl<$Res, $Val extends Conjoint>
    implements $ConjointCopyWith<$Res> {
  _$ConjointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Conjoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connu = null,
    Object? prenom = freezed,
    Object? nom = freezed,
    Object? sexe = freezed,
    Object? nationalite = freezed,
    Object? profession = freezed,
  }) {
    return _then(_value.copyWith(
      connu: null == connu
          ? _value.connu
          : connu // ignore: cast_nullable_to_non_nullable
              as bool,
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
      nationalite: freezed == nationalite
          ? _value.nationalite
          : nationalite // ignore: cast_nullable_to_non_nullable
              as String?,
      profession: freezed == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConjointImplCopyWith<$Res>
    implements $ConjointCopyWith<$Res> {
  factory _$$ConjointImplCopyWith(
          _$ConjointImpl value, $Res Function(_$ConjointImpl) then) =
      __$$ConjointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool connu,
      String? prenom,
      String? nom,
      Sexe? sexe,
      String? nationalite,
      String? profession});
}

/// @nodoc
class __$$ConjointImplCopyWithImpl<$Res>
    extends _$ConjointCopyWithImpl<$Res, _$ConjointImpl>
    implements _$$ConjointImplCopyWith<$Res> {
  __$$ConjointImplCopyWithImpl(
      _$ConjointImpl _value, $Res Function(_$ConjointImpl) _then)
      : super(_value, _then);

  /// Create a copy of Conjoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connu = null,
    Object? prenom = freezed,
    Object? nom = freezed,
    Object? sexe = freezed,
    Object? nationalite = freezed,
    Object? profession = freezed,
  }) {
    return _then(_$ConjointImpl(
      connu: null == connu
          ? _value.connu
          : connu // ignore: cast_nullable_to_non_nullable
              as bool,
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
      nationalite: freezed == nationalite
          ? _value.nationalite
          : nationalite // ignore: cast_nullable_to_non_nullable
              as String?,
      profession: freezed == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ConjointImpl implements _Conjoint {
  const _$ConjointImpl(
      {this.connu = false,
      this.prenom,
      this.nom,
      this.sexe,
      this.nationalite,
      this.profession});

  @override
  @JsonKey()
  final bool connu;
  @override
  final String? prenom;
  @override
  final String? nom;
  @override
  final Sexe? sexe;
  @override
  final String? nationalite;
  @override
  final String? profession;

  @override
  String toString() {
    return 'Conjoint(connu: $connu, prenom: $prenom, nom: $nom, sexe: $sexe, nationalite: $nationalite, profession: $profession)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConjointImpl &&
            (identical(other.connu, connu) || other.connu == connu) &&
            (identical(other.prenom, prenom) || other.prenom == prenom) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.sexe, sexe) || other.sexe == sexe) &&
            (identical(other.nationalite, nationalite) ||
                other.nationalite == nationalite) &&
            (identical(other.profession, profession) ||
                other.profession == profession));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, connu, prenom, nom, sexe, nationalite, profession);

  /// Create a copy of Conjoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConjointImplCopyWith<_$ConjointImpl> get copyWith =>
      __$$ConjointImplCopyWithImpl<_$ConjointImpl>(this, _$identity);
}

abstract class _Conjoint implements Conjoint {
  const factory _Conjoint(
      {final bool connu,
      final String? prenom,
      final String? nom,
      final Sexe? sexe,
      final String? nationalite,
      final String? profession}) = _$ConjointImpl;

  @override
  bool get connu;
  @override
  String? get prenom;
  @override
  String? get nom;
  @override
  Sexe? get sexe;
  @override
  String? get nationalite;
  @override
  String? get profession;

  /// Create a copy of Conjoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConjointImplCopyWith<_$ConjointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ParentDefunt {
  String? get prenom => throw _privateConstructorUsedError;
  String? get nom => throw _privateConstructorUsedError;
  DateTime? get dateNaissance => throw _privateConstructorUsedError;
  String? get nationalite => throw _privateConstructorUsedError;
  String? get profession => throw _privateConstructorUsedError;

  /// Create a copy of ParentDefunt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParentDefuntCopyWith<ParentDefunt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParentDefuntCopyWith<$Res> {
  factory $ParentDefuntCopyWith(
          ParentDefunt value, $Res Function(ParentDefunt) then) =
      _$ParentDefuntCopyWithImpl<$Res, ParentDefunt>;
  @useResult
  $Res call(
      {String? prenom,
      String? nom,
      DateTime? dateNaissance,
      String? nationalite,
      String? profession});
}

/// @nodoc
class _$ParentDefuntCopyWithImpl<$Res, $Val extends ParentDefunt>
    implements $ParentDefuntCopyWith<$Res> {
  _$ParentDefuntCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParentDefunt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prenom = freezed,
    Object? nom = freezed,
    Object? dateNaissance = freezed,
    Object? nationalite = freezed,
    Object? profession = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParentDefuntImplCopyWith<$Res>
    implements $ParentDefuntCopyWith<$Res> {
  factory _$$ParentDefuntImplCopyWith(
          _$ParentDefuntImpl value, $Res Function(_$ParentDefuntImpl) then) =
      __$$ParentDefuntImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? prenom,
      String? nom,
      DateTime? dateNaissance,
      String? nationalite,
      String? profession});
}

/// @nodoc
class __$$ParentDefuntImplCopyWithImpl<$Res>
    extends _$ParentDefuntCopyWithImpl<$Res, _$ParentDefuntImpl>
    implements _$$ParentDefuntImplCopyWith<$Res> {
  __$$ParentDefuntImplCopyWithImpl(
      _$ParentDefuntImpl _value, $Res Function(_$ParentDefuntImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParentDefunt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prenom = freezed,
    Object? nom = freezed,
    Object? dateNaissance = freezed,
    Object? nationalite = freezed,
    Object? profession = freezed,
  }) {
    return _then(_$ParentDefuntImpl(
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
    ));
  }
}

/// @nodoc

class _$ParentDefuntImpl implements _ParentDefunt {
  const _$ParentDefuntImpl(
      {this.prenom,
      this.nom,
      this.dateNaissance,
      this.nationalite,
      this.profession});

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
  String toString() {
    return 'ParentDefunt(prenom: $prenom, nom: $nom, dateNaissance: $dateNaissance, nationalite: $nationalite, profession: $profession)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParentDefuntImpl &&
            (identical(other.prenom, prenom) || other.prenom == prenom) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.dateNaissance, dateNaissance) ||
                other.dateNaissance == dateNaissance) &&
            (identical(other.nationalite, nationalite) ||
                other.nationalite == nationalite) &&
            (identical(other.profession, profession) ||
                other.profession == profession));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, prenom, nom, dateNaissance, nationalite, profession);

  /// Create a copy of ParentDefunt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParentDefuntImplCopyWith<_$ParentDefuntImpl> get copyWith =>
      __$$ParentDefuntImplCopyWithImpl<_$ParentDefuntImpl>(this, _$identity);
}

abstract class _ParentDefunt implements ParentDefunt {
  const factory _ParentDefunt(
      {final String? prenom,
      final String? nom,
      final DateTime? dateNaissance,
      final String? nationalite,
      final String? profession}) = _$ParentDefuntImpl;

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

  /// Create a copy of ParentDefunt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParentDefuntImplCopyWith<_$ParentDefuntImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DeclarantDeces {
  String? get qualite => throw _privateConstructorUsedError;
  String? get prenom => throw _privateConstructorUsedError;
  String? get nom => throw _privateConstructorUsedError;
  Sexe? get sexe => throw _privateConstructorUsedError;
  String? get telephone => throw _privateConstructorUsedError;
  String? get lienAvecDefunt => throw _privateConstructorUsedError;
  DateTime? get dateDeclaration => throw _privateConstructorUsedError;

  /// Create a copy of DeclarantDeces
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeclarantDecesCopyWith<DeclarantDeces> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeclarantDecesCopyWith<$Res> {
  factory $DeclarantDecesCopyWith(
          DeclarantDeces value, $Res Function(DeclarantDeces) then) =
      _$DeclarantDecesCopyWithImpl<$Res, DeclarantDeces>;
  @useResult
  $Res call(
      {String? qualite,
      String? prenom,
      String? nom,
      Sexe? sexe,
      String? telephone,
      String? lienAvecDefunt,
      DateTime? dateDeclaration});
}

/// @nodoc
class _$DeclarantDecesCopyWithImpl<$Res, $Val extends DeclarantDeces>
    implements $DeclarantDecesCopyWith<$Res> {
  _$DeclarantDecesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeclarantDeces
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qualite = freezed,
    Object? prenom = freezed,
    Object? nom = freezed,
    Object? sexe = freezed,
    Object? telephone = freezed,
    Object? lienAvecDefunt = freezed,
    Object? dateDeclaration = freezed,
  }) {
    return _then(_value.copyWith(
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
      lienAvecDefunt: freezed == lienAvecDefunt
          ? _value.lienAvecDefunt
          : lienAvecDefunt // ignore: cast_nullable_to_non_nullable
              as String?,
      dateDeclaration: freezed == dateDeclaration
          ? _value.dateDeclaration
          : dateDeclaration // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeclarantDecesImplCopyWith<$Res>
    implements $DeclarantDecesCopyWith<$Res> {
  factory _$$DeclarantDecesImplCopyWith(_$DeclarantDecesImpl value,
          $Res Function(_$DeclarantDecesImpl) then) =
      __$$DeclarantDecesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? qualite,
      String? prenom,
      String? nom,
      Sexe? sexe,
      String? telephone,
      String? lienAvecDefunt,
      DateTime? dateDeclaration});
}

/// @nodoc
class __$$DeclarantDecesImplCopyWithImpl<$Res>
    extends _$DeclarantDecesCopyWithImpl<$Res, _$DeclarantDecesImpl>
    implements _$$DeclarantDecesImplCopyWith<$Res> {
  __$$DeclarantDecesImplCopyWithImpl(
      _$DeclarantDecesImpl _value, $Res Function(_$DeclarantDecesImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeclarantDeces
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qualite = freezed,
    Object? prenom = freezed,
    Object? nom = freezed,
    Object? sexe = freezed,
    Object? telephone = freezed,
    Object? lienAvecDefunt = freezed,
    Object? dateDeclaration = freezed,
  }) {
    return _then(_$DeclarantDecesImpl(
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
      lienAvecDefunt: freezed == lienAvecDefunt
          ? _value.lienAvecDefunt
          : lienAvecDefunt // ignore: cast_nullable_to_non_nullable
              as String?,
      dateDeclaration: freezed == dateDeclaration
          ? _value.dateDeclaration
          : dateDeclaration // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$DeclarantDecesImpl implements _DeclarantDeces {
  const _$DeclarantDecesImpl(
      {this.qualite,
      this.prenom,
      this.nom,
      this.sexe,
      this.telephone,
      this.lienAvecDefunt,
      this.dateDeclaration});

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
  final String? lienAvecDefunt;
  @override
  final DateTime? dateDeclaration;

  @override
  String toString() {
    return 'DeclarantDeces(qualite: $qualite, prenom: $prenom, nom: $nom, sexe: $sexe, telephone: $telephone, lienAvecDefunt: $lienAvecDefunt, dateDeclaration: $dateDeclaration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeclarantDecesImpl &&
            (identical(other.qualite, qualite) || other.qualite == qualite) &&
            (identical(other.prenom, prenom) || other.prenom == prenom) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.sexe, sexe) || other.sexe == sexe) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.lienAvecDefunt, lienAvecDefunt) ||
                other.lienAvecDefunt == lienAvecDefunt) &&
            (identical(other.dateDeclaration, dateDeclaration) ||
                other.dateDeclaration == dateDeclaration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, qualite, prenom, nom, sexe,
      telephone, lienAvecDefunt, dateDeclaration);

  /// Create a copy of DeclarantDeces
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeclarantDecesImplCopyWith<_$DeclarantDecesImpl> get copyWith =>
      __$$DeclarantDecesImplCopyWithImpl<_$DeclarantDecesImpl>(
          this, _$identity);
}

abstract class _DeclarantDeces implements DeclarantDeces {
  const factory _DeclarantDeces(
      {final String? qualite,
      final String? prenom,
      final String? nom,
      final Sexe? sexe,
      final String? telephone,
      final String? lienAvecDefunt,
      final DateTime? dateDeclaration}) = _$DeclarantDecesImpl;

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
  String? get lienAvecDefunt;
  @override
  DateTime? get dateDeclaration;

  /// Create a copy of DeclarantDeces
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeclarantDecesImplCopyWith<_$DeclarantDecesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DeclarationDeces {
  /// Clé d'idempotence (anti-doublon synchronisation hors ligne).
  String get idempotencyKey => throw _privateConstructorUsedError;
  TypeDeclaration get type => throw _privateConstructorUsedError;
  Defunt get defunt => throw _privateConstructorUsedError;
  InformationsDeces get deces => throw _privateConstructorUsedError;
  Conjoint get conjoint => throw _privateConstructorUsedError;
  ParentDefunt get pere => throw _privateConstructorUsedError;
  ParentDefunt get mere => throw _privateConstructorUsedError;
  DeclarantDeces get declarant => throw _privateConstructorUsedError;

  /// Create a copy of DeclarationDeces
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeclarationDecesCopyWith<DeclarationDeces> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeclarationDecesCopyWith<$Res> {
  factory $DeclarationDecesCopyWith(
          DeclarationDeces value, $Res Function(DeclarationDeces) then) =
      _$DeclarationDecesCopyWithImpl<$Res, DeclarationDeces>;
  @useResult
  $Res call(
      {String idempotencyKey,
      TypeDeclaration type,
      Defunt defunt,
      InformationsDeces deces,
      Conjoint conjoint,
      ParentDefunt pere,
      ParentDefunt mere,
      DeclarantDeces declarant});

  $DefuntCopyWith<$Res> get defunt;
  $InformationsDecesCopyWith<$Res> get deces;
  $ConjointCopyWith<$Res> get conjoint;
  $ParentDefuntCopyWith<$Res> get pere;
  $ParentDefuntCopyWith<$Res> get mere;
  $DeclarantDecesCopyWith<$Res> get declarant;
}

/// @nodoc
class _$DeclarationDecesCopyWithImpl<$Res, $Val extends DeclarationDeces>
    implements $DeclarationDecesCopyWith<$Res> {
  _$DeclarationDecesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeclarationDeces
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idempotencyKey = null,
    Object? type = null,
    Object? defunt = null,
    Object? deces = null,
    Object? conjoint = null,
    Object? pere = null,
    Object? mere = null,
    Object? declarant = null,
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
      defunt: null == defunt
          ? _value.defunt
          : defunt // ignore: cast_nullable_to_non_nullable
              as Defunt,
      deces: null == deces
          ? _value.deces
          : deces // ignore: cast_nullable_to_non_nullable
              as InformationsDeces,
      conjoint: null == conjoint
          ? _value.conjoint
          : conjoint // ignore: cast_nullable_to_non_nullable
              as Conjoint,
      pere: null == pere
          ? _value.pere
          : pere // ignore: cast_nullable_to_non_nullable
              as ParentDefunt,
      mere: null == mere
          ? _value.mere
          : mere // ignore: cast_nullable_to_non_nullable
              as ParentDefunt,
      declarant: null == declarant
          ? _value.declarant
          : declarant // ignore: cast_nullable_to_non_nullable
              as DeclarantDeces,
    ) as $Val);
  }

  /// Create a copy of DeclarationDeces
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DefuntCopyWith<$Res> get defunt {
    return $DefuntCopyWith<$Res>(_value.defunt, (value) {
      return _then(_value.copyWith(defunt: value) as $Val);
    });
  }

  /// Create a copy of DeclarationDeces
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InformationsDecesCopyWith<$Res> get deces {
    return $InformationsDecesCopyWith<$Res>(_value.deces, (value) {
      return _then(_value.copyWith(deces: value) as $Val);
    });
  }

  /// Create a copy of DeclarationDeces
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConjointCopyWith<$Res> get conjoint {
    return $ConjointCopyWith<$Res>(_value.conjoint, (value) {
      return _then(_value.copyWith(conjoint: value) as $Val);
    });
  }

  /// Create a copy of DeclarationDeces
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ParentDefuntCopyWith<$Res> get pere {
    return $ParentDefuntCopyWith<$Res>(_value.pere, (value) {
      return _then(_value.copyWith(pere: value) as $Val);
    });
  }

  /// Create a copy of DeclarationDeces
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ParentDefuntCopyWith<$Res> get mere {
    return $ParentDefuntCopyWith<$Res>(_value.mere, (value) {
      return _then(_value.copyWith(mere: value) as $Val);
    });
  }

  /// Create a copy of DeclarationDeces
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeclarantDecesCopyWith<$Res> get declarant {
    return $DeclarantDecesCopyWith<$Res>(_value.declarant, (value) {
      return _then(_value.copyWith(declarant: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeclarationDecesImplCopyWith<$Res>
    implements $DeclarationDecesCopyWith<$Res> {
  factory _$$DeclarationDecesImplCopyWith(_$DeclarationDecesImpl value,
          $Res Function(_$DeclarationDecesImpl) then) =
      __$$DeclarationDecesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idempotencyKey,
      TypeDeclaration type,
      Defunt defunt,
      InformationsDeces deces,
      Conjoint conjoint,
      ParentDefunt pere,
      ParentDefunt mere,
      DeclarantDeces declarant});

  @override
  $DefuntCopyWith<$Res> get defunt;
  @override
  $InformationsDecesCopyWith<$Res> get deces;
  @override
  $ConjointCopyWith<$Res> get conjoint;
  @override
  $ParentDefuntCopyWith<$Res> get pere;
  @override
  $ParentDefuntCopyWith<$Res> get mere;
  @override
  $DeclarantDecesCopyWith<$Res> get declarant;
}

/// @nodoc
class __$$DeclarationDecesImplCopyWithImpl<$Res>
    extends _$DeclarationDecesCopyWithImpl<$Res, _$DeclarationDecesImpl>
    implements _$$DeclarationDecesImplCopyWith<$Res> {
  __$$DeclarationDecesImplCopyWithImpl(_$DeclarationDecesImpl _value,
      $Res Function(_$DeclarationDecesImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeclarationDeces
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idempotencyKey = null,
    Object? type = null,
    Object? defunt = null,
    Object? deces = null,
    Object? conjoint = null,
    Object? pere = null,
    Object? mere = null,
    Object? declarant = null,
  }) {
    return _then(_$DeclarationDecesImpl(
      idempotencyKey: null == idempotencyKey
          ? _value.idempotencyKey
          : idempotencyKey // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeDeclaration,
      defunt: null == defunt
          ? _value.defunt
          : defunt // ignore: cast_nullable_to_non_nullable
              as Defunt,
      deces: null == deces
          ? _value.deces
          : deces // ignore: cast_nullable_to_non_nullable
              as InformationsDeces,
      conjoint: null == conjoint
          ? _value.conjoint
          : conjoint // ignore: cast_nullable_to_non_nullable
              as Conjoint,
      pere: null == pere
          ? _value.pere
          : pere // ignore: cast_nullable_to_non_nullable
              as ParentDefunt,
      mere: null == mere
          ? _value.mere
          : mere // ignore: cast_nullable_to_non_nullable
              as ParentDefunt,
      declarant: null == declarant
          ? _value.declarant
          : declarant // ignore: cast_nullable_to_non_nullable
              as DeclarantDeces,
    ));
  }
}

/// @nodoc

class _$DeclarationDecesImpl implements _DeclarationDeces {
  const _$DeclarationDecesImpl(
      {required this.idempotencyKey,
      this.type = TypeDeclaration.declaration,
      this.defunt = const Defunt(),
      this.deces = const InformationsDeces(),
      this.conjoint = const Conjoint(),
      this.pere = const ParentDefunt(),
      this.mere = const ParentDefunt(),
      this.declarant = const DeclarantDeces()});

  /// Clé d'idempotence (anti-doublon synchronisation hors ligne).
  @override
  final String idempotencyKey;
  @override
  @JsonKey()
  final TypeDeclaration type;
  @override
  @JsonKey()
  final Defunt defunt;
  @override
  @JsonKey()
  final InformationsDeces deces;
  @override
  @JsonKey()
  final Conjoint conjoint;
  @override
  @JsonKey()
  final ParentDefunt pere;
  @override
  @JsonKey()
  final ParentDefunt mere;
  @override
  @JsonKey()
  final DeclarantDeces declarant;

  @override
  String toString() {
    return 'DeclarationDeces(idempotencyKey: $idempotencyKey, type: $type, defunt: $defunt, deces: $deces, conjoint: $conjoint, pere: $pere, mere: $mere, declarant: $declarant)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeclarationDecesImpl &&
            (identical(other.idempotencyKey, idempotencyKey) ||
                other.idempotencyKey == idempotencyKey) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.defunt, defunt) || other.defunt == defunt) &&
            (identical(other.deces, deces) || other.deces == deces) &&
            (identical(other.conjoint, conjoint) ||
                other.conjoint == conjoint) &&
            (identical(other.pere, pere) || other.pere == pere) &&
            (identical(other.mere, mere) || other.mere == mere) &&
            (identical(other.declarant, declarant) ||
                other.declarant == declarant));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idempotencyKey, type, defunt,
      deces, conjoint, pere, mere, declarant);

  /// Create a copy of DeclarationDeces
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeclarationDecesImplCopyWith<_$DeclarationDecesImpl> get copyWith =>
      __$$DeclarationDecesImplCopyWithImpl<_$DeclarationDecesImpl>(
          this, _$identity);
}

abstract class _DeclarationDeces implements DeclarationDeces {
  const factory _DeclarationDeces(
      {required final String idempotencyKey,
      final TypeDeclaration type,
      final Defunt defunt,
      final InformationsDeces deces,
      final Conjoint conjoint,
      final ParentDefunt pere,
      final ParentDefunt mere,
      final DeclarantDeces declarant}) = _$DeclarationDecesImpl;

  /// Clé d'idempotence (anti-doublon synchronisation hors ligne).
  @override
  String get idempotencyKey;
  @override
  TypeDeclaration get type;
  @override
  Defunt get defunt;
  @override
  InformationsDeces get deces;
  @override
  Conjoint get conjoint;
  @override
  ParentDefunt get pere;
  @override
  ParentDefunt get mere;
  @override
  DeclarantDeces get declarant;

  /// Create a copy of DeclarationDeces
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeclarationDecesImplCopyWith<_$DeclarationDecesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
