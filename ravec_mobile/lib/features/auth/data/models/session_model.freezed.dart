// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) {
  return _SessionModel.fromJson(json);
}

/// @nodoc
mixin _$SessionModel {
  String get accessToken => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get telephone => throw _privateConstructorUsedError;
  String? get profil => throw _privateConstructorUsedError;
  String? get profilLibelle => throw _privateConstructorUsedError;
  String? get niveauAdministratif => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _authoritiesFromJson)
  List<String> get authorities => throw _privateConstructorUsedError;
  bool get mustChangePassword => throw _privateConstructorUsedError;

  /// Serializes this SessionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionModelCopyWith<SessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionModelCopyWith<$Res> {
  factory $SessionModelCopyWith(
          SessionModel value, $Res Function(SessionModel) then) =
      _$SessionModelCopyWithImpl<$Res, SessionModel>;
  @useResult
  $Res call(
      {String accessToken,
      String? refreshToken,
      String? name,
      String? username,
      String? telephone,
      String? profil,
      String? profilLibelle,
      String? niveauAdministratif,
      @JsonKey(fromJson: _authoritiesFromJson) List<String> authorities,
      bool mustChangePassword});
}

/// @nodoc
class _$SessionModelCopyWithImpl<$Res, $Val extends SessionModel>
    implements $SessionModelCopyWith<$Res> {
  _$SessionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? telephone = freezed,
    Object? profil = freezed,
    Object? profilLibelle = freezed,
    Object? niveauAdministratif = freezed,
    Object? authorities = null,
    Object? mustChangePassword = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      telephone: freezed == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String?,
      profil: freezed == profil
          ? _value.profil
          : profil // ignore: cast_nullable_to_non_nullable
              as String?,
      profilLibelle: freezed == profilLibelle
          ? _value.profilLibelle
          : profilLibelle // ignore: cast_nullable_to_non_nullable
              as String?,
      niveauAdministratif: freezed == niveauAdministratif
          ? _value.niveauAdministratif
          : niveauAdministratif // ignore: cast_nullable_to_non_nullable
              as String?,
      authorities: null == authorities
          ? _value.authorities
          : authorities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mustChangePassword: null == mustChangePassword
          ? _value.mustChangePassword
          : mustChangePassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionModelImplCopyWith<$Res>
    implements $SessionModelCopyWith<$Res> {
  factory _$$SessionModelImplCopyWith(
          _$SessionModelImpl value, $Res Function(_$SessionModelImpl) then) =
      __$$SessionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String accessToken,
      String? refreshToken,
      String? name,
      String? username,
      String? telephone,
      String? profil,
      String? profilLibelle,
      String? niveauAdministratif,
      @JsonKey(fromJson: _authoritiesFromJson) List<String> authorities,
      bool mustChangePassword});
}

/// @nodoc
class __$$SessionModelImplCopyWithImpl<$Res>
    extends _$SessionModelCopyWithImpl<$Res, _$SessionModelImpl>
    implements _$$SessionModelImplCopyWith<$Res> {
  __$$SessionModelImplCopyWithImpl(
      _$SessionModelImpl _value, $Res Function(_$SessionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? telephone = freezed,
    Object? profil = freezed,
    Object? profilLibelle = freezed,
    Object? niveauAdministratif = freezed,
    Object? authorities = null,
    Object? mustChangePassword = null,
  }) {
    return _then(_$SessionModelImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      telephone: freezed == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String?,
      profil: freezed == profil
          ? _value.profil
          : profil // ignore: cast_nullable_to_non_nullable
              as String?,
      profilLibelle: freezed == profilLibelle
          ? _value.profilLibelle
          : profilLibelle // ignore: cast_nullable_to_non_nullable
              as String?,
      niveauAdministratif: freezed == niveauAdministratif
          ? _value.niveauAdministratif
          : niveauAdministratif // ignore: cast_nullable_to_non_nullable
              as String?,
      authorities: null == authorities
          ? _value._authorities
          : authorities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mustChangePassword: null == mustChangePassword
          ? _value.mustChangePassword
          : mustChangePassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionModelImpl extends _SessionModel {
  const _$SessionModelImpl(
      {required this.accessToken,
      this.refreshToken,
      this.name,
      this.username,
      this.telephone,
      this.profil,
      this.profilLibelle,
      this.niveauAdministratif,
      @JsonKey(fromJson: _authoritiesFromJson)
      final List<String> authorities = const <String>[],
      this.mustChangePassword = false})
      : _authorities = authorities,
        super._();

  factory _$SessionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionModelImplFromJson(json);

  @override
  final String accessToken;
  @override
  final String? refreshToken;
  @override
  final String? name;
  @override
  final String? username;
  @override
  final String? telephone;
  @override
  final String? profil;
  @override
  final String? profilLibelle;
  @override
  final String? niveauAdministratif;
  final List<String> _authorities;
  @override
  @JsonKey(fromJson: _authoritiesFromJson)
  List<String> get authorities {
    if (_authorities is EqualUnmodifiableListView) return _authorities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authorities);
  }

  @override
  @JsonKey()
  final bool mustChangePassword;

  @override
  String toString() {
    return 'SessionModel(accessToken: $accessToken, refreshToken: $refreshToken, name: $name, username: $username, telephone: $telephone, profil: $profil, profilLibelle: $profilLibelle, niveauAdministratif: $niveauAdministratif, authorities: $authorities, mustChangePassword: $mustChangePassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionModelImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.profil, profil) || other.profil == profil) &&
            (identical(other.profilLibelle, profilLibelle) ||
                other.profilLibelle == profilLibelle) &&
            (identical(other.niveauAdministratif, niveauAdministratif) ||
                other.niveauAdministratif == niveauAdministratif) &&
            const DeepCollectionEquality()
                .equals(other._authorities, _authorities) &&
            (identical(other.mustChangePassword, mustChangePassword) ||
                other.mustChangePassword == mustChangePassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      accessToken,
      refreshToken,
      name,
      username,
      telephone,
      profil,
      profilLibelle,
      niveauAdministratif,
      const DeepCollectionEquality().hash(_authorities),
      mustChangePassword);

  /// Create a copy of SessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionModelImplCopyWith<_$SessionModelImpl> get copyWith =>
      __$$SessionModelImplCopyWithImpl<_$SessionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionModelImplToJson(
      this,
    );
  }
}

abstract class _SessionModel extends SessionModel {
  const factory _SessionModel(
      {required final String accessToken,
      final String? refreshToken,
      final String? name,
      final String? username,
      final String? telephone,
      final String? profil,
      final String? profilLibelle,
      final String? niveauAdministratif,
      @JsonKey(fromJson: _authoritiesFromJson) final List<String> authorities,
      final bool mustChangePassword}) = _$SessionModelImpl;
  const _SessionModel._() : super._();

  factory _SessionModel.fromJson(Map<String, dynamic> json) =
      _$SessionModelImpl.fromJson;

  @override
  String get accessToken;
  @override
  String? get refreshToken;
  @override
  String? get name;
  @override
  String? get username;
  @override
  String? get telephone;
  @override
  String? get profil;
  @override
  String? get profilLibelle;
  @override
  String? get niveauAdministratif;
  @override
  @JsonKey(fromJson: _authoritiesFromJson)
  List<String> get authorities;
  @override
  bool get mustChangePassword;

  /// Create a copy of SessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionModelImplCopyWith<_$SessionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
