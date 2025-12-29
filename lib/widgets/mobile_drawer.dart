import 'package:flutter/material.dart';

class MobileDrawer extends StatelessWidget {
  final Function(String) onItemTap;

  const MobileDrawer({super.key, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Center(
              child: Text(
                "SKD",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ...['Hero', 'About', 'Services', 'Projects', 'Contact'].map((item) {
            return ListTile(
              title: Text(item),
              onTap: () {
                onItemTap(item);
                Navigator.pop(context); // Close drawer
              },
            );
          }),
        ],
      ),
    );
  }
}
