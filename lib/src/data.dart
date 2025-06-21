// ignore_for_file: camel_case_types

import 'package:flutter/painting.dart';

class FlData_c {
  static void Function(
    String text, {
    Duration? duration,
    FlMsgType? type,
  })? showTip;
  static void Function(
    String text,
    FlMsgType? type, {
    StackTrace? stack,
  })? addLog;
  static TextStyle? portTextStyle;
  static TextStyle? fieldTextStyle;
}

enum FlMsgType { success, error, warning, info }

void showTip(String message, FlMsgType type) {
  FlData_c.showTip?.call(
    message,
    duration: const Duration(seconds: 3),
    type: type,
  );
}

void addLog(
  String message,
  FlMsgType type, {
  StackTrace? stack,
}) {
  FlData_c.addLog?.call(
    message,
    type,
    stack: stack,
  );
}
