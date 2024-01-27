import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class dectobin extends StatefulWidget {
  const dectobin({super.key});

  @override
  State<dectobin> createState() => _dectobinState();
}

class _dectobinState extends State<dectobin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:Column(
          children: [
            Text('helllo world')
          ],
        )
      ),
    );
  }
}
