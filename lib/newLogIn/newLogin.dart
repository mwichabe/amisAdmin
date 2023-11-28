import 'dart:developer';

import 'package:amis_admin/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewLogIn extends StatefulWidget {
  const NewLogIn({Key? key}) : super(key: key);

  @override
  State<NewLogIn> createState() => _NewLogInState();
}

class _NewLogInState extends State<NewLogIn> {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  bool passwordVisible = true;
  bool rememberMe = false;
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  // List to store user credentials
  List<Map<String, String>> users = [
    {'email': 'admisadmin@gmail.com', 'password': 'Admin@123'},
    {'email': 'mwich@gmail.com', 'password': 'Avator@2'},
    {'email': 'amisadmin@gmail.com', 'password': 'Amis@1'}
    // Add more users as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF310544),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            '登录活动',
            style: GoogleFonts.rubik(
              textStyle: const TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.black),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Center(
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.height / 2,
                  height: MediaQuery.of(context).size.height / 9,
                  child: Center(
                    child: Container(
                      width: 150,
                      height: 40,
                      color: Colors.red,
                      child: Text(
                        'amis \n '
                        'admin',
                        style: GoogleFonts.rubik(
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5.5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailEditingController,
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: '输入电子邮件',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ('电子邮件字段为必填项');
                          }
                          //regEx for email
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return ("请输入有效电子邮件");
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        obscureText: passwordVisible,
                        controller: passwordEditingController,
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: '输入密码',
                          hintStyle: const TextStyle(color: Colors.white),
                          enabledBorder: const OutlineInputBorder(),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                            icon: Icon(
                              passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          RegExp regex = RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!$@#&*~]).{6,}$');
                          if (value!.isEmpty) {
                            return ('密码字段必填');
                          }
                          //regEx for password field
                          if (!regex.hasMatch(value)) {
                            return ('密码应该: \n'
                                ' 至少有 6 个字符\n '
                                '有一个符号\n'
                                '有大写的 \n'
                                '有一个数字 \n'
                                '例子。 amisAdmin@1');
                          }
                          return null;
                        },
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(children: [
              Checkbox(
                checkColor: Colors.black,
                activeColor: Colors.white,
                value: rememberMe,
                onChanged: (newValue) {
                  // Add your logic here to handle the checkbox state change
                  setState(() {
                    rememberMe = newValue ?? false;
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(color: Colors.white)),
              ),
              const Text(
                '记住账号',
                style: TextStyle(color: Colors.white),
              ),
            ]),
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              height: 30,
              child: ElevatedButton(
                onPressed: () {
                  signIn(emailEditingController.text,
                      passwordEditingController.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Text(
                  '登录',
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void signIn(String email, String password) {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      try {
        // Perform sign-in using the list
        var user = users.firstWhere(
              (user) => user['email'] == email && user['password'] == password,
        );

        setState(() {
          isLoading = false;
        });

        // Navigate to home screen
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen()));

        // Show success message using Snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('登陆成功'),
            backgroundColor: Colors.green,
          ),
        );
      } catch (e) {
        setState(() {
          isLoading = false;
        });

        // Show error message using Snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('无效证件。请检查您的电子邮件和密码。'),
            backgroundColor: Colors.red,
          ),
        );
        log('无效证件');
      }
    }
  }
}
