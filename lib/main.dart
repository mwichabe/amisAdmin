import 'package:amis_admin/logInScreen/log_in.dart';
import 'package:amis_admin/otherScreen/otherScreen.dart';
import 'package:amis_admin/widgets/appBar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogInScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("这里会有徽标"), // Here will be the logo
        backgroundColor: Colors.white54,
      ),
      drawer: AppDrawer(),
      body:  Center(
        child: Stack(
          children: [
            Image.asset('assets/后台管理.png', fit: BoxFit.cover),
            Positioned(
                top: 150,
                right: 147,
                child: Text('将实施后端服务来管理CRUD操作',style: TextStyle(color: Colors.red,fontSize: 16,fontWeight: FontWeight.bold),)) // A backend service will be implemented to manage CRUD operations
          ],
        ),
      ),
    );
  }
}
