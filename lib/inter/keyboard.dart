import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyKeyboard());
}

class MyKeyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userInput = '';
  var answer = '';
  int num1 = 0;
  int num2 = 0;
  Random random = Random();
  int currentLevel = 0;
  int operationsCount = 0;
  int totalQuestions = 0;

  @override
  void initState() {
    super.initState();
    generateRandomNumbers();
  }

  void generateRandomNumbers() {
    int numDigits = currentLevel + 2; // Número de cifras para ambos números
    int maxNumber = (pow(10, numDigits) - 1).toInt();
    num1 = random.nextInt(maxNumber ~/ 10); // Limita el rango para dos números de igual cantidad de cifras
    num2 = random.nextInt(maxNumber ~/ 10);
  }

  final List<String> buttons = [
    '7',
    '8',
    '9',
    '6',
    '5',
    '4',
    '3',
    '2',
    '1',
    '0',
    'C',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      backgroundColor: Colors.white38,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Center(
              child: Text(
                "$num1 + $num2",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(
              userInput,
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.centerRight,
            child: Text(
              answer,
              style: TextStyle(
                fontSize: 30,
                color: const Color.fromARGB(255, 32, 31, 31),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  // Delete Button
                  if (index == 10) {
                    return MyButton(
                      buttontapped: () {
                        setState(() {
                          userInput =
                              userInput.substring(0, userInput.length - 1);
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.blue[50],
                      textColor: Colors.black,
                    );
                  }
                  // Equal_to Button
                  else if (index == 11) {
                    return MyButton(
                      buttontapped: () {
                        setState(() {
                          equalPressed();
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.orange[700],
                      textColor: Colors.white,
                    );
                  }
                  // other buttons
                  else {
                    return MyButton(
                      buttontapped: () {
                        setState(() {
                          userInput += buttons[index];
                        });
                      },
                      buttonText: buttons[index],
                      color: isOperator(buttons[index])
                          ? Colors.blueAccent
                          : Colors.white,
                      textColor: isOperator(buttons[index])
                          ? Colors.white
                          : Colors.black,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    int userResult = -1;
    try {
      userResult = int.parse(userInput);
    } catch (e) {
      // En caso de excepción, userResult se mantiene en -1
    }

    if (userResult != -1 && userResult == num1 + num2) {
      setState(() {
        answer = 'Correcto!';
      });
    } else {
      setState(() {
        answer = 'Incorrecto, la respuesta es ${num1 + num2}';
      });
    }

    operationsCount++;
    totalQuestions++;

    if (operationsCount >= 4) {
      // Avanzar al siguiente conjunto de preguntas
      currentLevel++;
      operationsCount = 0;
    }

    if (currentLevel > 3) {
      // Reiniciar el juego
      currentLevel = 0;
      totalQuestions = 0;
    }

    generateRandomNumbers();
    userInput = '';
  }
}

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttontapped;

  MyButton(
      {this.color,
      this.textColor,
      required this.buttonText,
      @required this.buttontapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
