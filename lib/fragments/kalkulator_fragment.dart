import 'package:flutter/material.dart';
import 'dart:math';

class KalkulatorFragment extends StatefulWidget {
  const KalkulatorFragment({super.key});

  @override
  State<KalkulatorFragment> createState() => _KalkulatorFragmentState();
}

class _KalkulatorFragmentState extends State<KalkulatorFragment> {
  String _output = '0';
  String _currentNumber = '';
  String _operand = '';
  double _num1 = 0;
  double _num2 = 0;

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _output = '0';
        _currentNumber = '';
        _operand = '';
        _num1 = 0;
        _num2 = 0;
      } else if (buttonText == '+' || buttonText == '-' || buttonText == '×' || buttonText == '÷') {
        _num1 = double.parse(_output);
        _operand = buttonText;
        _currentNumber = '';
      } else if (buttonText == '=') {
        _num2 = double.parse(_output);

        if (_operand == '+') {
          _output = (_num1 + _num2).toString();
        } else if (_operand == '-') {
          _output = (_num1 - _num2).toString();
        } else if (_operand == '×') {
          _output = (_num1 * _num2).toString();
        } else if (_operand == '÷') {
          if (_num2 != 0) {
            _output = (_num1 / _num2).toString();
          } else {
            _output = 'Error';
          }
        }

        _currentNumber = _output;
        _operand = '';
        _num1 = 0;
        _num2 = 0;
      } else if (buttonText == 'x²') {
        double num = double.parse(_output);
        _output = (num * num).toString();
        _currentNumber = _output;
      } else if (buttonText == '√') {
        double num = double.parse(_output);
        if (num >= 0) {
          _output = sqrt(num).toString();
        } else {
          _output = 'Error';
        }
        _currentNumber = _output;
      } else {
        if (_output == '0' || _operand.isNotEmpty && _currentNumber.isEmpty) {
          _output = buttonText;
        } else {
          _output = _output + buttonText;
        }
        _currentNumber = _output;
      }

      // Format output untuk menghilangkan .0 pada bilangan bulat
      if (_output.contains('.') && double.parse(_output) == double.parse(_output).toInt()) {
        _output = double.parse(_output).toInt().toString();
      }
    });
  }

  Widget _buildButton(String buttonText, Color color, {Color textColor = Colors.white}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5),
        child: ElevatedButton(
          onPressed: () => _buttonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 3,
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue.shade50, Colors.white],
        ),
      ),
      child: Column(
        children: [
          // Display
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.blue.shade700,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Kalkulator',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  _output,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Buttons
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('7', Colors.grey.shade700),
                        _buildButton('8', Colors.grey.shade700),
                        _buildButton('9', Colors.grey.shade700),
                        _buildButton('÷', Colors.orange.shade600),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('4', Colors.grey.shade700),
                        _buildButton('5', Colors.grey.shade700),
                        _buildButton('6', Colors.grey.shade700),
                        _buildButton('×', Colors.orange.shade600),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('1', Colors.grey.shade700),
                        _buildButton('2', Colors.grey.shade700),
                        _buildButton('3', Colors.grey.shade700),
                        _buildButton('-', Colors.orange.shade600),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('0', Colors.grey.shade700),
                        _buildButton('.', Colors.grey.shade700),
                        _buildButton('=', Colors.green.shade600),
                        _buildButton('+', Colors.orange.shade600),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('x²', Colors.blue.shade600),
                        _buildButton('√', Colors.blue.shade600),
                        _buildButton('C', Colors.red.shade600),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}