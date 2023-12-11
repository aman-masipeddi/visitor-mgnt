import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

debugLog(Object obj) {
  if(kDebugMode) {
    print(obj);
  }
}

//ex: July 10, 1996
String yMMMdFormatter(DateTime dateTime){
  return DateFormat.yMMMd('en_US').format(dateTime);
}

//ex: 07-1996
String mmyyyyFormatter(DateTime dateTime){
  return DateFormat('MM-yyyy').format(dateTime);
}

//ex: 07-10-1996
String mmddyyyyFormatter(DateTime dateTime){
  return DateFormat('MM-dd-yyyy').format(dateTime);
}

//ex: July 10, 1996 5:08 PM
String yMMMMdjmFormatter(DateTime dateTime) {
  return DateFormat.yMMMd('en_US').add_jm().format(dateTime);
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month
        && day == other.day;
  }

  DateTime getDateOnly() {
    return DateTime(year, month, day, 0, 0, 0, 0, 0);
  }
}

