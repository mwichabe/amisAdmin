import 'dart:async';

import 'package:flutter/material.dart';

import '../main.dart';
class AskedFor extends StatefulWidget {
  const AskedFor({Key? key}) : super(key: key);

  @override
  State<AskedFor> createState() => _AskedForState();
}

class _AskedForState extends State<AskedFor> {
  bool value = false;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/05设备维修情况.png',fit: BoxFit.cover,);
  }
}
