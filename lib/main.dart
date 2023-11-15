import 'package:chat_app/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blueberry Chat App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SF Pro',
        applyElevationOverlayColor: false,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff233e83)),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Blueberry'),
    );
  }
}
