import 'package:firebase_auth/firebase_auth.dart';
import 'package:oxidized/oxidized.dart';

abstract interface class FirebaseAuthPort {
  Future<Option<String>> emailSignIn(String email, String password);

  Future<Option<String>> anonymousSignIn();

  bool get isAnonymous;

  Future<Option<String>> signOut();

  Result<User, String> getCurrentUser();

  Future<Result<User, String>> emailSignUp(String email, String password);

  Future<Option<String>> updateUserFullName(String fName);
}
