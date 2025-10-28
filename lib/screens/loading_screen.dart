import 'dart:async';
import 'package:flutter/material.dart';
import 'main_menu_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainMenuScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0F0F29), // 🔹 Màu nền
      body: Center(
        child: Image(
          image: AssetImage('assets/icons/icon_phenikaa.jpg'),
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
