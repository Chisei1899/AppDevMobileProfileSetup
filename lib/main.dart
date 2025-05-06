import 'package:flutter/material.dart';
import 'fill_information_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Front End Profile Setup',
      home: const FillInformationPage(),
    );
  }
}