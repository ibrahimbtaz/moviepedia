import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moviepedia/screen/profile/components/ProfileMenu.dart';
import 'package:moviepedia/screen/profile/components/userid.dart';
import '../../chat/homepage.dart';
import '../../crud/crud.dart';
import '../../home/stateM.dart';
import '../../inputlogin/auth/auth.dart';

class BodyL extends StatelessWidget {
  final User? user = Auth().currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Userid(),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                child: ProfileMenu(
                  text: "Login",
                  icon: "assets/icons/user-solid.svg",
                  press: signOut,
                ),
              ),

              Container(
                width: 300,
                child: ProfileMenu(
                  text: "Crud",
                  icon: "assets/icons/cheese-solid.svg",
                  press: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Crud()))
                  },
                ),
              ),

              Container(
                width: 300,
                child: ProfileMenu(
                  text: "StateM",
                  icon: "assets/icons/settings-fill-icon.svg",
                  press: () => {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Home()))
                  },
                ),
              ),

              Container(
                width: 300,
                child: ProfileMenu(
                    text: "Chat",
                    icon: "assets/icons/chart-bar-regular.svg",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const homechat()),
                      );
                    }),
              ),
            ],
          ),
          // Container(
          //   width: 500,
          //   child: ProfileMenu(
          //     text: "Login",
          //     icon: "assets/icons/user-solid.svg",
          //     press: signOut,
          //   ),
          // ),
          //
          // Container(
          //   width: 500,
          //   child: ProfileMenu(
          //     text: "Crud",
          //     icon: "assets/icons/cheese-solid.svg",
          //     press: () => {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => const Crud()))
          //     },
          //   ),
          // ),
          //
          // Container(
          //   width: 500,
          //   child: ProfileMenu(
          //     text: "StateM",
          //     icon: "assets/icons/settings-fill-icon.svg",
          //     press: () => {
          //       Navigator.push(
          //           context, MaterialPageRoute(builder: (context) => Home()))
          //     },
          //   ),
          // ),
          //
          // Container(
          //   width: 500,
          //   child: ProfileMenu(
          //       text: "Chat",
          //       icon: "assets/icons/chart-bar-regular.svg",
          //       press: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => const homechat()),
          //         );
          //       }),
          // ),
          // SingleChildScrollView(
          //   child: Column(
          //     children: [
          //       ProfileMenu(
          //         text: "Login",
          //         icon: "assets/icons/user-solid.svg",
          //         press: signOut,
          //       ),
          //       ProfileMenu(
          //         text: "Crud",
          //         icon: "assets/icons/cheese-solid.svg",
          //         press: () => {
          //           Navigator.push(context,
          //               MaterialPageRoute(builder: (context) => const Crud()))
          //         },
          //
          //       ),
          //       ProfileMenu(
          //         text: "StateM",
          //         icon: "assets/icons/settings-fill-icon.svg",
          //         press: () => {Navigator.push(context,
          //             MaterialPageRoute(builder: (context) => Home()))},
          //       ),
          //
          //       ProfileMenu(
          //           text: "Chat",
          //           icon: "assets/icons/chart-bar-regular.svg",
          //           press: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (context) => const homechat()),
          //             );
          //           }
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }
}
