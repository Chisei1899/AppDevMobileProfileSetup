import 'package:flutter/material.dart';
import 'fill_information_page.dart'; // <-- Make sure this matches your file location!

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registration App',
      home: const RegistrationPage(),
    );
  }
}