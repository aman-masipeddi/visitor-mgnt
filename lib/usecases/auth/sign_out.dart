import 'package:oxidized/oxidized.dart';
import 'package:visitor_mgnt/out_ports/firebase_auth_port.dart';

abstract interface class SignOutUseCase {
  Future<Option<String>> execute();
}

class SignOutUseCaseImpl implements SignOutUseCase {
  final FirebaseAuthPort _firebaseAuthPort;

  SignOutUseCaseImpl(this._firebaseAuthPort);

  @override
  Future<Option<String>> execute() async {
    if (_firebaseAuthPort.getCurrentUser().isOk()) {
      return await _firebaseAuthPort.signOut();
    }
    return const Option.none();
  }
}
