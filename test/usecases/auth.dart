import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oxidized/oxidized.dart';
import 'package:visitor_mgnt/out_ports/firebase_auth_port.dart';
import 'package:visitor_mgnt/usecases/auth/log_in.dart';

class _MockFirebaseAuthPort extends Mock implements FirebaseAuthPort {}

main(){
  late FirebaseAuthPort _firebaseAuthPort;
  late LogInUseCase _loginUseCase;

  setUp(() {
    _firebaseAuthPort = _MockFirebaseAuthPort();
    _loginUseCase = LogInUseCaseImpl(_firebaseAuthPort);
  });
  
  group('LogInUseCase', () {
    test('if email is empty return error with a string', () async {
      when(() => _firebaseAuthPort.emailSignIn('', '')).thenAnswer((_) async => const Option.none());
      final result = await _loginUseCase.execute(email: '', password: 'password');
      expect(result, const Option.some('Please provide an email to authenticate.'));
    });

    test('if password is empty return error with a string', () async {
      when(() => _firebaseAuthPort.emailSignIn('', '')).thenAnswer((_) async => const Option.none());
      final result = await _loginUseCase.execute(email: 'user@yopmail.com', password: '');
      expect(result, const Option.some('Please provide a password to authenticate.'));
    });

    test('if email is invalid return error with a string', () async {
      when(() => _firebaseAuthPort.emailSignIn('', '')).thenAnswer((_) async => const Option.none());
      final result = await _loginUseCase.execute(email: 'yop.com', password: 'password');
      expect(result, const Option.some('Please provide a valid email to authenticate.'));
    });
  });
}