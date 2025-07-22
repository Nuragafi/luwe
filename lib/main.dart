import 'package:flutter/material.dart';
import 'package:luwe/core/provider/auth_provider.dart';
import 'package:luwe/core/utils/navigation.dart';
import 'package:luwe/ui/view/splashscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: MaterialApp(
        navigatorKey: nav.nk,
        title: 'Luwe',
        theme: ThemeData(fontFamily: 'Jakarta'),
        home: const Splashscreen(),
      ),
    );
  }
}
