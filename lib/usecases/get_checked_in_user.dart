import 'dart:convert';

import 'package:oxidized/oxidized.dart';
import 'package:visitor_mgnt/data_models/ext_user/ExtUser.dart';
import 'package:visitor_mgnt/out_ports/app_prefs.dart';

abstract interface class GetCheckedInUserUseCase {
  Result<ExtUser,String> execute();
}

class GetCheckedInUserUseCaseImpl implements GetCheckedInUserUseCase {

  final AppPreferencesPort _appPreferencesPort;
  GetCheckedInUserUseCaseImpl(this._appPreferencesPort);

  @override
  Result<ExtUser,String> execute() {
   final String string = _appPreferencesPort.getString('checked_in_ext_user') ?? '';
   if(string.isEmpty) {
     return const Result.err('No checked in user found.');
   }

   return Result.ok(ExtUser.fromJson(json.decode(string)));
  }
}