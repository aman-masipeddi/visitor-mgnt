import 'package:oxidized/oxidized.dart';
import 'package:visitor_mgnt/out_ports/firebase_auth_port.dart';

abstract interface class LoginExtUserUserCase {
  Future<Option<String>> execute();
}

class LoginExtUserUserCaseImpl implements LoginExtUserUserCase {

  final FirebaseAuthPort _firebaseAuthPort;

  LoginExtUserUserCaseImpl(this._firebaseAuthPort);

  @override
  Future<Option<String>> execute() async {
    final result = await _firebaseAuthPort.anonymousSignIn();
    if(!result.isSome()) {
      return const Option.none();
    }
    return result;
  }
}