import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userInput = '';
  var result = '0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 120,
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 30, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userInput.toString(),
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        result.toString(),
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Constants(
                          title: 'AC',
                          onPress: () {
                            userInput = '';
                            result = '0';
                            setState(() {});
                          },
                        ),
                        Constants(
                          title: '(',
                          onPress: () {
                            setState(() {
                              userInput += '(';
                            });
                          },
                        ),
                        Constants(
                          title: ')',
                          onPress: () {
                            setState(() {
                              userInput += ')';
                            });
                          },
                        ),
                        Constants(
                          title: '/',
                          color: Colors.orange,
                          onPress: () {
                            setState(() {
                              userInput += '/';
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Constants(
                          title: '7',
                          onPress: () {
                            setState(() {
                              userInput += '7';
                              result = '';
                            });
                          },
                        ),
                        Constants(
                          title: '8',
                          onPress: () {
                            setState(() {
                              userInput += '8';
                            });
                          },
                        ),
                        Constants(
                          title: '9',
                          onPress: () {
                            setState(() {
                              userInput += '9';
                            });
                          },
                        ),
                        Constants(
                          title: 'x',
                          color: Colors.orange,
                          onPress: () {
                            setState(() {
                              userInput += 'x';
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Constants(
                          title: '4',
                          onPress: () {
                            setState(() {
                              userInput += '4';
                            });
                          },
                        ),
                        Constants(
                          title: '5',
                          onPress: () {
                            setState(() {
                              userInput += '5';
                            });
                          },
                        ),
                        Constants(
                          title: '6',
                          onPress: () {
                            setState(() {
                              userInput += '6';
                            });
                          },
                        ),
                        Constants(
                          title: '-',
                          color: Colors.orange,
                          onPress: () {
                            setState(() {
                              userInput += '-';
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Constants(
                          title: '1',
                          onPress: () {
                            setState(() {
                              userInput += '1';
                            });
                          },
                        ),
                        Constants(
                          title: '2',
                          onPress: () {
                            setState(() {
                              userInput += '2';
                            });
                          },
                        ),
                        Constants(
                          title: '3',
                          onPress: () {
                            setState(() {
                              userInput += '3';
                            });
                          },
                        ),
                        Constants(
                          title: '+',
                          color: Colors.orange,
                          onPress: () {
                            setState(() {
                              userInput += '+';
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Constants(
                          title: '0',
                          onPress: () {
                            setState(() {
                              userInput += '0';
                            });
                          },
                        ),
                        Constants(
                          title: '.',
                          onPress: () {
                            setState(() {
                              userInput += '.';
                            });
                          },
                        ),
                        Constants(
                          title: 'DEL',
                          onPress: () {
                            setState(() {
                              result = '';
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                            });
                          },
                        ),
                        Constants(
                          title: '=',
                          color: Colors.orange,
                          onPress: () {
                            equalPressed();
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    result = eval.toString();
  }
}
