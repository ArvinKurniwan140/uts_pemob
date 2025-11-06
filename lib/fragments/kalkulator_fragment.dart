import 'package:flutter/material.dart';
import 'dart:math';

class KalkulatorFragment extends StatefulWidget {
  const KalkulatorFragment({super.key});

  @override
  State<KalkulatorFragment> createState() => _KalkulatorFragmentState();
}

class _KalkulatorFragmentState extends State<KalkulatorFragment>
    with SingleTickerProviderStateMixin {
  String _output = '0';
  String _currentNumber = '';
  String _operand = '';
  String _expression = '';
  double _num1 = 0;
  double _num2 = 0;

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  String _lastPressed = '';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  void _buttonPressed(String buttonText) {
    setState(() {
      _lastPressed = buttonText;
      _animationController.forward().then((_) => _animationController.reverse());

      if (buttonText == 'C') {
        _output = '0';
        _currentNumber = '';
        _operand = '';
        _expression = '';
        _num1 = 0;
        _num2 = 0;
      } else if (buttonText == 'DEL') {
        if (_output.length > 1) {
          _output = _output.substring(0, _output.length - 1);
        } else {
          _output = '0';
        }
        _currentNumber = _output;
      } else if (buttonText == '+' || buttonText == '-' || buttonText == '×' || buttonText == '÷') {
        _num1 = double.parse(_output);
        _operand = buttonText;
        _expression = '$_output $buttonText';
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
            _expression = 'Tidak bisa dibagi 0';
          }
        }

        if (_output != 'Error') {
          _expression = '$_num1 $_operand $_num2';
        }
        _currentNumber = _output;
        _operand = '';
        _num1 = 0;
        _num2 = 0;
      } else if (buttonText == 'x²') {
        double num = double.parse(_output);
        _expression = '$num²';
        _output = (num * num).toString();
        _currentNumber = _output;
      } else if (buttonText == '√') {
        double num = double.parse(_output);
        if (num >= 0) {
          _expression = '√$num';
          _output = sqrt(num).toString();
        } else {
          _output = 'Error';
          _expression = 'Tidak valid';
        }
        _currentNumber = _output;
      } else if (buttonText == '%') {
        double num = double.parse(_output);
        _expression = '$num%';
        _output = (num / 100).toString();
        _currentNumber = _output;
      } else if (buttonText == '±') {
        double num = double.parse(_output);
        _output = (-num).toString();
        _currentNumber = _output;
      } else {
        if (_output == '0' || _output == 'Error' || (_operand.isNotEmpty && _currentNumber.isEmpty)) {
          _output = buttonText;
        } else {
          _output = _output + buttonText;
        }
        _currentNumber = _output;
      }

      // Format output
      if (_output != 'Error' && _output.contains('.')) {
        double value = double.parse(_output);
        if (value == value.toInt()) {
          _output = value.toInt().toString();
        } else if (_output.split('.')[1].length > 8) {
          _output = value.toStringAsFixed(8);
          _output = _output.replaceAll(RegExp(r'0*$'), '').replaceAll(RegExp(r'\.$'), '');
        }
      }
    });
  }

  Widget _buildButton(
      String buttonText,
      Color color, {
        Color textColor = Colors.white,
        IconData? icon,
        bool isLarge = false,
      }) {
    return Expanded(
      flex: isLarge ? 2 : 1,
      child: Container(
        margin: const EdgeInsets.all(6),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => _buttonPressed(buttonText),
            borderRadius: BorderRadius.circular(20),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    color,
                    color.withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.4),
                    blurRadius: 8,
                    spreadRadius: 0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: icon != null
                    ? Icon(
                  icon,
                  size: 28,
                  color: textColor,
                )
                    : Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: buttonText.length > 2 ? 20 : 26,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ),
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
          colors: [
            Colors.grey.shade900,
            Colors.grey.shade800,
          ],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Display Area
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue.shade700,
                      Colors.blue.shade900,
                      Colors.indigo.shade900,
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.calculate,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              'Kalkulator',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Advanced',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    // Expression Display
                    if (_expression.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          _expression,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white.withOpacity(0.7),
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                    // Main Output
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: Text(
                        _output,
                        key: ValueKey<String>(_output),
                        style: TextStyle(
                          fontSize: _output.length > 10 ? 40 : 56,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Buttons Area
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    // Row 1
                    Expanded(
                      child: Row(
                        children: [
                          _buildButton('C', Colors.red.shade600),
                          _buildButton('DEL', Colors.red.shade400, icon: Icons.backspace_outlined),
                          _buildButton('%', Colors.blue.shade600),
                          _buildButton('÷', Colors.orange.shade600),
                        ],
                      ),
                    ),
                    // Row 2
                    Expanded(
                      child: Row(
                        children: [
                          _buildButton('7', Colors.grey.shade700),
                          _buildButton('8', Colors.grey.shade700),
                          _buildButton('9', Colors.grey.shade700),
                          _buildButton('×', Colors.orange.shade600),
                        ],
                      ),
                    ),
                    // Row 3
                    Expanded(
                      child: Row(
                        children: [
                          _buildButton('4', Colors.grey.shade700),
                          _buildButton('5', Colors.grey.shade700),
                          _buildButton('6', Colors.grey.shade700),
                          _buildButton('-', Colors.orange.shade600),
                        ],
                      ),
                    ),
                    // Row 4
                    Expanded(
                      child: Row(
                        children: [
                          _buildButton('1', Colors.grey.shade700),
                          _buildButton('2', Colors.grey.shade700),
                          _buildButton('3', Colors.grey.shade700),
                          _buildButton('+', Colors.orange.shade600),
                        ],
                      ),
                    ),
                    // Row 5
                    Expanded(
                      child: Row(
                        children: [
                          _buildButton('x²', Colors.blue.shade600),
                          _buildButton('√', Colors.blue.shade600),
                          _buildButton('±', Colors.blue.shade600),
                          _buildButton('.', Colors.grey.shade700),
                        ],
                      ),
                    ),
                    // Row 6
                    Expanded(
                      child: Row(
                        children: [
                          _buildButton('0', Colors.grey.shade700, isLarge: true),
                          _buildButton('=', Colors.green.shade600, isLarge: true),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}