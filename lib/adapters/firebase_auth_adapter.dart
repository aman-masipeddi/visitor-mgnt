import 'package:firebase_auth/firebase_auth.dart';
import 'package:oxidized/oxidized.dart';
import 'package:visitor_mgnt/out_ports/firebase_auth_port.dart';

class FirebaseAuthAdapter implements FirebaseAuthPort {
  final _firebaseAuthInstance = FirebaseAuth.instance;

  @override
  Future<Option<String>> emailSignIn(String email, String password) async {
    try {
      final userCred = await _firebaseAuthInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCred.user != null) {
        return const Option.none();
      }

      return const Option.some('Could not verify user. Please try again.');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const Option.some(
            'No user found with provided email. Please try again.');
      } else {
        return const Option.some('Incorrect user name or password.');
      }
    }
  }

  @override
  Future<Option<String>> signOut() async {
    try {
      await _firebaseAuthInstance.signOut();
      return const Option.none();
    } catch (e) {
      return Option.some(e.toString());
    }
  }

  @override
  Result<User, String> getCurrentUser() {
    final result = _firebaseAuthInstance.currentUser;
    if (result != null) {
      return Result.ok(result);
    }
    return const Result.err('No user signed In');
  }

  @override
  Future<Result<User, String>> emailSignUp(
      String email, String password) async {
    try {
      final result = await _firebaseAuthInstance.createUserWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        return Result.ok(result.user!);
      }
      return const Result.err('Couldn\'t  create an account.');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return const Result.err('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return const Result.err('The account already exists for that email.');
      } else {
        return const Result.err('Couldn\'t  create an account.');
      }
    } catch (e) {
      return const Result.err('Couldn\'t  create an account.');
    }
  }

  @override
  Future<Option<String>> updateUserFullName(String fName) async {
    try {
      await _firebaseAuthInstance.currentUser?.updateDisplayName(fName);

      return const Option.none();
    } catch (e) {
      return Option.some(e.toString());
    }
  }

  @override
  Future<Option<String>> anonymousSignIn() async {
    try {
      final userCred = await _firebaseAuthInstance.signInAnonymously();

      if (userCred.user != null) {
        return const Option.none();
      }

      return const Option.some('Could not verify user. Please try again.');
    } on FirebaseAuthException {
      return const Option.some('Couldn\'t create a temporary user');
    }
  }

  @override
  bool get isAnonymous => _firebaseAuthInstance.currentUser?.isAnonymous ?? false;
}
