import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:luwe/core/utils/navigation.dart';

Dio dio = Dio();

double screenWidth([BuildContext? context]) =>
    MediaQuery.of(context ?? nav.nk.currentContext!).size.width;

double screenHeight([BuildContext? context]) =>
    MediaQuery.of(context ?? nav.nk.currentContext!).size.height;

double padTop([BuildContext? context]) =>
    MediaQuery.of(context ?? nav.nk.currentContext!).padding.top;

double rawWidth(double size) => (screenWidth() / 100) * size;

Widget rHeight(double size) => SizedBox(height: size);

Widget rWidth(double size) => SizedBox(width: size);

double rawHeight(double size) => (screenHeight() / 100) * size;

Widget yHeight(double size, [BuildContext? context]) =>
    SizedBox(height: rawHeight(size));

Widget xWidth(double size, [BuildContext? context]) =>
    SizedBox(width: rawWidth(size));
