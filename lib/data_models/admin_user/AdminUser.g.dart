// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AdminUser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminUserImpl _$$AdminUserImplFromJson(Map<String, dynamic> json) =>
    _$AdminUserImpl(
      uid: json['uid'] as String,
      fullName: json['fullName'] as String,
      emailId: json['emailId'] as String,
      contactNumber: json['contactNumber'] as String,
      joinedDate: DateTime.parse(json['joinedDate'] as String),
    );

Map<String, dynamic> _$$AdminUserImplToJson(_$AdminUserImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'fullName': instance.fullName,
      'emailId': instance.emailId,
      'contactNumber': instance.contactNumber,
      'joinedDate': instance.joinedDate.toIso8601String(),
    };
