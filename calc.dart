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

class _CalcPageState extends State<CalcPage> {
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

  buttonPressed(String input) {
    if (input == 'C') {
      setState(() {
        expression = '';
        output = '';
      });
    } else if (input == '=') {
      evalexpression();
    } else if (input == 'DEL') {
      if (expression.length >= 1) {
        setState(() {
          expression = expression.substring(0, expression.length - 1);
        });
      }
    } else {
      setState(() {
        expression += input;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My calculator"),
          centerTitle: true,
          backgroundColor: Colors.black12,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.amber,
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.1,
                alignment: Alignment.centerRight,
                child: Text(
                  expression,
                  textScaleFactor: 1.5,
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
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
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
