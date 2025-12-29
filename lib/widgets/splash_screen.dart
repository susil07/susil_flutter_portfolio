import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onFinished;

  const SplashScreen({super.key, required this.onFinished});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), widget.onFinished);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;
    final imagePath = isMobile
        ? 'assets/splash/splash_mobile.png'
        : 'assets/splash/splash_web.png';

    return Scaffold(
      backgroundColor: Colors.black, // Or Theme.of(context).scaffoldBackgroundColor
      body: Center(
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
          width: isMobile ? 300 : 600, // Adjust size as needed
        ),
      ),
    );
  }
}
