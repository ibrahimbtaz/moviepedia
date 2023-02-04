import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moviepedia/screen/inputlogin/InputLogin.dart';
import 'package:moviepedia/screen/inputlogin/components/MethodLogin.dart';
import 'package:moviepedia/screen/profile/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:moviepedia/comps/animated-dialog.dart';
import 'package:moviepedia/comps/styles.dart';
import 'package:moviepedia/screen/inputlogin/auth/auth.dart';
import 'package:moviepedia/screen/profile/mainprofile.dart';
import 'package:moviepedia/utils/Constant.dart';
class ChatWidgets {
  static Widget card({title, time, subtitle, onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Card(
        elevation: 0,
        child: ListTile(
          onTap: onTap,
          contentPadding: const EdgeInsets.all(5),
          leading: const Padding(
            padding: EdgeInsets.all(0.0),
            child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.white,
                )),
          ),
          title: Text(title),
          subtitle:subtitle !=null? Text(subtitle): null,
          trailing: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(time),
          ),
        ),
      ),
    );
  }

  static Widget circleProfile({onTap,name}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                size: 40,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 50,child: Center(child: Text(name,style: TextStyle(height: 1.5,fontSize: 12,color: Colors.white),overflow: TextOverflow.ellipsis,)))
          ],
        ),
      ),
    );
  }

  static Widget messagesCard(bool check, message, time) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (check) const Spacer(),
          if (!check)
            const CircleAvatar(
              child: Icon(
                Icons.person,
                size: 13,
                color: Colors.white,
              ),
              backgroundColor: Colors.grey,
              radius: 10,
            ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 250),
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(10),
              child: Text(
                '$message\n\n$time',
                style: TextStyle(color: check ? Colors.white : Colors.black),
              ),
              decoration: Styles.messagesCardStyle(check),
            ),
          ),
          if (check)
            const CircleAvatar(
              child: Icon(
                Icons.person,
                size: 13,
                color: Colors.white,
              ),
              backgroundColor: Colors.grey,
              radius: 10,
            ),
          if (!check) const Spacer(),
        ],
      ),
    );
  }

  static messageField({required onSubmit}) {
    final con = TextEditingController();

    return Container(
      margin: const EdgeInsets.all(5),
      child: TextField(
        controller: con,
        decoration: Styles.messageTextFieldStyle(onSubmit: () {
          onSubmit(con);
        }),
      ),
      decoration: Styles.messageFieldCardStyle(),
    );
  }

  static drawer(context) {
    return Drawer(
      backgroundColor: Colors.indigo.shade400,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20),
          child: Theme(
            data: ThemeData.dark(),
            child: Column(
              children:  [
                CachedNetworkImage(
                  imageUrl: FirebaseAuth.instance.currentUser!.photoURL ??
                      "https://cdn-icons-png.flaticon.com/512/1946/1946429.png",
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    backgroundColor: whiteColor,
                    backgroundImage: imageProvider,
                    radius: 60,
                  ),
                  placeholder: ((context, url) => const SizedBox(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: secondary,
                      ),
                    ),
                  )),
                ),
                const SizedBox(height: 10),
                const Divider(
                  color: Colors.white,
                ),
                //  ListTile(
                //   leading: Icon(Icons.person),
                //   title: Text('Profile'),
                //   onTap: (){
                //     Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                //   },
                // ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: ()async{
                    // await Auth().signOut();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainProfile()));
                  },
                  // onTap: () async {
                  //   await Auth().signOut();
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => signOut()),
                  //   );
                  // },

                ),
                // ListTile(
                //   leading: const Icon(Icons.arrow_back_ios),
                //   title: const Text('Back'),
                //   onTap: ()async{
                //     // await Auth().signOut();
                //     Navigator.push(context, MaterialPageRoute(builder: (context)=>MainProfile()));
                //   },
                //   // onTap: () async {
                //   //   await Auth().signOut();
                //   //   Navigator.push(
                //   //     context,
                //   //     MaterialPageRoute(builder: (context) => signOut()),
                //   //   );
                //   // },
                //
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<void> signOut() async {
    await Auth().signOut();
  }

  static searchBar(bool open, ) {
    return AnimatedDialog(
      height: open ? 800 : 0,
      width: open ? 400 : 0,

    );
  }

  static searchField({Function(String)? onChange}) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextField(
       onChanged: onChange,
        decoration: Styles.searchTextFieldStyle(),
      ),
      decoration: Styles.messageFieldCardStyle(),
    );
  }
}
