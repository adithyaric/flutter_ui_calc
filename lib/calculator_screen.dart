import 'package:flutter/material.dart';
import 'package:ui_calc/buttons.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculactorScreen extends StatefulWidget {
  const CalculactorScreen({super.key});

  @override
  State<CalculactorScreen> createState() => _CalculactorScreenState();
}

class _CalculactorScreenState extends State<CalculactorScreen> {
  var userInput = '';
  var userOutput = '0';
  // Array of button
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '9',
    '8',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    '00',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Calculactor"),
      // ),
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userInput,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userOutput,
                    style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.deepPurple[300],
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    // return Text(buttons[index]);
                    switch (index) {
                      case 0: //'C'
                        return Buttons(
                          buttontapped: () {
                            setState(() {
                              userInput = '';
                              userOutput = '0';
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.green[800],
                          textColor: Colors.white,
                        );
                      case 1: // 'DEL'
                        return Buttons(
                          buttontapped: () {
                            setState(() {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.green[400],
                          textColor: Colors.white,
                        );
                      case 19: // '='
                        return Buttons(
                          buttontapped: () {
                            setState(() {
                              equalPressed();
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.deepPurpleAccent,
                          textColor: Colors.white,
                        );
                      default:
                        return Buttons(
                          buttontapped: () {
                            setState(() {
                              userInput += buttons[index];
                            });
                          },
                          buttonText: buttons[index],
                          color: isOperator(buttons[index])
                              ? Colors.deepPurple
                              : Colors.deepPurple[50],
                          textColor: isOperator(buttons[index])
                              ? Colors.white
                              : Colors.deepPurple,
                        );
                    }
                  }),
            ),
          )
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  // function to calculate the input operation
  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userOutput = eval.toString();
  }
}
