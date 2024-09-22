import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0"; // The current output on the display
  String _result = "0"; // Stores the result
  String _operand = ""; // Stores the operator
  double num1 = 0.0;
  double num2 = 0.0;

  // Function to handle button presses
  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      _result = "0";
      num1 = 0.0;
      num2 = 0.0;
      _operand = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "/") {
      num1 = double.parse(_output);
      _operand = buttonText;
      _result = "0";
    } else if (buttonText == ".") {
      if (_result.contains(".")) {
        return;
      } else {
        _result += buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(_output);

      switch (_operand) {
        case "+":
          _result = (num1 + num2).toString();
          break;
        case "-":
          _result = (num1 - num2).toString();
          break;
        case "x":
          _result = (num1 * num2).toString();
          break;
        case "/":
          _result = (num1 / num2).toString();
          break;
      }

      num1 = 0.0;
      num2 = 0.0;
      _operand = "";
    } else {
      _result += buttonText;
    }

    setState(() {
      _output = double.parse(_result).toString();
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Text(
              _output,
              style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: <Widget>[
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/")
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("x")
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-")
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("."),
                  buildButton("0"),
                  buildButton("00"),
                  buildButton("+")
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("CLEAR"),
                  buildButton("="),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
