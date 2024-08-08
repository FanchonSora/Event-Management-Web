import 'package:flutter/material.dart';
import 'package:mobile/pages/login_page.dart';
import 'package:mobile/utils/logging.dart';
import 'package:mobile/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1139805454.
      home: LoginPage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => LoginPage()
      },
    );
  }
}
