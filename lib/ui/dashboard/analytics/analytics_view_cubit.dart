import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:visitor_mgnt/ui/user-ext/user_session_screen.dart';
import 'package:visitor_mgnt/usecases/storage/session_activity/get_sessions.dart';

import '../../../data_models/ext_user/ExtUser.dart';

part 'analytics_view_state.dart';

class AnalyticsViewCubit extends Cubit<AnalyticsViewState> {
  AnalyticsViewCubit() : super(AnalyticsViewState.initState);

  final GetSessionsUseCase _getSessionsUseCase = GetIt.I.get();

  void init() {
    getUsersData(DateTime.now());
  }

  Future<void> getUsersData(DateTime dateTime) async {
    emit(state._copyWith(selectedDateTime: dateTime));
    emit(state._toLoading());
    final result = await _getSessionsUseCase.execute(dateTime);
    if(result.isErr()) {
      emit(state._toError(result.unwrapErr()));
    } else {
      _processRetrievedData(result.unwrap());
    }
  }

  _processRetrievedData(List<ExtUser> users) {

    Map<ExtUserType, int> map = {
      ExtUserType.visitor: 0,
      ExtUserType.vendor: 0,
      ExtUserType.serviceProvider: 0,
      ExtUserType.other: 0,
    };

    for (var element in users) {
      map.update(element.extUserType.userType, (value) => value + 1, ifAbsent: () => 0);
    }

    final int totalUsers = users.length;
    map.forEach((key, value) {
      if(value > 0) {
        map.update(key, (value) => ((value / totalUsers) * 100).toInt());
      }
    });

    emit(state._copyWith(totalUsers: totalUsers, analyticsMap: map, isLoading: false));
  }
}
