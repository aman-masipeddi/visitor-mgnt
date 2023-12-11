import 'package:oxidized/oxidized.dart';
import 'package:visitor_mgnt/out_ports/firebase_auth_port.dart';

abstract interface class LogInUseCase {

  Future<Option<String>> execute({required String email, required String password});
}

class LogInUseCaseImpl implements LogInUseCase {
  final FirebaseAuthPort _firebaseAuthPort;

  LogInUseCaseImpl(this._firebaseAuthPort);

  @override
  Future<Option<String>> execute(
      {required String email, required String password}) async {
    if (email.isEmpty) {
      return const Option.some('Please provide an email to authenticate.');
    }

    if(!email.contains('@')) {
      return const Option.some('Please provide a valid email to authenticate.');
    }

    if (password.isEmpty) {
      return const Option.some('Please provide a password to authenticate.');
    }

    final result = await _firebaseAuthPort.emailSignIn(email, password);
    if(!result.isSome()) {
      return const Option.none();
    }
    return result;
  }
}