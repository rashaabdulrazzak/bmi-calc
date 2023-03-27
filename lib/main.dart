import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'constants.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
              primaryColor: Color(0xFF0A0E21),
              secondaryHeaderColor: Colors.purple,
              scaffoldBackgroundColor: Color(0xFF0A0E21),
              appBarTheme: AppBarTheme(
                  backgroundColor: Color(0xFF0A0E21)
              ),
      ),
      // theme: ThemeData(
      //   primaryColor: Color(0xFF0A0E21),
      //   // This is one way to change app bar color
      //   //primarySwatch:Colors.purple,
      //   secondaryHeaderColor: Colors.purple,
      //   scaffoldBackgroundColor: Color(0xFF0A0E21),
      //   appBarTheme: AppBarTheme(
      //       backgroundColor: Color(0xFF0A0E21)
      //   ),
      //   textTheme: TextTheme(
      //       bodyText2: TextStyle(
      //         color: Colors.white,
      //       )
      //   )
      // ),
      home: InputPage(),
    );
  }
}


