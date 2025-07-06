import 'package:flutter/material.dart';

class Navigation {
  static final GlobalKey<NavigatorState> _nk = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get nk => _nk;

  void goBack({BuildContext? context, dynamic result}) =>
      Navigator.of(context ?? nk.currentContext!).pop(result);

  Future goReplace(Widget widget, [BuildContext? context]) async =>
      await Navigator.of(
        context ?? nk.currentContext!,
      ).pushReplacement(MaterialPageRoute(builder: (_) => widget));

  Future goPush(Widget widget, [BuildContext? context]) async =>
      await Navigator.of(
        context ?? nk.currentContext!,
      ).push(MaterialPageRoute(builder: (context) => widget));
  Future goRemove(Widget widget, [BuildContext? context]) async =>
      await Navigator.of(context ?? nk.currentContext!).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget),
        (e) {
          return false;
        },
      );
}

Navigation nav = Navigation();
