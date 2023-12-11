// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ExtUser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExtUserImpl _$$ExtUserImplFromJson(Map<String, dynamic> json) =>
    _$ExtUserImpl(
      fullName: json['fullName'] as String,
      emailId: json['emailId'] as String,
      contactNumber: json['contactNumber'] as String,
      extUserType: _$recordConvert(
        json['extUserType'],
        ($jsonValue) => (
          userId: $jsonValue['userId'] as int,
          userType: $enumDecode(_$ExtUserTypeEnumMap, $jsonValue['userType']),
        ),
      ),
      checkInDateTime: DateTime.parse(json['checkInDateTime'] as String),
      checkOutDateTime: json['checkOutDateTime'] == null
          ? null
          : DateTime.parse(json['checkOutDateTime'] as String),
    );

Map<String, dynamic> _$$ExtUserImplToJson(_$ExtUserImpl instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'emailId': instance.emailId,
      'contactNumber': instance.contactNumber,
      'extUserType': {
        'userId': instance.extUserType.userId,
        'userType': _$ExtUserTypeEnumMap[instance.extUserType.userType]!,
      },
      'checkInDateTime': instance.checkInDateTime.toIso8601String(),
      'checkOutDateTime': instance.checkOutDateTime?.toIso8601String(),
    };

const _$ExtUserTypeEnumMap = {
  ExtUserType.visitor: 'visitor',
  ExtUserType.vendor: 'vendor',
  ExtUserType.serviceProvider: 'serviceProvider',
  ExtUserType.other: 'other',
};

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);
