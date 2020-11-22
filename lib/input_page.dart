import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'constants.dart';

enum GenderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  GenderType selectedGender;
  double height = 180.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusbleCard(
                        //Male Card
                        onPress: () {
                          setState(() {
                            selectedGender = GenderType.male;
                          });
                        },
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconContent(
                                icon: FontAwesomeIcons.mars, label: 'MALE'),
                          ],
                        ),
                        colour: selectedGender == GenderType.male
                            ? kActiveCardColor
                            : kInactiveCardColor),
                  ),
                  Expanded(
                    child: ReusbleCard(
                        //Female Card
                        onPress: () {
                          setState(() {
                            selectedGender = GenderType.female;
                          });
                        },
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                        colour: selectedGender == GenderType.female
                            ? kActiveCardColor
                            : kInactiveCardColor),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ReusbleCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toStringAsPrecision(5),
                              style: kNumberTextStyle,
                            ),
                            Text('  cm'),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: Colors.pinkAccent,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                            activeTrackColor: Colors.pinkAccent,
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                            overlayColor: Color(0x29EB1555),
                            inactiveTrackColor: Colors.grey[200],
                          ),
                          child: Slider(
                            value: height,
                            onChanged: (value) {
                              setState(() {
                                height = value;
                              });
                            },
                            min: 140.0,
                            max: 272,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusbleCard(colour: kActiveCardColor),
                  ),
                  Expanded(
                    child: ReusbleCard(colour: kActiveCardColor),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: kBottomContainerColor,
              ),
              margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            )
          ],
        ));
  }
}
