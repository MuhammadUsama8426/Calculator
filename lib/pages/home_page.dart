import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String equation = '';
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFCAF0F8), // Sets the AppBar background color
        title: Text(
          'Calculator',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 50),
          // Other AppBar properties can go here
        ),

        toolbarHeight: 80,
      ),
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Expanded(
            flex: 1, // Adjust this value to change the screen area ratio
            child: screen(),
          ),
          Expanded(
            flex: 3, // Adjust this value to change the button area ratio
            child: btnrows(),
          ),
        ],
      ),
    );
  }

  Widget calculatorbtn(
      {required String btnName, function, double? btnSize, Color? btncolor}) {
    return InkWell(
      onTap: () {
        function();
        setState(() {});
      },
      child: Padding(
        padding: EdgeInsets.all(15),
        child: CircleAvatar(
          backgroundColor: btncolor,
          radius: 30,
          child: Center(
            child: Text(
              btnName,
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }

  Widget screen() {
    return Container(
      padding: EdgeInsets.only(top: 70),
      alignment: Alignment.bottomRight,
      decoration: BoxDecoration(
        color: Color(0xFFCAF0F8), // Sets the AppBar background color

        border: Border(
          bottom: BorderSide(color: Colors.black, width: 4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: SingleChildScrollView(
              reverse: true, // Scroll from the end (right side)
              scrollDirection: Axis.horizontal, // Enable horizontal scrolling
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  equation, // Displaying the equation or question
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right, // Align text to the right
                ),
              ),
            ),
          ),
          SizedBox(height: 3), // Space between equation and result
          Expanded(
            child: SingleChildScrollView(
              reverse: true, // Scroll from the end (right side)
              scrollDirection: Axis.horizontal, // Enable horizontal scrolling
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  _result, // Displaying the result
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right, // Align text to the right
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget btnrows() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            calculatorbtn(
              btnName: 'C',
              function: () {
                equation = '';

                _result = '';
              },
              btncolor: Colors.black,
            ),
            calculatorbtn(
              btnName: '%',
              function: () {
                equation = equation + '%';
              },
              btncolor: Colors.black,
            ),
            calculatorbtn(
              btnName: '⌫', // Using a backspace symbol
              function: () {
                setState(() {
                  if (equation.isNotEmpty) {
                    equation = equation.substring(0, equation.length - 1);
                    // Update the result after modification
                  }
                });
              },
              btncolor: Colors.brown,
            ),
            calculatorbtn(
              btnName: '/',
              function: () {
                equation = equation + '/';
              },
              btncolor: Colors.black,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            calculatorbtn(
              btnName: '7',
              function: () {
                equation = equation + '7';
              },
              btncolor: Colors.black,
            ),
            calculatorbtn(
              btnName: '8',
              function: () {
                equation = equation + '8';
              },
              btncolor: Colors.black,
            ),
            calculatorbtn(
              btnName: '9',
              function: () {
                equation = equation + '9';
              },
              btncolor: Colors.black,
            ),
            calculatorbtn(
              btnName: '*',
              function: () {
                equation = equation + '*';
              },
              btncolor: Colors.black,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            calculatorbtn(
              btnName: '4',
              function: () {
                equation = equation + '4';
              },
              btncolor: Colors.black,
            ),
            calculatorbtn(
              btnName: '5',
              function: () {
                equation = equation + '5';
              },
              btncolor: Colors.black,
            ),
            calculatorbtn(
              btnName: '6',
              function: () {
                equation = equation + '6';
              },
              btncolor: Colors.black,
            ),
            calculatorbtn(
              btnName: '-',
              function: () {
                equation = equation + '-';
              },
              btncolor: Colors.black,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            calculatorbtn(
              btnName: '1',
              function: () {
                equation = equation + '1';
              },
              btncolor: Colors.black,
            ),
            calculatorbtn(
              btnName: '2',
              function: () {
                equation = equation + '2';
              },
              btncolor: Colors.black,
            ),
            calculatorbtn(
              btnName: '3',
              function: () {
                equation = equation + '3';
              },
              btncolor: Colors.black,
            ),
            calculatorbtn(
              btnName: '+',
              function: () {
                equation = equation + '+';
              },
              btncolor: Colors.black,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            calculatorbtn(
              btnName: '00',
              function: () {
                equation = equation + '00';
              },
              btncolor: Colors.black,
            ),
            calculatorbtn(
              btnName: '0',
              function: () {
                equation = equation + '0';
              },
              btncolor: Colors.black,
            ),
            calculatorbtn(
              btnName: '.',
              function: () {
                equation = equation + '.';
              },
              btncolor: Colors.black,
            ),
            calculatorbtn(
              btnName: '=',
              function: () {
                calculate();
              },
              btncolor: Colors.black,
            ),
          ],
        ),
      ],
    );
  }

  void calculate() {
    try {
      Parser p = Parser();
      Expression expression = p.parse(equation.replaceAll('x', '*'));
      ContextModel cm = ContextModel();
      double result = expression.evaluate(EvaluationType.REAL, cm);
      setState(() {
        _result = result.toString();
      });
    } catch (e) {
      setState(() {
        _result = 'Error';
      });
    }
  }
}
