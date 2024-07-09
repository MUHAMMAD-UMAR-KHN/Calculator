import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var userQuestion = "";
  var userAnswer = "";
  List buttons = [
    "C",
    "Del",
    "%",
    "/",
    "9",
    "8",
    "7",
    "x",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "Ans",
    "="
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple[100],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userQuestion,
                        style: TextStyle(fontSize: 20),
                      )),
                  Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userAnswer,
                        style: TextStyle(fontSize: 20),
                      )),
                ],
              ),
            )),
            Expanded(
                flex: 2,
                child: Container(
                  child: GridView.builder(
                      itemCount: buttons.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemBuilder: (BuildContext context, index) {
                        if (index == 0) {
                          return MyButton(
                            onTapped: (){
                              setState(() {
                                userQuestion = "";
                              });
                              setState(() {
                                userAnswer = "0";
                              });
                            },
                            
                            buttonText: buttons[0],
                            color: Colors.red,
                            textColor: Colors.white,
                          );
                        } else if (index == 1) {
                          return MyButton(
                            onTapped: (){
                              setState(() {
                                userQuestion = userQuestion.substring(0,userQuestion.length-1);
                              });
                            },
                            buttonText: buttons[1],
                            color: Colors.green,
                            textColor: Colors.white,
                          );
                        } 
                        // for Equal
                          else if (index == 19) {
                          return MyButton(
                            onTapped: (){
                              setState(() {
                                onEqualPressed();
                              });
                            },
                            buttonText: buttons[19],
                            color: Colors.deepPurple,
                            textColor: Colors.white,
                          );
                        } 

                        else {
                          return MyButton(
                            onTapped: (){
                              setState(() {
                                userQuestion = userQuestion + buttons[index];
                              });
                            },
                            buttonText: buttons[index],
                            color: isOperator(buttons[index])
                                ? Colors.deepPurple
                                : Colors.white,
                            textColor: isOperator(buttons[index])
                                ? Colors.white
                                : Colors.deepPurple,
                          );
                        }
                      }),
                )),
          ],
        ),
      ),
    );
  }

  bool isOperator(String x) {
    if (x == "%" || x == "/" || x == "x" || x == "-" || x == "+" || x == "=") {
      return true;
    }
    return false;
  }

  void onEqualPressed(){

    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll("x", "*");

      Parser p = Parser();
  Expression exp = p.parse(finalQuestion);
   ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}
