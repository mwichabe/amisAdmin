import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtherScreen extends StatefulWidget {
  const OtherScreen({Key? key}) : super(key: key);

  @override
  State<OtherScreen> createState() => _OtherScreenState();
}

class _OtherScreenState extends State<OtherScreen> {
  bool value = false;
  bool value1 = false;
  bool value2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/后台管理.png', fit: BoxFit.cover),
          Positioned(
            left: 155,
            top: 168,
            child: Row(
              children: [
                Checkbox(
                  value: value,
                  onChanged: (newValue) {
                    setState(() {
                      value = newValue!;
                    });
                  },
                )
              ],
            ),
          ),
          Positioned(
            left: 155,
            top: 198,
            child: Row(
              children: [
                Checkbox(
                  value: value1,
                  onChanged: (newValue) {
                    setState(() {
                      value1 = newValue!;
                    });
                  },
                )
              ],
            ),
          ),
          Positioned(
            left: 155,
            top: 228,
            child: Row(
              children: [
                Checkbox(
                  value: value2,
                  onChanged: (newValue) {
                    setState(() {
                      value2 = newValue!;
                    });
                  },
                )
              ],
            ),
          ),
          Positioned(
            right: 32,
            top: 225,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('确认删除'),
                        content: Text('您确定要删除此记录吗？'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('是'),
                          ),
                          TextButton(
                            child: Text('否'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    );
                  },
                  icon: const Icon(CupertinoIcons.delete, color: Colors.red, size: 16),
                )
              ],
            ),
          ),
          Positioned(
            right: 32,
            top: 195,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('确认删除'),
                        content: Text('您确定要删除此记录吗？'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('是'),
                          ),
                          TextButton(
                            child: Text('否'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    );
                  },
                  icon: const Icon(CupertinoIcons.delete, color: Colors.red, size: 16),
                )
              ],
            ),
          ),
          Positioned(
            right: 32,
            top: 165,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('确认删除'),
                        content: Text('您确定要删除此记录吗？'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('是'),
                          ),
                          TextButton(
                            child: Text('否'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    );
                  },
                  icon: const Icon(CupertinoIcons.delete, color: Colors.red, size: 16),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}