import 'package:fisa_ui_test/Parent/ParentProfile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ParentProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
