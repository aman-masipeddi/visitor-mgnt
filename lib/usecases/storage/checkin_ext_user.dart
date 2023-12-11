import 'dart:convert';

import 'package:oxidized/oxidized.dart';
import 'package:visitor_mgnt/data_models/ext_user/ExtUser.dart';
import 'package:visitor_mgnt/out_ports/firebase_firestore_port.dart';
import 'package:visitor_mgnt/ui/user-ext/user_session_screen.dart';

import 'package:visitor_mgnt/out_ports/app_prefs.dart';
import 'package:visitor_mgnt/utilities/utilities.dart';

abstract interface class CheckInExtUserUseCase {
  Future<Option<String>> execute(
      String email, String fName, String conNumber, ExtUserType extUserType);
}

class CheckInExtUserUseCaseImpl implements CheckInExtUserUseCase {
  final FirebaseFireStorePort _fireStorePort;
  final AppPreferencesPort _preferencesPort;

  CheckInExtUserUseCaseImpl(this._fireStorePort, this._preferencesPort);

  @override
  Future<Option<String>> execute(
    String email,
    String fName,
    String conNumber,
    ExtUserType extUserType,
  ) async {
    if (email.isEmpty) {
      return const Option.some('Please provide an email to check in.');
    }

    if (fName.isEmpty) {
      return const Option.some(
          'Please provide your full name to check in');
    }

    if (conNumber.isEmpty) {
      return const Option.some(
          'Please provide your contact number to check in');
    }

    final DateTime date = DateTime.now();
    final sessionStatus =
        await _fireStorePort.checkIfExtUserSessionExist(email, date);
    if (sessionStatus.isNone()) {
      return const Option.some(
          'Session already created for the provided email.');
    }

    final ExtUser extUser = ExtUser(
      fullName: fName,
      emailId: email,
      contactNumber: conNumber,
      checkInDateTime: date,
      checkOutDateTime: null,
      extUserType: (userType: extUserType, userId: extUserType.id),
    );

    final result = await _fireStorePort.createExtSession(
      date,
      extUser,
    );

    if(result.isSome()) {
      return result;
    }

    _preferencesPort.setString('checked_in_ext_user', json.encode(extUser.toJson()));
    return result;
  }
}
