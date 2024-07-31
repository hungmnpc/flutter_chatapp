import 'package:chat_app/pages/login_or_register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF376AED),
          primary: const Color(0xFF376AED),
          secondary: Colors.white70,
        ),
        useMaterial3: true,
      ),
      home: LoginOrRegister(),
    );
  }
}
