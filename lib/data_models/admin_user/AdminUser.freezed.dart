// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'AdminUser.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AdminUser _$AdminUserFromJson(Map<String, dynamic> json) {
  return _AdminUser.fromJson(json);
}

/// @nodoc
mixin _$AdminUser {
  String get uid => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get emailId => throw _privateConstructorUsedError;
  String get contactNumber => throw _privateConstructorUsedError;
  DateTime get joinedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdminUserCopyWith<AdminUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminUserCopyWith<$Res> {
  factory $AdminUserCopyWith(AdminUser value, $Res Function(AdminUser) then) =
      _$AdminUserCopyWithImpl<$Res, AdminUser>;
  @useResult
  $Res call(
      {String uid,
      String fullName,
      String emailId,
      String contactNumber,
      DateTime joinedDate});
}

/// @nodoc
class _$AdminUserCopyWithImpl<$Res, $Val extends AdminUser>
    implements $AdminUserCopyWith<$Res> {
  _$AdminUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? fullName = null,
    Object? emailId = null,
    Object? contactNumber = null,
    Object? joinedDate = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      emailId: null == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      joinedDate: null == joinedDate
          ? _value.joinedDate
          : joinedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminUserImplCopyWith<$Res>
    implements $AdminUserCopyWith<$Res> {
  factory _$$AdminUserImplCopyWith(
          _$AdminUserImpl value, $Res Function(_$AdminUserImpl) then) =
      __$$AdminUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String fullName,
      String emailId,
      String contactNumber,
      DateTime joinedDate});
}

/// @nodoc
class __$$AdminUserImplCopyWithImpl<$Res>
    extends _$AdminUserCopyWithImpl<$Res, _$AdminUserImpl>
    implements _$$AdminUserImplCopyWith<$Res> {
  __$$AdminUserImplCopyWithImpl(
      _$AdminUserImpl _value, $Res Function(_$AdminUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? fullName = null,
    Object? emailId = null,
    Object? contactNumber = null,
    Object? joinedDate = null,
  }) {
    return _then(_$AdminUserImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      emailId: null == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      joinedDate: null == joinedDate
          ? _value.joinedDate
          : joinedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdminUserImpl with DiagnosticableTreeMixin implements _AdminUser {
  const _$AdminUserImpl(
      {required this.uid,
      required this.fullName,
      required this.emailId,
      required this.contactNumber,
      required this.joinedDate});

  factory _$AdminUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminUserImplFromJson(json);

  @override
  final String uid;
  @override
  final String fullName;
  @override
  final String emailId;
  @override
  final String contactNumber;
  @override
  final DateTime joinedDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AdminUser(uid: $uid, fullName: $fullName, emailId: $emailId, contactNumber: $contactNumber, joinedDate: $joinedDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AdminUser'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('fullName', fullName))
      ..add(DiagnosticsProperty('emailId', emailId))
      ..add(DiagnosticsProperty('contactNumber', contactNumber))
      ..add(DiagnosticsProperty('joinedDate', joinedDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminUserImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.emailId, emailId) || other.emailId == emailId) &&
            (identical(other.contactNumber, contactNumber) ||
                other.contactNumber == contactNumber) &&
            (identical(other.joinedDate, joinedDate) ||
                other.joinedDate == joinedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, uid, fullName, emailId, contactNumber, joinedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminUserImplCopyWith<_$AdminUserImpl> get copyWith =>
      __$$AdminUserImplCopyWithImpl<_$AdminUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminUserImplToJson(
      this,
    );
  }
}

abstract class _AdminUser implements AdminUser {
  const factory _AdminUser(
      {required final String uid,
      required final String fullName,
      required final String emailId,
      required final String contactNumber,
      required final DateTime joinedDate}) = _$AdminUserImpl;

  factory _AdminUser.fromJson(Map<String, dynamic> json) =
      _$AdminUserImpl.fromJson;

  @override
  String get uid;
  @override
  String get fullName;
  @override
  String get emailId;
  @override
  String get contactNumber;
  @override
  DateTime get joinedDate;
  @override
  @JsonKey(ignore: true)
  _$$AdminUserImplCopyWith<_$AdminUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
