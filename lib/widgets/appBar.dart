import 'package:amis_admin/main.dart';
import 'package:amis_admin/theAsked/theAsked.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(
            height: 70,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Amis 管理员',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('主页'),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('安全'),
            trailing: PopupMenuButton<String>(
              onSelected: (value) {
                // 处理选定的选项，例如导航到所选的屏幕。
                if (value == 'profile') {
                  // 处理选项 1。
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AskedFor()));
                } else if (value == 'friends') {
                  // 处理选项 2。
                }
                else if (value == 'group') {
                  // 处理选项 3。
                }
                else if (value == 'lock') {
                  // 处理选项 4。
                }
              },
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'profile',
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        Text('个人资料'),
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'friends',
                    child: Row(
                      children: [
                        Icon(Icons.groups),
                        Text('好友'),
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'group',
                    child: Row(
                      children: [
                        Icon(Icons.group),
                        Text('群组'),
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'lock',
                    child: Row(
                      children: [
                        Icon(Icons.lock),
                        Text('安全'),
                      ],
                    ),
                  ),
                  // 根据需要添加更多 PopupMenuItem。
                ];
              },
              icon: const Icon(Icons.arrow_drop_down),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('设置'),
            trailing: PopupMenuButton<String>(
              onSelected: (value) {
                // 处理选定的选项，例如导航到所选的屏幕。
                if (value == 'profile') {
                  // 处理选项 1。
                } else if (value == 'friends') {
                  // 处理选项 2。
                }
                else if (value == 'group') {
                  // 处理选项 3。
                }
                else if (value == 'lock') {
                  // 处理选项 4。
                }
              },
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'profile',
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        Text('个人资料'),
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'friends',
                    child: Row(
                      children: [
                        Icon(Icons.groups),
                        Text('好友'),
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'group',
                    child: Row(
                      children: [
                        Icon(Icons.group),
                        Text('群组'),
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'lock',
                    child: Row(
                      children: [
                        Icon(Icons.lock),
                        Text('安全'),
                      ],
                    ),
                  ),
                  // 根据需要添加更多 PopupMenuItem。
                ];
              },
              icon: const Icon(Icons.arrow_drop_down),
            ),
          ),
          // 根据需要添加更多 ListTile 选项。
        ],
      ),
    );
  }
}
