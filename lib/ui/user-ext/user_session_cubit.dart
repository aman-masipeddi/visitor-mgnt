import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:visitor_mgnt/ui/user-ext/user_session_screen.dart';
import 'package:visitor_mgnt/usecases/get_checked_in_user.dart';
import 'package:visitor_mgnt/usecases/storage/checkin_ext_user.dart';
import 'package:visitor_mgnt/usecases/storage/checkout_ext_user.dart';

part 'user_session_state.dart';

class UserSessionCubit extends Cubit<UserSessionState> {
  UserSessionCubit() : super(UserSessionState.initState);

  final CheckInExtUserUseCase _checkInExtUserUseCase = GetIt.I.get();
  final GetCheckedInUserUseCase _getCheckedInUserUseCase = GetIt.I.get();
  final CheckOutExtUserUseCase _checkOutExtUserUseCase = GetIt.I.get();

  void init() {
    emit(state._toLoading());
    final result = _getCheckedInUserUseCase.execute();
    if (result.isOk()) {
      final user = result.ok().unwrap();
      emit(state._toCheckedIn(
        fullName: user.fullName,
        emailId: user.emailId,
        conNumber: user.contactNumber,
        checkedInTime: user.checkInDateTime,
        extUserType: user.extUserType.userType,
      ));
    } else {
      emit(UserSessionState.initState);
    }
  }

  Future<void> checkInUser({
    required String email,
    required String fullName,
    required String conNumber,
    required ExtUserType extUserType,
  }) async {
    emit(state._toLoading());
    final result = await _checkInExtUserUseCase.execute(
        email, fullName, conNumber, extUserType);

    if (result.isSome()) {
      emit(state._toError(result.unwrap()));
    } else {
      Future.delayed(const Duration(seconds: 1), () {
        emit(state._toSuccess('Successfully checked in.'));
        init();
      });
    }
  }

  Future<void> checkOutUser() async {
    emit(state._toLoading());
    final result = await _checkOutExtUserUseCase.execute(state.emailId);
    if(result.isSome()) {
      emit(state._toError(result.unwrap()));
    } else {
      Future.delayed(const Duration(seconds: 1), () {
        emit(state._toSuccess('Successfully checked out.'));
        init();
      });
    }
  }
}
