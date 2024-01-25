import 'package:flutter/material.dart';
import './widget/button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorApp(),
    );
  }
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  late double firstNum = 0;
  late double secondNum = 0;
  late String history = '';
  late String textToDisplay = '';
  late String operation = '';

  void btnOnClick(String btnVal) {
    if (btnVal == 'C') {
      setState(() {
        textToDisplay = '';
        firstNum = 0;
        secondNum = 0;

      });
    } else if (btnVal == 'AC') {
      setState(() {
        textToDisplay = '';
        firstNum = 0;
        secondNum = 0;
        history = '';
      });
    } else if (btnVal == '+/-') {
      setState(() {
        if (textToDisplay.startsWith('-')) {
          textToDisplay = textToDisplay.substring(1);
        } else {
          textToDisplay = '-$textToDisplay';
        }
      });
    } else if (btnVal == '+' || btnVal == '-' || btnVal == 'X' || btnVal == '/') {
      setState(() {
        firstNum = double.parse(textToDisplay)  ;
        textToDisplay = '';
        operation = btnVal;
      });
    } else if (btnVal == '=') {
        secondNum = double.parse(textToDisplay);
        if (operation == '+') {
          textToDisplay = (firstNum + secondNum).toString();
          history = '$firstNum $operation $secondNum';

        } else if (operation == '-') {
          textToDisplay = (firstNum - secondNum).toString();
          history = '$firstNum $operation $secondNum = $textToDisplay\n' + history;

        } else if (operation == 'X') {
          textToDisplay = (firstNum * secondNum).toString();
          history = '$firstNum $operation $secondNum = $textToDisplay\n' + history;
        } else if (operation == '/') {
          textToDisplay = (firstNum / secondNum).toString();
          history = '$firstNum $operation $secondNum = $textToDisplay\n' + history;
        }
    } else {
      textToDisplay += btnVal;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Calculator'),
        ),
        backgroundColor: const Color.fromARGB(255, 8, 52, 88),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    history,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey,
                    ),
                  ),
                ),
                alignment: const Alignment(1.0, 1.0),
              ),

              Container(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    textToDisplay,
                    style: TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                    ),
                  ),
                ),
                alignment: const Alignment(1.0, 1.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: 'AC',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: () {
                      btnOnClick('AC');
                    },
                  ),
                  CalculatorButton(
                    text: 'C',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: () {
                      btnOnClick('C');
                    },
                  ),
                  CalculatorButton(
                    text: '<>',
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: () {
                      btnOnClick('<>');
                    },
                  ),
                  CalculatorButton(
                    text: '/',
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: () {
                      btnOnClick('/');
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '9',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: () {
                      btnOnClick('9');
                    },
                  ),
                  CalculatorButton(
                    text: '8',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: () {
                      btnOnClick('8');
                    },
                  ),
                  CalculatorButton(
                    text: '7',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: () {
                      btnOnClick('7');
                    },
                  ),
                  CalculatorButton(
                    text: 'X',
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: () {
                      btnOnClick('X');
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '6',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: () {
                      btnOnClick('6');
                    },
                  ),
                  CalculatorButton(
                    text: '5',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: () {
                      btnOnClick('5');
                    },
                  ),
                  CalculatorButton(
                    text: '4',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: () {
                      btnOnClick('4');
                    },
                  ),
                  CalculatorButton(
                    text: '-',
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: () {
                      btnOnClick('-');
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '3',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: () {
                      btnOnClick('3');
                    },
                  ),
                  CalculatorButton(
                    text: '2',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: () {
                      btnOnClick('2');
                    },
                  ),
                  CalculatorButton(
                    text: '1',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: () {
                      btnOnClick('1');
                    },
                  ),
                  CalculatorButton(
                    text: '+',
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: () {
                      btnOnClick('+');
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '+/-',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: () {
                      btnOnClick('+/-');
                    },
                  ),
                  CalculatorButton(
                    text: '0',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: () {
                      btnOnClick('0');
                    },
                  ),
                  CalculatorButton(
                    text: '00',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: () {
                      btnOnClick('00');
                    },
                  ),
                  CalculatorButton(
                    text: '=',
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: () {
                      btnOnClick('=');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
