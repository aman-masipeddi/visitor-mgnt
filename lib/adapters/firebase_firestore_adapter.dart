import 'package:cloud_functions/cloud_functions.dart';
import 'package:oxidized/oxidized.dart';
import 'package:visitor_mgnt/data_models/admin_user/AdminUser.dart';
import 'package:visitor_mgnt/data_models/ext_user/ExtUser.dart';
import 'package:visitor_mgnt/out_ports/firebase_firestore_port.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:visitor_mgnt/utilities/utilities.dart';

class FirebaseFireStoreAdapter implements FirebaseFireStorePort {
  final _fireStoreDB = FirebaseFirestore.instance;
  @override
  Future<Option<String>> createAdminUser(AdminUser adminUser) async {

    try {
      await _fireStoreDB.collection('users-admin').doc(adminUser.uid).set(
          adminUser.toJson());
      return const Option.none();
    } catch (e) {
      debugLog(e.toString());
      return const Option.some('Couldn\'t create user in server. Please try again later.');
    }
  }

  @override
  Future<Result<AdminUser, String>> getAdminUserInfo(String uid) async {

    try {
      final result = await _fireStoreDB.collection('users-admin').doc(uid).get();
      if(result.data() == null) {
        return const Result.err('Couldn\'t retrieve user information');
      }
      final data = result.data()!;
      return Result.ok(AdminUser.fromJson(data));
    } catch (e) {
      return Result.err(e.toString());
    }
  }

  @override
  Future<Option<String>> checkIfExtUserSessionExist(String email, DateTime dateTime) async {

    try {
      final result = await _fireStoreDB.doc(
          'sessions-users-ext/${mmyyyyFormatter(dateTime)}/${mmddyyyyFormatter(
              dateTime)}/${email}/').get();
      if (result.exists) {
          return const Option.none();
      }
      return const Option.some('No record found with the given email');
    } catch (e) {
      return Option.some(e.toString());
    }
  }

  @override
  Future<Option<String>> createExtSession(DateTime dateTime, ExtUser extUser) async {

    try {
      await _fireStoreDB.doc(
          'sessions-users-ext/${mmyyyyFormatter(dateTime)}/${mmddyyyyFormatter(
              dateTime)}/${extUser.emailId}/').set(
          extUser.toJson());
      return const Option.none();
    } catch (e) {
      debugLog(e.toString());
      return const Option.some('Couldn\'t create a new session. Please try again later.');
    }
  }

  @override
  Future<Option<String>> endExtSession(String email, DateTime dateTime) async {

    try {
      final path = 'sessions-users-ext/${mmyyyyFormatter(dateTime)}/${mmddyyyyFormatter(
          dateTime)}/$email';
      final result = await _fireStoreDB.doc(path).get();
      if(!result.exists) {
        return const Option.some('No record found with the given email.');
      }

      final ExtUser user = ExtUser.fromJson(result.data()!);
      user.checkOutDateTime = dateTime;
      await _fireStoreDB.doc(path).set(user.toJson());
      return const Option.none();

    } catch (e) {
      debugLog(e.toString());
      return const Option.some('Couldn\'t end current session. Please try again later.');
    }
  }

  @override
  Future<Result<List<ExtUser>, String>> getDailySessions(DateTime dateTime) async {

    try{
      final path = 'sessions-users-ext/${mmyyyyFormatter(dateTime)}/${mmddyyyyFormatter(
          dateTime)}';
      final result = await _fireStoreDB.collection(path).get();

      List<ExtUser> resultList = [];
      for(var item in result.docs) {
        resultList.add(ExtUser.fromJson(item.data()));
      }
      return Result.ok(resultList);
    } catch (e) {
      return Result.err(e.toString());
    }
  }
}