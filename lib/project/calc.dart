import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Color putih = Colors.white;
  int valueA;
  int valueB;
  String operator;
  var sbValue = StringBuffer();

  @override
  void initState() {
    super.initState();
    sbValue.write('0');
    operator = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2A2A2A),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              key: Key('expanded_bagian_atas'),
              flex: 1,
              child: Container(
                key: Key('expanded_container_bagian_atas'),
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.all(16),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    AutoSizeText(
                      '$sbValue',
                      style: TextStyle(color: putih, fontSize: 60),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              key: Key('expanded_bagian_bawah'),
              flex: 1,
              child: Column(
                key: Key('expanded_container_bagian_bawah'),
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                            color: Color(0xff414141),
                            child: MaterialButton(
                              onPressed: () {
                                clearValue();
                              },
                              child: Text(
                                'C',
                                style: TextStyle(color: Colors.amber, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Color(0xff414141),
                            child: MaterialButton(
                                onPressed: () {
                                  deleteValue();
                                },
                                child: Icon(Icons.backspace, color: Colors.white,)
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Color(0xff414141),
                            child: MaterialButton(
                              onPressed: () {
                                appendValue('/');
                              },
                              child: Text(
                                '/',
                                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              appendValue('7');
                            },
                            child: Text('7', style: TextStyle(color: putih, fontSize: 16),),
                          ),
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              appendValue('8');
                            },
                            child: Text('8', style: TextStyle(color: putih, fontSize: 16),),
                          ),
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              appendValue('9');
                            },
                            child: Text('9', style: TextStyle(color: putih, fontSize: 16),),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Color(0xff414141),
                            child: MaterialButton(
                              onPressed: () {
                                appendValue('x');
                              },
                              child: Text(
                                'x',
                                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              appendValue('4');
                            },
                            child: Text('4', style: TextStyle(color: putih, fontSize: 16),),
                          ),
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              appendValue('5');
                            },
                            child: Text('5', style: TextStyle(color: putih, fontSize: 16),),
                          ),
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              appendValue('6');
                            },
                            child: Text('6', style: TextStyle(color: putih, fontSize: 16),),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Color(0xff414141),
                            child: MaterialButton(
                              onPressed: () {
                                appendValue('-');
                              },
                              child: Text(
                                '-',
                                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              appendValue('1');
                            },
                            child: Text('1', style: TextStyle(color: putih, fontSize: 16),),
                          ),
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              appendValue('2');
                            },
                            child: Text('2', style: TextStyle(color: putih, fontSize: 16),),
                          ),
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              appendValue('3');
                            },
                            child: Text('3', style: TextStyle(color: putih, fontSize: 16),),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Color(0xff414141),
                            child: MaterialButton(
                              onPressed: () {
                                appendValue('+');
                              },
                              child: Text(
                                '+',
                                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              appendValue('0');
                            },
                            child: Text('0', style: TextStyle(color: putih, fontSize: 16),),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Color(0xff414141),
                            child: MaterialButton(
                              onPressed: () {
                                appendValue('=');
                              },
                              child: Text(
                                '=',
                                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void appendValue(String str) => setState(() {
    bool isDoCalculate = false;
    if (str == "=") {
      isDoCalculate = true;
    } else if (str == "/" || str == "x" || str == "-" || str == "+") {
      if (operator.isEmpty) {
        operator = str;
      } else {
        isDoCalculate = true;
      }
    }

    if (!isDoCalculate) {
      if (sbValue.toString() == "0" && str != "0") {
        sbValue.clear();
      }
      sbValue.write(str);
    } else {
      List<String> values = sbValue.toString().split(operator);
      if (values.length == 2 &&
          values[0].isNotEmpty &&
          values[1].isNotEmpty) {
        valueA = int.parse(values[0]);
        valueB = int.parse(values[1]);
        sbValue.clear();
        int total = 0;
        switch (operator) {
          case "/":
            total = valueA ~/ valueB;
            break;
          case "x":
            total = valueA * valueB;
            break;
          case "-":
            total = valueA - valueB;
            break;
          case "+":
            total = valueA + valueB;
        }
        sbValue.write(total);
        if (str == "/" || str == "x" || str == "-" || str == "+") {
          operator = str;
          sbValue.write(str);
        } else {
          operator = "";
        }
      } else {
        String strValue = sbValue.toString();
        String lastCharacter = strValue.substring(strValue.length - 1);
        if (str == "/" || str == "x" || str == "-" || str == "+") {
          sbValue.clear();
          sbValue
              .write(strValue.substring(0, strValue.length - 1) + "" + str);
          operator = str;
        } else if (str == "=" &&
            (lastCharacter == "/" ||
                lastCharacter == "x" ||
                lastCharacter == "-" ||
                lastCharacter == "+")) {
          sbValue.clear();
          sbValue.write(strValue.substring(0, strValue.length - 1));
        }
      }
    }
  });

  void deleteValue() {
    setState(() {
      String strValue = sbValue.toString();
      if (strValue.length > 0) {
        String lastCharacter = strValue.substring(strValue.length - 1);
        if (lastCharacter == '/' ||  lastCharacter == 'x' || lastCharacter == '-' || lastCharacter == '+') {
          operator = '';
        }

        strValue = strValue.substring(0, strValue.length - 1);
        sbValue.clear();
        sbValue.write(strValue.length == 0 ? '0' : strValue);
      }
    });
  }

  void clearValue() {
    setState(() {
      operator = '';
      sbValue.clear();
      sbValue.write('0');
    });
  }

}

