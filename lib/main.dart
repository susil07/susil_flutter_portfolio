import 'package:flutter/material.dart';
import 'package:susil_flutter_portfolio/screens/home_screen.dart';
import 'package:susil_flutter_portfolio/theme/theme.dart';
import 'package:susil_flutter_portfolio/widgets/splash_screen.dart';


void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  ThemeMode _themeMode = ThemeMode.system;
  bool _showSplash = true;

  void _onSplashFinished() {
    setState(() {
      _showSplash = false;
    });
  }

  void _toggleTheme() {
    setState(() {
      if (_themeMode == ThemeMode.light) {
        _themeMode = ThemeMode.dark;
      } else if (_themeMode == ThemeMode.dark) {
        _themeMode = ThemeMode.light;
      } else {
        // If system, switch to opposite of platform brightness
        var brightness = MediaQuery.platformBrightnessOf(context);
        _themeMode = brightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showSplash) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: _themeMode,
        home: SplashScreen(onFinished: _onSplashFinished),
      );
    }

    return MaterialApp(
      title: 'Susil Kumar Dora - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      home: HomeScreen(
        onThemeToggle: _toggleTheme,
        currentThemeMode: _themeMode,
      ),
    );
  }
}
