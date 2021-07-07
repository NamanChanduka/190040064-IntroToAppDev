import 'package:flutter/material.dart';

void main() => runApp(Calculator());

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String output = '0';

  Widget normalButton(String text) {
    return Expanded(
      child: MaterialButton(
        padding: EdgeInsets.all(30),
        onPressed: () {},
        child: Text(text, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19),
      ),
    )
    );
  }

  Widget bigButton(String text) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {},
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
                padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
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
