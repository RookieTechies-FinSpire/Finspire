import 'package:fintect_bot/screens/GetStartedScreen.dart';
import 'package:fintect_bot/screens/HomeScreen.dart';
import 'package:fintect_bot/screens/SignInScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  runApp(const MainApp());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        HomeScreen.id: (context) => const HomeScreen(),
      },
      home: const GetStartedScreen(),
    );
  }
}
