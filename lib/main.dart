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

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Map<String, dynamic>> users = [
    {'name': '陈 (Chén)'},
    {'name': '刘 (Liú)'},
    {'name': '张 (Zhāng)'},
    {'name': '王大明'},
    {'name': '李小红'},
    {'name': '张三'},
    {'name': '林四'},
    {'name': '杨 (Yáng)'},
    {'name': '黄 (Huáng)'},
    {'name': '吴 (Wú)'},
    {'name': 'Jing 静'},
    {'name': 'Hua 花'},
    {'name': 'Chun 春'},
  ];

  void _deleteUser(int index) {
    setState(() {
      users.removeAt(index);
    });
  }

  void _editUser(int index) {
    setState(() {

      users[index]['name'] = '等待更新...';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("这里会有徽标"), // Here will be the logo
        backgroundColor: Colors.white54,
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(users[index]['name']),
            trailing: Wrap(
              spacing: 8,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  //
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('确认对话框'),
                              content: Text('您确定要执行此操作吗？'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    _editUser(index);
                                    Navigator.pop(context);
                                  },
                                  child: Text('是的'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('不'),
                                ),
                              ],
                            ));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  //
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('确认对话框'),
                              content: Text('您确定要执行此操作吗？'),
                              actions: [
                                TextButton(
                                  onPressed: () {_deleteUser(index);
                                    Navigator.pop(context);
                                  } ,
                                  child: Text('是的'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('不'),
                                ),
                              ],
                            ));
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
