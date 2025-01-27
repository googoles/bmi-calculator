import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/round_icon.dart';
import 'package:bmi_calculator/components/button_button.dart';
import 'result_page.dart';
import 'package:bmi_calculator/calculat_bmi.dart';


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

  int height = 180;
  int weight = 60;
  int age = 25;

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
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male ? kactiveCardColour : kinactiveCardColor,
                     cardChild: InsideCard(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE'
                  ),
                   ),
                  ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female ? kactiveCardColour : kinactiveCardColor,
                    cardChild: InsideCard(
                        icon: FontAwesomeIcons.venus,
                      label: 'FEMALE'
                   ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kactiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,4,0,0),
                    child: Text('HEIGHT',
                    style: kLabelTextStyle,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(),
                      style: kBoxTextstyle,
                      ),
                      Text('cm',
                      style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: kactiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT',
                      style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kBoxTextstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(icon: FontAwesomeIcons.minus,
                            onPressed: (){
                            setState(() {
                              weight--;
                            });
                            }
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              }
                          ),
                        ],
                      ),
                    ],
                  ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: ReusableCard(
                            colour: kactiveCardColour,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('AGE',
                                  style: kLabelTextStyle,
                                ),
                                Text(
                                  age.toString(),
                                  style: kBoxTextstyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RoundIconButton(icon: FontAwesomeIcons.minus,
                                        onPressed: (){
                                          setState(() {
                                            age--;
                                          });
                                        }
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    RoundIconButton(icon: FontAwesomeIcons.plus,
                                        onPressed: (){
                                          setState(() {
                                            age++;
                                          });
                                        }
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
            ButtomButton(buttonTitle: 'CALCULATE',
            onTap: () {
              Calculat_bmi calc = Calculat_bmi(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
               bmiResult: calc.calculateBMI(),
                resultText: calc.getResult(),
                interPretation: calc.getInterpretation(),
              ),
              ));            },),
        ],
      ),
    );
  }
}

