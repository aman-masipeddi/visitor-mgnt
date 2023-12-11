import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:visitor_mgnt/usecases/auth/log_in.dart';
import 'package:visitor_mgnt/usecases/auth/sign_out.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInState.initialState);

  final LogInUseCase _logInUseCase = GetIt.I<LogInUseCase>();
  final SignOutUseCase _signOutUseCase = GetIt.I<SignOutUseCase>();

  Future<void> init() async{
    await _signOutUseCase.execute();
  }

  Future<void> onLogIn({required String emailID, required String password}) async {
    emit(state._toLoading('Authenticating email ID and password'));

    final result = await _logInUseCase.execute(email: emailID, password: password);

    if(result.isSome()) {
     emit(state._toError(errorMessage: result.unwrap()));
    } else {
      emit(state._toSuccess(finish: true));
    }
  }
}
