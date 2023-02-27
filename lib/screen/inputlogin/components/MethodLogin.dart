import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moviepedia/screen/inputlogin/auth/auth.dart';
import 'package:moviepedia/screen/inputlogin/components/LoginFacebook.dart';
import 'package:moviepedia/screen/inputlogin/components/LoginGoogle.dart';
import 'package:moviepedia/screen/inputlogin/components/Logo.dart';
import 'package:moviepedia/utils/constant.dart';

class MethodLogin extends StatefulWidget {
  const MethodLogin({Key? key}) : super(key: key);

  @override
  State<MethodLogin> createState() => _MethodLoginState();
}

class _MethodLoginState extends State<MethodLogin> {
  final Auth _auth = Auth();

  String? errorMessage = '';
  bool isLogin = true;
  bool obscureText = true;

  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
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

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
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

  Widget _entryFieldUsername(
    String title,
    TextEditingController controller,
  ) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(left: 20, right: 20),
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[200],
        boxShadow: const [
          BoxShadow(
              offset: Offset(0, 10), blurRadius: 50, color: Color(0xffEEEEEE)),
        ],
      ),
      child: TextField(
        cursorColor: secondary,
        decoration: const InputDecoration(
          icon: Icon(
            Icons.person,
            color: secondary,
          ),
          hintText: "Enter Username",
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        controller: controller,
      ),
    );
  }

  Widget _entryFieldEmail(
    String title,
    TextEditingController controller,
  ) {
    return Container(
      alignment: Alignment.center,

      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(left: 20, right: 20),
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[200],
        boxShadow: const [
          BoxShadow(
              offset: Offset(0, 10), blurRadius: 50, color: Color(0xffEEEEEE)),
        ],
      ),
      child: TextField(
        cursorColor: secondary,
        decoration: const InputDecoration(
          icon: Icon(
            Icons.email,
            color: secondary,
          ),
          hintText: "Enter Email",
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        controller: controller,
      ),
    );
  }

  Widget _entryFieldPassword(
    String title,
    TextEditingController controller,
  ) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(left: 20, right: 20),
      height: 56,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 50,
                color: Color(0xffEEEEEE)),
          ]),
      child: TextField(
        obscureText: obscureText,
        cursorColor: secondary,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: secondary,
            ),
          ),
          icon: const Icon(
            Icons.lock,
            color: secondary,
          ),
          hintText: "Enter Password",
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        controller: controller,
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      height: 56,
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: secondary,
          textStyle: const TextStyle(
              color: whiteColor, fontSize: 16, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: isLogin
            ? signInWithEmailAndPassword
            : createUserWithEmailAndPassword,
        child: Text(isLogin ? 'Login' : 'Sign Up'),
      ),
    );
  }

  Widget _loginOrRegisterButton() {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(isLogin
                ? "Don't Have Any Account? "
                : "Already Have an Account? "),
            TextButton(
              onPressed: () {
                setState(() {
                  isLogin = !isLogin;
                });
              },
              child: Text(
                isLogin ? 'Sign Up' : 'Login',
                style: const TextStyle(color: secondary),
              ),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: isLogin ? Login() : Register(),
        ),
      ),
    );
  }

  Widget Login() {
//tinggi laya hp dari atas smpai bawah
    final allheight = MediaQuery.of(context).size.height;
    //lebar layar hp
    final allwidth = MediaQuery.of(context).size.width;

    final myAppbar = AppBar(
      title: Text("latihan media query"),
    );

    //tinggi body
    final bodyheight = allheight -
        myAppbar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    final bodywidth = allwidth;
    //mengubah tampilan sesuai orientasi hp
    //memeriksa orientasi hp
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Center(
      child: (isLandscape)
          ?
          //lanscape
          Row(
              children: [
                Container(
                  width: bodywidth * 0.5,
                  height: allheight,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/gambar.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: allheight,
                  width: bodywidth * 0.5,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SingleChildScrollView(
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: bodyheight * 0.1,
                        ),
                        const Logo(),
                        _entryFieldEmail('email', _controllerEmail),
                        _entryFieldPassword('password', _controllerPassword),
                        _submitButton(),
                        const LoginGoogle(),
                        const LoginFacebook(),
                        _loginOrRegisterButton(),
                      ],
                    ),
                  ),
                ),
              ],
            )
          :
          //potrait
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(
                    height: bodyheight * 0.1,
                  ),
                  const Logo(),
                  _entryFieldEmail('email', _controllerEmail),
                  _entryFieldPassword('password', _controllerPassword),
                  _submitButton(),
                  const LoginGoogle(),
                  const LoginFacebook(),
                  _loginOrRegisterButton(),
                ],
              ),
          ),
    );
  }

  Widget Register() {
    //tinggi laya hp dari atas smpai bawah
    final allheight = MediaQuery.of(context).size.height;
    //lebar layar hp
    final allwidth = MediaQuery.of(context).size.width;

    final myAppbar = AppBar(
      title: Text("latihan media query"),
    );

    //tinggi body
    final bodyheight = allheight -
        myAppbar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    final bodywidth = allwidth;
    //mengubah tampilan sesuai orientasi hp
    //memeriksa orientasi hp
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Center(
      child: (isLandscape)
          ?
      //lanscape
      Row(
        children: [
          Container(
            width: bodywidth * 0.5,
            height: allheight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/gambar.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: allheight,
            width: bodywidth * 0.5,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: bodyheight * 0.1,
                  ),
                  const Logo(),
                  _entryFieldUsername('username', _controllerUsername),
                  _entryFieldEmail('email', _controllerEmail),
                  _entryFieldPassword('password', _controllerPassword),
                  _submitButton(),
                  _loginOrRegisterButton(),
                ],
              ),
            ),
          ),
        ],
      )
          :
      //potrait
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SizedBox(
              height: bodyheight * 0.1,
            ),
            const Logo(),
                  _entryFieldUsername('username', _controllerUsername),
                  _entryFieldEmail('email', _controllerEmail),
                  _entryFieldPassword('password', _controllerPassword),
                  _submitButton(),
                  _loginOrRegisterButton(),
          ],
        ),
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.only(top: 20),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       const Logo(),
    //       _entryFieldUsername('username', _controllerUsername),
    //       _entryFieldEmail('email', _controllerEmail),
    //       _entryFieldPassword('password', _controllerPassword),
    //       _submitButton(),
    //       _loginOrRegisterButton(),
    //     ],
    //   ),
    // );
  }
}
