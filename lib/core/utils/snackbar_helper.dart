import 'package:flutter/material.dart';
import 'package:luwe/core/utils/navigation.dart';

class Snackbar {
  static general(String? label, [BuildContext? context]) {
    return ScaffoldMessenger.of(context ?? nav.nk.currentContext!).showSnackBar(
      SnackBar(
        content: Text(label ?? "", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  static success(String? label, [BuildContext? context]) {
    return ScaffoldMessenger.of(context ?? nav.nk.currentContext!).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(label ?? "", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  static error(String? label, [BuildContext? context]) {
    return ScaffoldMessenger.of(context ?? nav.nk.currentContext!).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(label ?? "", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
