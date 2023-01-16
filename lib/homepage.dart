import 'package:calculator/calculation_provider.dart';
import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';

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
    final calc = Provider.of<Calculation>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 0,
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
                          child: Consumer<Calculation>(
                            builder: (context, value, child) {
                              return Text(
                                value.userInput.toString(),
                                style: TextStyle(
                                    fontSize: 40, color: Colors.white),
                              );
                            },
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Consumer<Calculation>(builder: ((context, value, child) {
                        return Text(
                          value.result.toString(),
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        );
                      }))
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Constants(
                          title: 'AC',
                          onPress: () {
                            calc.numberClear();
                          },
                        ),
                        Constants(
                          title: '(',
                          onPress: () {
                            calc.numberChange('(');
                          },
                        ),
                        Constants(
                          title: ')',
                          onPress: () {
                            calc.numberChange(')');
                          },
                        ),
                        Constants(
                          title: '/',
                          color: Colors.orange,
                          onPress: () {
                            calc.numberChange('/');
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Constants(
                          title: '7',
                          onPress: () {
                            calc.numberChange('7');
                          },
                        ),
                        Constants(
                          title: '8',
                          onPress: () {
                            calc.numberChange('8');
                          },
                        ),
                        Constants(
                          title: '9',
                          onPress: () {
                            calc.numberChange('9');
                          },
                        ),
                        Constants(
                          title: 'x',
                          color: Colors.orange,
                          onPress: () {
                            calc.numberChange('x');
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Constants(
                          title: '4',
                          onPress: () {
                            calc.numberChange('4');
                          },
                        ),
                        Constants(
                          title: '5',
                          onPress: () {
                            calc.numberChange('5');
                          },
                        ),
                        Constants(
                          title: '6',
                          onPress: () {
                            calc.numberChange('6');
                          },
                        ),
                        Constants(
                          title: '-',
                          color: Colors.orange,
                          onPress: () {
                            calc.numberChange('-');
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Constants(
                          title: '1',
                          onPress: () {
                            calc.numberChange('1');
                          },
                        ),
                        Constants(
                          title: '2',
                          onPress: () {
                            calc.numberChange('2');
                          },
                        ),
                        Constants(
                          title: '3',
                          onPress: () {
                            calc.numberChange('3');
                          },
                        ),
                        Constants(
                          title: '+',
                          color: Colors.orange,
                          onPress: () {
                            calc.numberChange('+');
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Constants(
                          title: '0',
                          onPress: () {
                            calc.numberChange('0');
                          },
                        ),
                        Constants(
                          title: '.',
                          onPress: () {
                            calc.numberChange('.');
                          },
                        ),
                        Constants(
                          title: 'DEL',
                          onPress: () {
                            calc.numberDelete();
                          },
                        ),
                        Constants(
                          title: '=',
                          color: Colors.orange,
                          onPress: () {
                            calc.equalPressed();
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
