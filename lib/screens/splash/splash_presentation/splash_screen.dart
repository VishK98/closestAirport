import 'dart:async';

import 'package:closestairport/global/presentation/router/app_router.dart';
import 'package:closestairport/screens/login/login_presentation/login_screen.dart';
import 'package:flutter/material.dart';

import '../../../global/constants/app_icons.dart';
import '../../../global/constants/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(
            context,AppRoute.signIn));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppIcons.splash), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
