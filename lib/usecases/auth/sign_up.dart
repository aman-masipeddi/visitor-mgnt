import 'package:oxidized/oxidized.dart';
import 'package:visitor_mgnt/out_ports/firebase_auth_port.dart';

import '../storage/create_user.dart';

abstract interface class SignUpUseCase {
  Future<Option<String>> execute(
      String email, String password, String fName, String contactNumber);
}

class SignUpUseCaseImpl implements SignUpUseCase {
  final FirebaseAuthPort _firebaseAuthPort;
  final CreateUserUseCase _createUserUseCase;

  SignUpUseCaseImpl(this._firebaseAuthPort, this._createUserUseCase);

  @override
  Future<Option<String>> execute(
      String email, String password, String fName, String contactNumber) async {
    if (email.isEmpty) {
      return const Option.some('Please provide an email to create an account.');
    }

    if (password.isEmpty) {
      return const Option.some(
          'Please provide a password  to create an account.');
    }

    if (fName.isEmpty) {
      return const Option.some(
          'Please provide your full name  to create an account.');
    }
    final signUpResult = await _firebaseAuthPort.emailSignUp(email, password);

    if (signUpResult.isErr()) {
      return signUpResult.err();
    }

    final updateFName = await _firebaseAuthPort.updateUserFullName(fName);
    if (updateFName.isSome()) {
      return updateFName;
    }

    final finalResult = await _createUserUseCase.createUser(
      uid: signUpResult.ok().unwrap().uid,
      fullName: fName,
      emailId: email,
      contactNumber: contactNumber,
      joinedDate: DateTime.now(),
    );
    return finalResult;
  }
}
