import 'package:flutter/material.dart';
import 'package:luwe/core/utils/navigation.dart';

class DialogHelper {
  static initDialog(
    Widget dialog, [
    BuildContext? context,
    bool? barrierDismissible,
  ]) async {
    return await showDialog(
      barrierDismissible: barrierDismissible ?? false,
      context: context ?? nav.nk.currentContext!,
      builder: (c) => dialog,
    );
  }
}
