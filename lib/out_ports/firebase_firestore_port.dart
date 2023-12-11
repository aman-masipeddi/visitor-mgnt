import 'package:oxidized/oxidized.dart';
import 'package:visitor_mgnt/data_models/admin_user/AdminUser.dart';

import 'package:visitor_mgnt/data_models/ext_user/ExtUser.dart';

abstract interface class FirebaseFireStorePort {

  createAdminUser(AdminUser adminUser);

  Future<Result<AdminUser, String>> getAdminUserInfo(String uid);

  Future<Option<String>> checkIfExtUserSessionExist(String email, DateTime dateTime);

  Future<Option<String>> createExtSession(DateTime dateTime, ExtUser extUser);

  Future<Option<String>> endExtSession(String email, DateTime checkOutDateTime);

  Future<Result<List<ExtUser>, String>> getDailySessions(DateTime dateTime);
}