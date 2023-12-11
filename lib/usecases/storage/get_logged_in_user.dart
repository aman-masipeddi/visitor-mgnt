import 'package:oxidized/oxidized.dart';
import 'package:visitor_mgnt/data_models/admin_user/AdminUser.dart';
import 'package:visitor_mgnt/out_ports/firebase_auth_port.dart';
import 'package:visitor_mgnt/out_ports/firebase_firestore_port.dart';

abstract interface class GetLoggedInUserUseCase {
  Future<Result<(AdminUser, bool), String>> execute();
}

class GetLoggedInUserUseCaseImpl implements GetLoggedInUserUseCase {
  final FirebaseAuthPort _firebaseAuthPort;
  final FirebaseFireStorePort _firebaseFireStorePort;
  
  GetLoggedInUserUseCaseImpl(this._firebaseAuthPort, this._firebaseFireStorePort);
  @override
  Future<Result<(AdminUser, bool), String>> execute() async {
    final userResult = _firebaseAuthPort.getCurrentUser();
    
    if(userResult.isErr()) {
      return const Result.err('Couldn\'t retrieve user information');
    }
    final result = await _firebaseFireStorePort.getAdminUserInfo(userResult.unwrap().uid);
    if(result.isErr()) {
      return Result.err(result.unwrapErr());
    }
    return Result.ok((result.unwrap(), _firebaseAuthPort.isAnonymous));
  }
}