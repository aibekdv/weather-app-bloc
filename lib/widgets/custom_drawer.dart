import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(6, 199, 241, 1),
              image: DecorationImage(
                image: AssetImage("assets/images/drawer-bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.all(0),
            child: SizedBox(),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            minLeadingWidth: 10,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            minLeadingWidth: 10,
            autofocus: true,
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/about");
            },
          ),
        ],
      ),
    );
  }
}
