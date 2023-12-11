import 'package:flutter/material.dart';



void showIntermediateErrorSnackBar(BuildContext context, String errorString) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(_errorSnackBar(errorString));
}

void showIntermediateInfoSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(_successSnackBar(message));
}

SnackBar _errorSnackBar(String errorString, {Duration? duration}) {
  return SnackBar(
    content: Text(errorString),
    backgroundColor: Colors.red.shade300,
    elevation: 5,
    duration: duration ?? const Duration(seconds: 4),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(5),
  );
}

SnackBar _successSnackBar(String string) {
  return SnackBar(
    content: Text(string),
    backgroundColor: Colors.green.shade300,
    elevation: 5,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(5),
  );
}
