// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ExtUser.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExtUser _$ExtUserFromJson(Map<String, dynamic> json) {
  return _ExtUser.fromJson(json);
}

/// @nodoc
mixin _$ExtUser {
  String get fullName => throw _privateConstructorUsedError;
  set fullName(String value) => throw _privateConstructorUsedError;
  String get emailId => throw _privateConstructorUsedError;
  set emailId(String value) => throw _privateConstructorUsedError;
  String get contactNumber => throw _privateConstructorUsedError;
  set contactNumber(String value) => throw _privateConstructorUsedError;
  ({int userId, ExtUserType userType}) get extUserType =>
      throw _privateConstructorUsedError;
  set extUserType(({int userId, ExtUserType userType}) value) =>
      throw _privateConstructorUsedError;
  DateTime get checkInDateTime => throw _privateConstructorUsedError;
  set checkInDateTime(DateTime value) => throw _privateConstructorUsedError;
  DateTime? get checkOutDateTime => throw _privateConstructorUsedError;
  set checkOutDateTime(DateTime? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExtUserCopyWith<ExtUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtUserCopyWith<$Res> {
  factory $ExtUserCopyWith(ExtUser value, $Res Function(ExtUser) then) =
      _$ExtUserCopyWithImpl<$Res, ExtUser>;
  @useResult
  $Res call(
      {String fullName,
      String emailId,
      String contactNumber,
      ({int userId, ExtUserType userType}) extUserType,
      DateTime checkInDateTime,
      DateTime? checkOutDateTime});
}

/// @nodoc
class _$ExtUserCopyWithImpl<$Res, $Val extends ExtUser>
    implements $ExtUserCopyWith<$Res> {
  _$ExtUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? emailId = null,
    Object? contactNumber = null,
    Object? extUserType = null,
    Object? checkInDateTime = null,
    Object? checkOutDateTime = freezed,
  }) {
    return _then(_value.copyWith(
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
      extUserType: null == extUserType
          ? _value.extUserType
          : extUserType // ignore: cast_nullable_to_non_nullable
              as ({int userId, ExtUserType userType}),
      checkInDateTime: null == checkInDateTime
          ? _value.checkInDateTime
          : checkInDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      checkOutDateTime: freezed == checkOutDateTime
          ? _value.checkOutDateTime
          : checkOutDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExtUserImplCopyWith<$Res> implements $ExtUserCopyWith<$Res> {
  factory _$$ExtUserImplCopyWith(
          _$ExtUserImpl value, $Res Function(_$ExtUserImpl) then) =
      __$$ExtUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fullName,
      String emailId,
      String contactNumber,
      ({int userId, ExtUserType userType}) extUserType,
      DateTime checkInDateTime,
      DateTime? checkOutDateTime});
}

/// @nodoc
class __$$ExtUserImplCopyWithImpl<$Res>
    extends _$ExtUserCopyWithImpl<$Res, _$ExtUserImpl>
    implements _$$ExtUserImplCopyWith<$Res> {
  __$$ExtUserImplCopyWithImpl(
      _$ExtUserImpl _value, $Res Function(_$ExtUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? emailId = null,
    Object? contactNumber = null,
    Object? extUserType = null,
    Object? checkInDateTime = null,
    Object? checkOutDateTime = freezed,
  }) {
    return _then(_$ExtUserImpl(
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
      extUserType: null == extUserType
          ? _value.extUserType
          : extUserType // ignore: cast_nullable_to_non_nullable
              as ({int userId, ExtUserType userType}),
      checkInDateTime: null == checkInDateTime
          ? _value.checkInDateTime
          : checkInDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      checkOutDateTime: freezed == checkOutDateTime
          ? _value.checkOutDateTime
          : checkOutDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExtUserImpl implements _ExtUser {
  _$ExtUserImpl(
      {required this.fullName,
      required this.emailId,
      required this.contactNumber,
      required this.extUserType,
      required this.checkInDateTime,
      this.checkOutDateTime = null});

  factory _$ExtUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtUserImplFromJson(json);

  @override
  String fullName;
  @override
  String emailId;
  @override
  String contactNumber;
  @override
  ({int userId, ExtUserType userType}) extUserType;
  @override
  DateTime checkInDateTime;
  @override
  @JsonKey()
  DateTime? checkOutDateTime;

  @override
  String toString() {
    return 'ExtUser(fullName: $fullName, emailId: $emailId, contactNumber: $contactNumber, extUserType: $extUserType, checkInDateTime: $checkInDateTime, checkOutDateTime: $checkOutDateTime)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtUserImplCopyWith<_$ExtUserImpl> get copyWith =>
      __$$ExtUserImplCopyWithImpl<_$ExtUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExtUserImplToJson(
      this,
    );
  }
}

abstract class _ExtUser implements ExtUser {
  factory _ExtUser(
      {required String fullName,
      required String emailId,
      required String contactNumber,
      required ({int userId, ExtUserType userType}) extUserType,
      required DateTime checkInDateTime,
      DateTime? checkOutDateTime}) = _$ExtUserImpl;

  factory _ExtUser.fromJson(Map<String, dynamic> json) = _$ExtUserImpl.fromJson;

  @override
  String get fullName;
  set fullName(String value);
  @override
  String get emailId;
  set emailId(String value);
  @override
  String get contactNumber;
  set contactNumber(String value);
  @override
  ({int userId, ExtUserType userType}) get extUserType;
  set extUserType(({int userId, ExtUserType userType}) value);
  @override
  DateTime get checkInDateTime;
  set checkInDateTime(DateTime value);
  @override
  DateTime? get checkOutDateTime;
  set checkOutDateTime(DateTime? value);
  @override
  @JsonKey(ignore: true)
  _$$ExtUserImplCopyWith<_$ExtUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
