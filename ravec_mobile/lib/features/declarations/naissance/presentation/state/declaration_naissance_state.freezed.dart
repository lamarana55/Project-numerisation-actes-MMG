// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'declaration_naissance_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeclarationNaissanceState {
  DeclarationNaissance get declaration => throw _privateConstructorUsedError;
  EtapeDeclaration get etape => throw _privateConstructorUsedError;
  StatutEnvoi get statut => throw _privateConstructorUsedError;
  Map<String, String> get erreurs => throw _privateConstructorUsedError;
  Failure? get echec => throw _privateConstructorUsedError;
  ActeResume? get resultat => throw _privateConstructorUsedError;

  /// Create a copy of DeclarationNaissanceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeclarationNaissanceStateCopyWith<DeclarationNaissanceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeclarationNaissanceStateCopyWith<$Res> {
  factory $DeclarationNaissanceStateCopyWith(DeclarationNaissanceState value,
          $Res Function(DeclarationNaissanceState) then) =
      _$DeclarationNaissanceStateCopyWithImpl<$Res, DeclarationNaissanceState>;
  @useResult
  $Res call(
      {DeclarationNaissance declaration,
      EtapeDeclaration etape,
      StatutEnvoi statut,
      Map<String, String> erreurs,
      Failure? echec,
      ActeResume? resultat});

  $DeclarationNaissanceCopyWith<$Res> get declaration;
  $ActeResumeCopyWith<$Res>? get resultat;
}

/// @nodoc
class _$DeclarationNaissanceStateCopyWithImpl<$Res,
        $Val extends DeclarationNaissanceState>
    implements $DeclarationNaissanceStateCopyWith<$Res> {
  _$DeclarationNaissanceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeclarationNaissanceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? declaration = null,
    Object? etape = null,
    Object? statut = null,
    Object? erreurs = null,
    Object? echec = freezed,
    Object? resultat = freezed,
  }) {
    return _then(_value.copyWith(
      declaration: null == declaration
          ? _value.declaration
          : declaration // ignore: cast_nullable_to_non_nullable
              as DeclarationNaissance,
      etape: null == etape
          ? _value.etape
          : etape // ignore: cast_nullable_to_non_nullable
              as EtapeDeclaration,
      statut: null == statut
          ? _value.statut
          : statut // ignore: cast_nullable_to_non_nullable
              as StatutEnvoi,
      erreurs: null == erreurs
          ? _value.erreurs
          : erreurs // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      echec: freezed == echec
          ? _value.echec
          : echec // ignore: cast_nullable_to_non_nullable
              as Failure?,
      resultat: freezed == resultat
          ? _value.resultat
          : resultat // ignore: cast_nullable_to_non_nullable
              as ActeResume?,
    ) as $Val);
  }

  /// Create a copy of DeclarationNaissanceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeclarationNaissanceCopyWith<$Res> get declaration {
    return $DeclarationNaissanceCopyWith<$Res>(_value.declaration, (value) {
      return _then(_value.copyWith(declaration: value) as $Val);
    });
  }

  /// Create a copy of DeclarationNaissanceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActeResumeCopyWith<$Res>? get resultat {
    if (_value.resultat == null) {
      return null;
    }

    return $ActeResumeCopyWith<$Res>(_value.resultat!, (value) {
      return _then(_value.copyWith(resultat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeclarationNaissanceStateImplCopyWith<$Res>
    implements $DeclarationNaissanceStateCopyWith<$Res> {
  factory _$$DeclarationNaissanceStateImplCopyWith(
          _$DeclarationNaissanceStateImpl value,
          $Res Function(_$DeclarationNaissanceStateImpl) then) =
      __$$DeclarationNaissanceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DeclarationNaissance declaration,
      EtapeDeclaration etape,
      StatutEnvoi statut,
      Map<String, String> erreurs,
      Failure? echec,
      ActeResume? resultat});

  @override
  $DeclarationNaissanceCopyWith<$Res> get declaration;
  @override
  $ActeResumeCopyWith<$Res>? get resultat;
}

/// @nodoc
class __$$DeclarationNaissanceStateImplCopyWithImpl<$Res>
    extends _$DeclarationNaissanceStateCopyWithImpl<$Res,
        _$DeclarationNaissanceStateImpl>
    implements _$$DeclarationNaissanceStateImplCopyWith<$Res> {
  __$$DeclarationNaissanceStateImplCopyWithImpl(
      _$DeclarationNaissanceStateImpl _value,
      $Res Function(_$DeclarationNaissanceStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeclarationNaissanceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? declaration = null,
    Object? etape = null,
    Object? statut = null,
    Object? erreurs = null,
    Object? echec = freezed,
    Object? resultat = freezed,
  }) {
    return _then(_$DeclarationNaissanceStateImpl(
      declaration: null == declaration
          ? _value.declaration
          : declaration // ignore: cast_nullable_to_non_nullable
              as DeclarationNaissance,
      etape: null == etape
          ? _value.etape
          : etape // ignore: cast_nullable_to_non_nullable
              as EtapeDeclaration,
      statut: null == statut
          ? _value.statut
          : statut // ignore: cast_nullable_to_non_nullable
              as StatutEnvoi,
      erreurs: null == erreurs
          ? _value._erreurs
          : erreurs // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      echec: freezed == echec
          ? _value.echec
          : echec // ignore: cast_nullable_to_non_nullable
              as Failure?,
      resultat: freezed == resultat
          ? _value.resultat
          : resultat // ignore: cast_nullable_to_non_nullable
              as ActeResume?,
    ));
  }
}

/// @nodoc

class _$DeclarationNaissanceStateImpl extends _DeclarationNaissanceState {
  const _$DeclarationNaissanceStateImpl(
      {required this.declaration,
      this.etape = EtapeDeclaration.nouveauNe,
      this.statut = StatutEnvoi.edition,
      final Map<String, String> erreurs = const <String, String>{},
      this.echec,
      this.resultat})
      : _erreurs = erreurs,
        super._();

  @override
  final DeclarationNaissance declaration;
  @override
  @JsonKey()
  final EtapeDeclaration etape;
  @override
  @JsonKey()
  final StatutEnvoi statut;
  final Map<String, String> _erreurs;
  @override
  @JsonKey()
  Map<String, String> get erreurs {
    if (_erreurs is EqualUnmodifiableMapView) return _erreurs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_erreurs);
  }

  @override
  final Failure? echec;
  @override
  final ActeResume? resultat;

  @override
  String toString() {
    return 'DeclarationNaissanceState(declaration: $declaration, etape: $etape, statut: $statut, erreurs: $erreurs, echec: $echec, resultat: $resultat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeclarationNaissanceStateImpl &&
            (identical(other.declaration, declaration) ||
                other.declaration == declaration) &&
            (identical(other.etape, etape) || other.etape == etape) &&
            (identical(other.statut, statut) || other.statut == statut) &&
            const DeepCollectionEquality().equals(other._erreurs, _erreurs) &&
            (identical(other.echec, echec) || other.echec == echec) &&
            (identical(other.resultat, resultat) ||
                other.resultat == resultat));
  }

  @override
  int get hashCode => Object.hash(runtimeType, declaration, etape, statut,
      const DeepCollectionEquality().hash(_erreurs), echec, resultat);

  /// Create a copy of DeclarationNaissanceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeclarationNaissanceStateImplCopyWith<_$DeclarationNaissanceStateImpl>
      get copyWith => __$$DeclarationNaissanceStateImplCopyWithImpl<
          _$DeclarationNaissanceStateImpl>(this, _$identity);
}

abstract class _DeclarationNaissanceState extends DeclarationNaissanceState {
  const factory _DeclarationNaissanceState(
      {required final DeclarationNaissance declaration,
      final EtapeDeclaration etape,
      final StatutEnvoi statut,
      final Map<String, String> erreurs,
      final Failure? echec,
      final ActeResume? resultat}) = _$DeclarationNaissanceStateImpl;
  const _DeclarationNaissanceState._() : super._();

  @override
  DeclarationNaissance get declaration;
  @override
  EtapeDeclaration get etape;
  @override
  StatutEnvoi get statut;
  @override
  Map<String, String> get erreurs;
  @override
  Failure? get echec;
  @override
  ActeResume? get resultat;

  /// Create a copy of DeclarationNaissanceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeclarationNaissanceStateImplCopyWith<_$DeclarationNaissanceStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
