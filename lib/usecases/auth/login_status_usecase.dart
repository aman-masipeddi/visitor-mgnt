import 'package:oxidized/oxidized.dart';
import 'package:visitor_mgnt/out_ports/firebase_auth_port.dart';

abstract interface class LoginStatusUseCase {
  Result<bool, String> execute();
}

class LoginStatusUseCaseImpl implements LoginStatusUseCase{

  final FirebaseAuthPort _firebaseAuthPort;
  LoginStatusUseCaseImpl(this._firebaseAuthPort);

  @override
  Result<bool, String> execute()  {
    final result = _firebaseAuthPort.getCurrentUser();
    if(result.isErr()) {
      return Result.err(result.unwrapErr());
    }

    return Result.ok(!_firebaseAuthPort.isAnonymous);
  }
}