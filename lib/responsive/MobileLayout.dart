import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:moviepedia/screen/start/start.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  @override
  Widget build(BuildContext context) {
    return Start();
  }
}
