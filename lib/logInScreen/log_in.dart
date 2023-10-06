import 'dart:async';
import 'package:amis_admin/theAsked/theAsked.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AskedFor()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/01系统登录界面（改）.png', fit: BoxFit.cover,),
        Positioned(
            top: 147,
            right: 147,
            child: Container(
                child: const Text('**将实施后端服务来\n管理身份验证**')))
      ],
    );
  }
}
