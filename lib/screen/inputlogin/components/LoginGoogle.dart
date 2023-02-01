import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moviepedia/screen/inputlogin/auth/auth.dart';
import 'package:moviepedia/utils/constant.dart';


class LoginGoogle extends StatefulWidget {
  const LoginGoogle({super.key});

  @override
  State<LoginGoogle> createState() => _LoginGoogleState();
}

class _LoginGoogleState extends State<LoginGoogle> {
  Future google() async {
    final Auth auth = Auth();
    try {
      await Future.delayed(const Duration(seconds: 1));
      await Auth().signInWithGoogle();
      const CircularProgressIndicator(
        color: secondary,
      );
    } on FirebaseAuthException {
      setState(() {
        const snackBar = SnackBar(
          duration: Duration(seconds: 2),
          content: Text("Please Fill in Your Email and Password"),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      });
    }
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: whiteColor, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: secondary, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          setState(() {
            loading = true;
          });
          google();
          Future.delayed(const Duration(seconds: 4));
        },
        child: loading
            ? const Center(
                child: SizedBox(
                height: 28.0,
                width: 28.0,
                child: CircularProgressIndicator(
                  color: secondary,
                ),
              ))
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Image(
                    image: AssetImage("assets/images/icons-google.png"),
                    width: 28,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text("Sign in with Google",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                ],
              ),
      ),
    );
  }
}
