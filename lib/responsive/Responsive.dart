import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moviepedia/responsive/MobileLayout.dart';
import 'package:moviepedia/responsive/ResponsiveLayout.dart';
import 'package:moviepedia/responsive/TabletLayout.dart';

class Responsive extends StatefulWidget {
  const Responsive({super.key});

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobile: MobileLayout(),
        tablet: TabletLayout(),
      ),
    );
  }
}
