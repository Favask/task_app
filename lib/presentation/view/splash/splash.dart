import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profile_app/presentation/view/login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    // Set immersive mode
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Navigate after delay with mounted check
    _navigateToLogin();
  }

  void _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 3), () {
      // Check if widget is still mounted before navigating
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    });
  }

  @override
  void dispose() {
    // Restore default system UI modes
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Welcome to Task App"),
      ),
    );
  }
}
