import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:new_strucuture/config/routes/app_routes.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  Future<void> finishOnboarding() async {
  
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('onBoarding', true);

    if (!mounted) return;

    Navigator.pushReplacementNamed(
      context,
      Routes.loginRoute,
      arguments: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(
          onPressed: finishOnboarding,
          child: const Text('Skip'),
        ),
      ),
    );
  }
}