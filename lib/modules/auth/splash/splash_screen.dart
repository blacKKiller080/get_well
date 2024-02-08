import 'package:flutter/material.dart';

import '../../../core/helper/navigateable.dart';
import '../../../core/routes/routes.dart';

class SplashScreen extends StatefulWidget implements Navigateable {
  @override
  _SplashScreenState createState() => _SplashScreenState();

  @override
  String getName() {
    return Routes.splash;
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.of(context).pushReplacementNamed(Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/image/png/logo.png')),
    );
  }
}
