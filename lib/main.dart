import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  String op = "0";
  ThemeData dN = ThemeData.light();
  String _op = "0";
  double number1 = 0.0;
  double number2 = 0.0;
  String operand = "";

  buttonPressed(String inputText){

    if(inputText == "CLEAR"){

      _op = "0";
      number1 = 0.0;
      number2 = 0.0;
      operand = "";

    } else if (inputText == "+" || inputText == "-" || inputText == "/" || inputText == "X"){

      number1 = double.parse(op);

      operand = inputText;

      _op = "0";

    } else if(inputText == "."){
      _op = _op + inputText;

    } else if (inputText == "="){

      number2 = double.parse(op);

      if(operand == "+"){
        _op = (number1 + number2).toString();
      }
      if(operand == "-"){
        _op = (number1 - number2).toString();
      }
      if(operand == "X"){
        _op = (number1 * number2).toString();
      }
      if(operand == "/"){
        _op = (number1 / number2).toString();
      }

      number1 = 0.0;
      number2 = 0.0;
      operand = "";
    }else if(inputText=="LIGHT"){
      setState(() {
        dN = ThemeData.light();
      });
    }else if(inputText=="DARK"){
      setState(() {
        dN = ThemeData.dark();
      });
    }

    else {
      _op = _op + inputText;
    }

    setState(() {

      op = double.parse(_op).toStringAsFixed(2);

    });

  }

  Widget theButton(String inputText) {
    return Expanded(
      child: ElevatedButton(
          child: Text(inputText,
            style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),
          onPressed: () =>
              buttonPressed(inputText),
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              padding: const EdgeInsets.all(24.0)
          )
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: dN,
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Calculator"),
          ),
          body: Column(
              children: <Widget>[
          Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.symmetric(
                  vertical: 24.0, horizontal: 12.0),
              child: Text(op,
                  style: const TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ))),
          const Expanded(
            child: Divider(),
          ),
          Column(children: [
            Row(children: [
              theButton("7"),
              theButton("8"),
              theButton("9"),
              theButton("/")
            ]),
            Row(children: [
              theButton("4"),
              theButton("5"),
              theButton("6"),
              theButton("X")
            ]),
            Row(children: [
              theButton("1"),
              theButton("2"),
              theButton("3"),
              theButton("-")
            ]),
            Row(children: [
              theButton("."),
              theButton("0"),
              theButton("00"),
              theButton("+")
            ]),
            Row(children: [
              theButton("LIGHT"),
              theButton("DARK"),
              theButton("CLEAR"),
              theButton("=")
            ])
          ])
              ],
            ))
    );
  }
}


