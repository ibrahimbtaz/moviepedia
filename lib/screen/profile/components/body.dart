import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moviepedia/screen/home/stateM.dart';
import 'package:moviepedia/screen/inputlogin/auth/auth.dart';
import 'package:moviepedia/screen/profile/components/ProfileMenu.dart';
import 'package:moviepedia/screen/profile/components/userid.dart';

class Body extends StatelessWidget {
  final User? user = Auth().currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Userid(),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "Login",
            icon: "assets/icons/user-solid.svg",
            press: signOut,
          ),
          ProfileMenu(
            text: "Crud",
            icon: "assets/icons/cheese-solid.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "StateM",
            icon: "assets/icons/settings-fill-icon.svg",
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>Home()));
            },
          ),
          ProfileMenu(
            text: "Notification",
            icon: "assets/icons/bell-solid.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Chat",
            icon: "assets/icons/chart-bar-regular.svg",
            press: () {},
          ),
          // ProfileMenu(
          //   text: "Logout",
          //   icon: "assets/icons/logout-fill-icon.svg",
          //   press: signOut,
          // ),
        ],
      ),
    );
  }

  Future<void> signOut() async {
    await Auth().signOut();
  }
}
