import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:helloworld/calc.dart';
import 'package:helloworld/dectobin.dart';

class Hamuburger extends StatefulWidget {
  const Hamuburger({super.key});

  @override
  State<Hamuburger> createState() => _HamuburgerState();
}

class _HamuburgerState extends State<Hamuburger> {
  String textstring = "dectobin";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(textstring)),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Add your navigation logic here
                setState(() {
                  
                textstring = 'home';
                });
                if (Navigator.canPop(context))
                  Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                setState(() {
                  
                textstring = 'dectobin';
                });
                // Add your navigation logic here
                if (Navigator.canPop(context))
                  Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: getPageWidget(textstring),
    );
  }

  Widget getPageWidget(String title) {
    switch (title) {
      case 'dectobin':
        return dectobin();
      default:
        return CalcPage();
    }
  }
}
