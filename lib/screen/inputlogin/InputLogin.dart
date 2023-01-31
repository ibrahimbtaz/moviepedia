import 'package:flutter/material.dart';
import 'package:moviepedia/profile/mainprofile.dart';
import 'package:moviepedia/screen/home/Home.dart';
import 'package:moviepedia/screen/inputlogin/auth/auth.dart';
import 'package:moviepedia/screen/inputlogin/components/MethodLogin.dart';

class Inputlogin extends StatefulWidget {
  const Inputlogin({Key? key}) : super(key: key);

  @override
  State<Inputlogin> createState() => _InputloginState();
}

class _InputloginState extends State<Inputlogin> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MainProfile();
        } else {
          return const MethodLogin();
        }
      },
    );
  }
}
