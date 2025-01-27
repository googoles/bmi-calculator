import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
            primaryColor: Color(0xFF0A0D21),
            scaffoldBackgroundColor: Color(0xFF0A0D21),
            accentColor: Colors.purpleAccent
      ),
    );
  }
}
