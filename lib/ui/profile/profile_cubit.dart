import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:visitor_mgnt/usecases/auth/sign_out.dart';
import 'package:visitor_mgnt/usecases/storage/get_logged_in_user.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.initialState);

  final GetLoggedInUserUseCase _getLoggedInUserUseCase = GetIt.I.get();
  final SignOutUseCase _signOutUseCase = GetIt.I.get();

  Future<void> getUserInformation() async {
    emit(state._toLoading());
    final result = await _getLoggedInUserUseCase.execute();
    if (result.isErr()) {
      emit(state._toError(errorMessage: result.unwrapErr()));
    } else {
      final adminUser = result.unwrap().$1;
      emit(state._toSuccess(
        emailId: adminUser.emailId,
        contactNumber: adminUser.contactNumber,
        joinedDate: adminUser.joinedDate,
        fullName: adminUser.fullName,
      ));
    }
  }

  Future<void> signOut() async {
    final result = await _signOutUseCase.execute();
    if(result.isSome()){
      emit(state._toError(errorMessage: result.unwrap()));
    } else {
      emit(state._toSignOut());
    }
  }
}
