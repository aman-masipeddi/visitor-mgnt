import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:visitor_mgnt/usecases/auth/log_in_ext_user.dart';

part 'initial_state.dart';

class InitScreenCubit extends Cubit<InitScreenState> {
  InitScreenCubit() : super(InitScreenState.initialState);
  final LoginExtUserUserCase _loginExtUserUserCase = GetIt.I.get();

  Future<void> logInExtUser() async {
    emit(state._toLoading('Creating a temporary user session.'));
    final result = await _loginExtUserUserCase.execute();
    if(result.isSome()) {
      emit(state._toError(result.unwrap()));
    } else {
      emit(state._toSuccess());
    }
  }
}
