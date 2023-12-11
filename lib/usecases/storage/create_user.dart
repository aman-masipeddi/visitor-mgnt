import 'package:oxidized/oxidized.dart';
import 'package:visitor_mgnt/data_models/admin_user/AdminUser.dart';
import 'package:visitor_mgnt/out_ports/firebase_firestore_port.dart';

abstract interface class CreateUserUseCase {
  Future<Option<String>> createUser({
    required String uid,
    required String fullName,
    required String emailId,
    required String contactNumber,
    required DateTime joinedDate,
  });
}

class CreateUserUseCaseImpl implements CreateUserUseCase {
  final FirebaseFireStorePort _firebaseFireStorePort;

  CreateUserUseCaseImpl(this._firebaseFireStorePort);

  @override
  Future<Option<String>> createUser(
      {required String uid,
      required String fullName,
      required String emailId,
      required String contactNumber,
      required DateTime joinedDate}) async {
    final adminUser = AdminUser(
      uid: uid,
      fullName: fullName,
      emailId: emailId,
      contactNumber: contactNumber,
      joinedDate: joinedDate,
    );

    if (fullName.isEmpty) {
      return const Option.some(
          'Please provide a full name to create an account.');
    }
    if (emailId.isEmpty) {
      return const Option.some(
          'Please provide an email ID to create an account.');
    }
    if (contactNumber.isEmpty) {
      return const Option.some(
          'Please provide a contact number to create an account.');
    }

    final result = await _firebaseFireStorePort.createAdminUser(adminUser);
    return result;
  }
}
