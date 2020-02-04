import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard({@required this.colour, this.cardChild});
  final Color colour;
  final Widget cardChild;

//  const ReusableCard({
//    Key key,
//  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
