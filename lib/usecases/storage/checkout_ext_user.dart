import 'package:oxidized/oxidized.dart';
import 'package:visitor_mgnt/out_ports/firebase_firestore_port.dart';

import 'package:visitor_mgnt/out_ports/app_prefs.dart';

abstract interface class CheckOutExtUserUseCase {
  Future<Option<String>> execute(
      String email);
}

class CheckOutExtUserUseCaseImpl implements CheckOutExtUserUseCase {
  final FirebaseFireStorePort _fireStorePort;
  final AppPreferencesPort _preferencesPort;

  CheckOutExtUserUseCaseImpl(this._fireStorePort, this._preferencesPort);

  @override
  Future<Option<String>> execute(String email) async {
    final result = await _fireStorePort.endExtSession(email, DateTime.now());
    if(result.isSome()) {
      return result;
    }
    await _preferencesPort.remove('checked_in_ext_user');
    return result;
  }
}

