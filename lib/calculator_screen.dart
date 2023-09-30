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
    '%',
    '/',
    'DEL',
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
      backgroundColor: const Color(0xFF222434),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(5), // Reduced padding
                  alignment: Alignment.centerRight,
                  child: Text(
                    userInput,
                    style: const TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5), // Reduced padding
                  alignment: Alignment.centerRight,
                  child: Text(
                    userOutput,
                    style: const TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                decoration: const BoxDecoration(
                  // color: Color(0xFF367fa9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25), // Add border radius top left
                    topRight:
                        Radius.circular(25), // Add border radius top right
                  ),
                ),
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      switch (index) {
                        case 0:
                          return Buttons(
                            key: const Key('buttonC'),
                            buttontapped: () {
                              setState(() {
                                userInput = '';
                                userOutput = '0';
                              });
                            },
                            buttonText: buttons[index],
                            color: const Color(0xFF33344b),
                            textColor: Colors.white,
                            hasTopLeftBorderRadius: true,
                          );
                        case 3:
                          return Buttons(
                            key: const Key('buttonDEL'),
                            buttontapped: () {
                              setState(() {
                                if (userInput.isNotEmpty) {
                                  userInput = userInput.substring(
                                      0, userInput.length - 1);
                                }
                              });
                            },
                            buttonText: buttons[index],
                            color: const Color(0xFF33344b),
                            textColor: const Color(0xFFf9b900),
                            hasTopRightBorderRadius: true,
                          );
                        case 19:
                          return Buttons(
                            key: const Key('buttonEquals'),
                            buttontapped: () {
                              setState(() {
                                equalPressed();
                              });
                            },
                            buttonText: buttons[index],
                            color: const Color(0xFFf9b900),
                            textColor: Colors.white,
                          );
                        default:
                          return Buttons(
                            key: Key('button${buttons[index]}'),
                            buttontapped: () {
                              setState(() {
                                userInput += buttons[index];
                              });
                            },
                            buttonText: buttons[index],
                            color: isOperator(buttons[index])
                                ? const Color(0xFF33344b)
                                : const Color(0xFF2c2e42),
                            textColor: isOperator(buttons[index])
                                ? const Color(0xFFf9b900)
                                : Colors.white,
                          );
                      }
                    })),
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
