import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 70.0;
const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
//const inactiveCardColor = Colors.red;
const bottomContainerColour = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;

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
                  child: InkWell(
                   onTap: (){
                     setState(() {
                       selectedGender = Gender.male;
                     });
                   },
                    child: ReusableCard(
                      colour: selectedGender == Gender.male ? activeCardColour : inactiveCardColor,
                       cardChild: InsideCard(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE'
                    ),
                   ),
                  ),
                  ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      colour: selectedGender == Gender.female ? activeCardColour : inactiveCardColor,
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
            child: ReusableCard(colour: activeCardColour,),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: activeCardColour,),
                ),
                Expanded(
                  child: ReusableCard(colour: activeCardColour,),
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

