import 'package:get_it/get_it.dart';
import 'package:visitor_mgnt/adapters/firebase_auth_adapter.dart';
import 'package:visitor_mgnt/adapters/firebase_firestore_adapter.dart';
import 'package:visitor_mgnt/out_ports/firebase_auth_port.dart';
import 'package:visitor_mgnt/out_ports/firebase_firestore_port.dart';
import 'package:visitor_mgnt/usecases/auth/log_in.dart';
import 'package:visitor_mgnt/usecases/auth/log_in_ext_user.dart';
import 'package:visitor_mgnt/usecases/auth/login_status_usecase.dart';
import 'package:visitor_mgnt/usecases/auth/sign_out.dart';
import 'package:visitor_mgnt/usecases/auth/sign_up.dart';
import 'package:visitor_mgnt/usecases/get_checked_in_user.dart';
import 'package:visitor_mgnt/usecases/storage/checkin_ext_user.dart';
import 'package:visitor_mgnt/usecases/storage/checkout_ext_user.dart';
import 'package:visitor_mgnt/usecases/storage/create_user.dart';
import 'package:visitor_mgnt/usecases/storage/get_logged_in_user.dart';
import 'package:visitor_mgnt/usecases/storage/session_activity/get_sessions.dart';
import 'package:visitor_mgnt/utilities/utilities.dart';

import 'adapters/sharedprefs/sharedprefs.dart';

bool _isRegisteredDI = false;

// Perform registration of dependency injection objects. If you are planning
// to have a singleton or factory objects - then this is a best place to
// perform registration of those objects.
Future<void> registerCommonDiObjects() async {
  if (_isRegisteredDI) {
    debugLog('Attempt to register (full) DI that was already registered');
    return;
  }
  _isRegisteredDI = true;

  final appPrefs = await SharedPreferencesAdapter.diRegistration();

  FirebaseAuthPort firebaseAuthPort = FirebaseAuthAdapter();
  FirebaseFireStorePort firebaseFireStorePort = FirebaseFireStoreAdapter();
  GetIt.I.registerSingleton<LogInUseCase>(LogInUseCaseImpl(firebaseAuthPort));
  GetIt.I.registerSingleton<LoginExtUserUserCase>(LoginExtUserUserCaseImpl(firebaseAuthPort));
  final createUserUseCase = GetIt.I.registerSingleton<CreateUserUseCase>(CreateUserUseCaseImpl(firebaseFireStorePort));
  GetIt.I
      .registerSingleton<SignOutUseCase>(SignOutUseCaseImpl(firebaseAuthPort));
  GetIt.I.registerSingleton<SignUpUseCase>(SignUpUseCaseImpl(firebaseAuthPort, createUserUseCase));
  GetIt.I.registerSingleton<GetLoggedInUserUseCase>(GetLoggedInUserUseCaseImpl(firebaseAuthPort, firebaseFireStorePort));
  GetIt.I.registerSingleton<LoginStatusUseCase>(LoginStatusUseCaseImpl(firebaseAuthPort));

  GetIt.I.registerSingleton<CheckInExtUserUseCase>(CheckInExtUserUseCaseImpl(firebaseFireStorePort, appPrefs));
  GetIt.I.registerSingleton<GetCheckedInUserUseCase>(GetCheckedInUserUseCaseImpl(appPrefs));
  GetIt.I.registerSingleton<CheckOutExtUserUseCase>(CheckOutExtUserUseCaseImpl(firebaseFireStorePort, appPrefs));
  GetIt.I.registerSingleton<GetSessionsUseCase>(GetSessionsUseCaseImpl(firebaseFireStorePort));
}
