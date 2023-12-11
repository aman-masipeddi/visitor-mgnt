import 'package:oxidized/oxidized.dart';

import 'package:visitor_mgnt/data_models/ext_user/ExtUser.dart';
import 'package:visitor_mgnt/out_ports/firebase_firestore_port.dart';

abstract interface class GetSessionsUseCase {
  Future<Result<List<ExtUser>, String>> execute(DateTime dateTime);
}

class GetSessionsUseCaseImpl implements GetSessionsUseCase {
  final FirebaseFireStorePort _fireStorePort;
  GetSessionsUseCaseImpl(this._fireStorePort);

  @override
  Future<Result<List<ExtUser>, String>> execute(DateTime dateTime) {
    return _fireStorePort.getDailySessions(dateTime);
  }

}