import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activecolour = Color(0xFF1D1E33);
const bottomContainerColour = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI 계산기')),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: activecolour,
                  cardChild: InsideCard(icon: FontAwesomeIcons.mars,
                      label: 'MALE'
                  ),
                ),
              ),
                Expanded(
                  child: ReusableCard(colour: activecolour,
                    cardChild: InsideCard(icon: FontAwesomeIcons.venus,
                      label: 'FEMALE'
                   ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(colour: activecolour,),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: activecolour,),
                ),
                Expanded(
                  child: ReusableCard(colour: activecolour,),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: bottomContainerHeight,
            color: bottomContainerColour,
            margin: EdgeInsets.only(top: 10.0),
          )
        ],
      ),
    );
  }
}

