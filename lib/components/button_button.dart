import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class ButtomButton extends StatelessWidget {

  ButtomButton({@required this.onTap,@required this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Text(buttonTitle,
          style: kLargeButtonTextStyle,
        ),
        width: double.infinity,
        height: kbottomContainerHeight,
        color: kbottomContainerColour,
        padding: EdgeInsets.only(bottom:20.0),
        margin: EdgeInsets.only(top: 10.0),
      ),
    );
  }
}
