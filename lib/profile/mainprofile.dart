import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moviepedia/profile/components/body.dart';
import 'package:moviepedia/screen/inputlogin/auth/auth.dart';


class MainProfile extends StatelessWidget {
  final User? user = Auth().currentUser;

  MainProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Body()],
        ),
      ),
    );
  }
}
