import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:visitor_mgnt/usecases/auth/sign_up.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState.initialState);
  final _signUpUseCase = GetIt.I<SignUpUseCase>();

  Future<void> signUp({
    required String email,
    required String password,
    required String fName,
    required String phoneNum,
  }) async {
    emit(state._toLoading('Creating an account'));

    final result = await _signUpUseCase.execute(
      email,
      password,
      fName,
      phoneNum,
    );
    if (result.isSome()) {
      emit(state._toError(errorMessage: result.unwrap()));
    } else {
      emit(state._toSuccess(finish: true));
    }
  }
}
