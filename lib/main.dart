import 'package:fintect_bot/screens/GetStartedScreen.dart';
import 'package:fintect_bot/screens/SignInScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: GetStartedScreen.id,
      initialRoute: GetStartedScreen.id,
      routes: {
        GetStartedScreen.id: (context) => const GetStartedScreen(),
        SignInScreen.id: (context) => const SignInScreen(),
      },
      home: const GetStartedScreen(),
    );
  }
}
