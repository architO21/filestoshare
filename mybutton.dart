// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String buttonText;
  Color buttonColor;
  var buttonPressed;
  MyButton(
      {super.key,
      required this.buttonText, // we are basically building a container as a button
      required this.buttonColor, // thus we need the name of the button like '1' ,'2' '+' etc then
      required this.buttonPressed}); // we need its color and finally we need its function that it performs

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // this is a class in flutter used to detect gestures like tap,press,slide etc
      onTap: () {
        // in this case we have tapped into the flutter button and we will perform the function mentioed in
        buttonPressed(buttonText); // the button with the text as a parameter
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2, // explained earlier
        height: MediaQuery.of(context).size.height * 0.1,
        color: buttonColor,
        child: Center(
            // Center is a very useful wifget used when we have to center our items
            child: Text(
                softWrap: false,
                maxLines: 1,
                overflow: TextOverflow.fade,
                buttonText,
                style:const TextStyle(fontSize: 40),)),
      ),
    );
  }
}
