import 'dart:async';

import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/ui/pages/get_started_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:airplane/shared/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/get-started', (route) => false);
      } else {
        context
            .read<AuthCubit>().getCurrentUser(user.uid);
            Navigator.pushNamedAndRemoveUntil(context, '/main-page', (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(bottom: 50),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/icon_plane.png'))),
              ),
              Text('AIRPLANE',
                  style: whiteTextStyle.copyWith(
                      fontSize: 32, fontWeight: medium, letterSpacing: 10))
            ],
          ),
        ));
  }
}
