import 'dart:async';
import 'package:flutter/material.dart';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const MainScreen()),
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/logos/liquid-galaxy.webp',
                width: 150,
                height: 150,
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              "Powered by",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 20),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 30,
              runSpacing: 20,
              children: const [
                LogoImage('assets/logos/github_logo.webp'),
                LogoImage('assets/logos/google-developers.webp'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LogoImage extends StatelessWidget {
  final String path;
  const LogoImage(this.path, {super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: 80,
      height: 40,
      fit: BoxFit.contain,
    );
  }
}