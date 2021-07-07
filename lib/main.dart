import 'package:flutter/material.dart';

void main() => runApp(Calculator());

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String output = '0';
  String newOutput = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';

  click(String text) {
    if(text == "CLEAR") {
      newOutput = '0';
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    }
    else if(text == '+' || text == '-' || text == 'X' || text == '/') {
      num1 = double.parse(output); //CHANGE
      operand = text;
      newOutput = '0';
    }
    else if(text == '.') {
      if(newOutput.contains('.')) {
        return;
      }else{
        newOutput = newOutput+text;
      }
    }
    else if(text == '='){
      num2 = double.parse(output); //CHANGE
      if(operand == '+'){
        newOutput = (num1 + num2).toString();
      }
      if(operand == '-'){
        newOutput = (num1 - num2).toString();
      }
      if(operand == 'X'){
        newOutput = (num1 * num2).toString();
      }
      if(operand == '/'){
        newOutput = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand ="";
    }
    else{
      newOutput = newOutput+text;
    }

    setState(() {
      output = double.parse(newOutput).toString();
    });

  }

  Widget normalButton(String text) {
    return Expanded(
      child: MaterialButton(
        padding: EdgeInsets.all(30),
        onPressed: () => click(text),
        child: Text(text, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19),
      ),
    )
    );
  }

  Widget bigButton(String text) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => click(text),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(text, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 2),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Text(
                  output,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),

              Expanded(child: Divider()),

              Column(
                children: [
                  Row(
                    children: [
                      normalButton('7'),
                      normalButton('8'),
                      normalButton('9'),
                      normalButton('/'),
                    ],
                  ),
                  Row(
                    children: [
                      normalButton('4'),
                      normalButton('5'),
                      normalButton('6'),
                      normalButton('X'),
                    ],
                  ),
                  Row(
                    children: [
                      normalButton('1'),
                      normalButton('2'),
                      normalButton('3'),
                      normalButton('-'),
                    ],
                  ),
                  Row(
                    children: [
                      normalButton('.'),
                      normalButton('0'),
                      normalButton('00'),
                      normalButton('+'),
                    ],
                  ),
                  Row(
                    children: [
                      bigButton('CLEAR'),
                      bigButton('='),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
