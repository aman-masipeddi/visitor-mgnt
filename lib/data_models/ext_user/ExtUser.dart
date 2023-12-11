import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:visitor_mgnt/ui/user-ext/user_session_screen.dart';
part 'ExtUser.freezed.dart';
part 'ExtUser.g.dart';

@unfreezed
class ExtUser with _$ExtUser{

  factory ExtUser({
    required String fullName,
    required String emailId,
    required String contactNumber,
    required ({ExtUserType userType, int userId}) extUserType,
    required DateTime checkInDateTime,
    @Default(null) DateTime? checkOutDateTime,
  }) = _ExtUser;

  factory ExtUser.fromJson(Map<String, dynamic> json) => _$ExtUserFromJson(json);
}