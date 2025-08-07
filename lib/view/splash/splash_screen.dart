import 'package:flutter/material.dart';
import 'package:priya_freshmeats_delivery/utils/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
  }

  Future<void> _navigateAfterDelay() async {
    Future.delayed(Duration(seconds: 5), () async {
      Navigator.pushReplacementNamed(context, RoutesName.loginscreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorscheme.primaryContainer,
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/splashscreendelboy.png",
            
          ),
        ],
      ),
    );
  }
}
