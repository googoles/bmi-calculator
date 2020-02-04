import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 70.0;
const activecolour = Color(0xFF1D1E33);
//const inactiveCardColor = Color(0xFF111328);
const inactiveCardColor = Colors.red;
const bottomContainerColour = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColour = inactiveCardColor;
  Color femaleCardColour = inactiveCardColor;
  // 1 = male, 2 = female
  void updateColour(int gender){
    // male card pressed
    if (gender == 1){
      if (maleCardColour == inactiveCardColor){
        maleCardColour = activecolour;
        femaleCardColour = inactiveCardColor;
      }
      else {
        maleCardColour = inactiveCardColor;
      }
    }
    // female card pressed
      if (gender == 2) {
        if(femaleCardColour == inactiveCardColor){
        femaleCardColour = activecolour;
        maleCardColour = inactiveCardColor;
      } else {
        femaleCardColour = inactiveCardColor;
      }
    }
  }

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
                  child: GestureDetector(
                   onTap: (){
                     setState(() {
                       updateColour(1);
                       print("got pressed");
                     });
                   },
                    child: ReusableCard(
                      colour: maleCardColour,
                       cardChild: InsideCard(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE'
                    ),
                   ),
                  ),
                  ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColour(2);
                        print("got pressed");
                      });
                    },
                    child: ReusableCard(
                      colour: femaleCardColour,
                      cardChild: InsideCard(
                          icon: FontAwesomeIcons.venus,
                        label: 'FEMALE'
                     ),
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

