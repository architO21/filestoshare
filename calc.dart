import 'dart:html';
/* flutter is cross platform but only use this library when working on web apps otherwise either remove it 
or use import dart.io*/ 
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:math_expressions/math_expressions.dart';
import 'mybutton.dart';

class CalcPage extends StatefulWidget {
  const CalcPage({super.key});

  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> 
{
  /* imported a standard code and math_expressions library to perfrom calculations*/
  String expression = '';
  String output = '';
  evalexpression() {
    Parser p = Parser();
    Expression exp = p.parse(expression);
    // Bind variables:
    ContextModel cm = ContextModel();
    // Evaluate expression:
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
    output = eval.toString();
    });
  }
  /* functions for when a button is pressed*/
  buttonPressed(String input) {
    if (input == 'C') { // C is use to clear the current expression so we will
      setState(() { 
        expression = '';  // set expression as a null string and also output will be null
        output = '';
      });
    } else if (input == '=') {
      evalexpression();    // in case button is pressed which is equals to sign then we are supposed to evaluate the expression
    } else if (input == 'DEL') {
      if (expression.length >= 1) {// delete means we need to delete the last added character more like pop out 
        setState(() {
          expression = expression.substring(0, expression.length - 1);
        });
      }
    } else {
      setState(() { // in all other cases we will just append the sign to our expression
        expression += input;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar( // this is the top bar of our screen and is motly used to display screens title
          title: Text("My calculator"),
          centerTitle: true,
          backgroundColor: Colors.black12,
        ),
        body: Container( // this is the main body of the calculator app and we will use this to add buttons and stuff
          child: Column(// Column widget needed for the layout
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,// used to set the alignment so that things are evenly spread
            children: [
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.amber,
                width: MediaQuery.of(context).size.width * 0.95,// Media query is used when we want to make a responsive app 
                height: MediaQuery.of(context).size.height * 0.1,// this means that now the width will vary according to screens
                alignment: Alignment.centerRight,    
                child: Text(
                  expression,
                  textScaleFactor: 1.5, // text size normal*1.5 times
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.amber,
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.1,
                alignment: Alignment.centerRight,
                child: Text(
                  output,
                  textScaleFactor: 1.5,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,  // the size of this container must be half the screen size 
                child: Column( // Column widget for arranging the buttons
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,  // to evenly space the buttons
                    children: [
                      Row( // we have three columns and each column is made of three buttons aligned in vertical format
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // we want the buttons to be alligned evenly in vertical fashion 
                        children: [// the following template of a button is followed for  creating all the buttons
                          MyButton(
                              buttonText: "C",
                              buttonColor: Colors.orange,
                              buttonPressed: buttonPressed),
                          MyButton(
                              buttonText: "DEL",
                              buttonColor: Colors.orange,
                              buttonPressed: buttonPressed),
                          MyButton(
                              buttonText: "%",
                              buttonColor: Colors.orange,
                              buttonPressed: buttonPressed),
                          MyButton(
                              buttonText: "/",
                              buttonColor: Colors.orange,
                              buttonPressed: buttonPressed)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MyButton(
                              buttonText: "7",
                              buttonColor: Colors.blue,
                              buttonPressed: buttonPressed),
                          MyButton(
                              buttonText: "8",
                              buttonColor: Colors.blue,
                              buttonPressed: buttonPressed),
                          MyButton(
                              buttonText: "9",
                              buttonColor: Colors.blue,
                              buttonPressed: buttonPressed),
                          MyButton(
                              buttonText: "*",
                              buttonColor: Colors.orange,
                              buttonPressed: buttonPressed)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MyButton(
                              buttonText: "4",
                              buttonColor: Colors.blue,
                              buttonPressed: buttonPressed),
                          MyButton(
                              buttonText: "5",
                              buttonColor: Colors.blue,
                              buttonPressed: buttonPressed),
                          MyButton(
                              buttonText: "6",
                              buttonColor: Colors.blue,
                              buttonPressed: buttonPressed),
                          MyButton(
                              buttonText: "-",
                              buttonColor: Colors.orange,
                              buttonPressed: buttonPressed)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MyButton(
                              buttonText: "1",
                              buttonColor: Colors.blue,
                              buttonPressed: buttonPressed),
                          MyButton(
                              buttonText: "2",
                              buttonColor: Colors.blue,
                              buttonPressed: buttonPressed),
                          MyButton(
                              buttonText: "3",
                              buttonColor: Colors.blue,
                              buttonPressed: buttonPressed),
                          MyButton(
                              buttonText: "+",
                              buttonColor: Colors.orange,
                              buttonPressed: buttonPressed)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MyButton(
                              buttonText: ".",
                              buttonColor: Colors.blue,
                              buttonPressed: buttonPressed),
                          MyButton(
                              buttonText: "0",
                              buttonColor: Colors.blue,
                              buttonPressed: buttonPressed),
                          MyButton(
                              buttonText: "00",
                              buttonColor: Colors.blue,
                              buttonPressed: buttonPressed),
                          MyButton(
                              buttonText: "=",
                              buttonColor: Colors.orange,
                              buttonPressed: buttonPressed)
                        ],
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
