import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController _firstNumberController =
      new TextEditingController(text: '0');
  TextEditingController _secondNumberController =
      new TextEditingController(text: '0');
  String _result = '';

  void _calculate(String keyword) {
    double firstNumber = double.parse(_firstNumberController.text.isEmpty
        ? '0'
        : _firstNumberController.text);
    double secondNumber = double.parse(_secondNumberController.text.isEmpty
        ? '0'
        : _secondNumberController.text);
    double result = 0;

    switch (keyword) {
      case 'add':
        result = firstNumber + secondNumber;
        break;
      case 'subtract':
        result = firstNumber - secondNumber;
        break;
      case 'multiply':
        result = firstNumber * secondNumber;
        break;
      case 'divide':
        result = firstNumber / secondNumber;
        break;
    }
    setState(() {
      _result = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            controller: _firstNumberController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: 'Input first number'),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            controller: _secondNumberController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: 'Input second number'),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        _calculate('add');
                      },
                      child: Text("Add")),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        _calculate('subtract');
                      },
                      child: Text("Subtract")),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        _calculate('mutiply');
                      },
                      child: Text("Multiply")),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        _calculate('divide');
                      },
                      child: Text("Divide")),
                ),
              ],
            )
          ]),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: Text(
            _result == '' ? "No result" : _result,
            style: TextStyle(fontSize: 25),
          ),
        ),
      ],
    );
  }
}
