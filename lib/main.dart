import 'package:flutter/material.dart';

void main() {
  runApp(const BondhuApp());
}

class BondhuApp extends StatelessWidget {
  const BondhuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bondhu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1877F2),
        ),
        scaffoldBackgroundColor: const Color(0xFFF0F2F5),
      ),
      home: const BondhuHomeScreen(),
    );
  }
}

class BondhuHomeScreen extends StatelessWidget {
  const BondhuHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Bondhu',
          style: TextStyle(
            color: Color(0xFF1877F2),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'বন্ধুত্বের নতুন ঠিকানা',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
