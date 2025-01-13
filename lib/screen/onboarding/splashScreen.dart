import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskmanager_app/style/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container (
            padding: const EdgeInsets.all(30),
            child: Center(
              child: SvgPicture.asset("assets/images/logo.svg", alignment: Alignment.center)
            )
          )
        ]
      ),
    );
  }
}
