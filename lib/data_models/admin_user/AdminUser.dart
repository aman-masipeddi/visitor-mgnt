// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'AdminUser.freezed.dart';
part 'AdminUser.g.dart';


@Freezed()
class AdminUser with _$AdminUser{

  const factory AdminUser({
    required String uid,
    required String fullName,
    required String emailId,
    required String contactNumber,
    required DateTime joinedDate,
}) = _AdminUser;

  factory AdminUser.fromJson(Map<String, dynamic> json) => _$AdminUserFromJson(json);
}