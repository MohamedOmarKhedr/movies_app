import 'dart:async';

import 'package:movies_app/core/screens.dart' as screens;
import 'package:flutter/material.dart';
import 'package:movies_app/presentation/style/colors.dart';

import '../../../business_logic/cubit/app_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    AppCubit.get(context)
      .getMovies();
    super.didChangeDependencies();
  }
  @override
  void initState() {
    Timer(
        const Duration(milliseconds: 400),
        () => Navigator.pushNamedAndRemoveUntil(
            context, screens.homeLayout, (route) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [darkBlue, lightBlue, darkBlue])),
    );
  }
}
