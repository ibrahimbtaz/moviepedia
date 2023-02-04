import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moviepedia/screen/start/start.dart';
import 'package:flutterfire_cli/flutterfire_cli.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your appli  cation.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Start(),
    );
  }
}
