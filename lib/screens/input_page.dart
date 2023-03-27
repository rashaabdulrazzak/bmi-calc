import 'package:new_bmi/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_bmi/components/reusable_code.dart';
import 'package:new_bmi/components/child_card_reused.dart';
import 'package:new_bmi/constants.dart';
import 'package:new_bmi/components/bottom_button.dart';
import 'package:new_bmi/components/round_icon_button.dart';
import 'package:new_bmi/calculator_brain.dart';

enum Gender {
  male ,
  female
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
   Gender selectedGender = Gender.female;
  int height = 140;
  int weight = 60;
  int age = 20;
  // Color maleCardColor = inActiveColorCard;
  // Color femaleCardColor = inActiveColorCard;
  // // male 1 , female 2
  // void updateColour (Gender selectedGender){
  //   // male card pressed
  //   if(selectedGender == Gender.male ){
  //     if(maleCardColor == inActiveColorCard ){
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inActiveColorCard;
  //     }else{
  //       maleCardColor = inActiveColorCard;
  //     }
  //   }
  //   if(selectedGender == Gender.female){
  //     if(femaleCardColor == inActiveColorCard ){
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inActiveColorCard;
  //     }else{
  //       femaleCardColor = inActiveColorCard;
  //     }
  //   }
  //
  // }
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
                  child: ReusableCode(
                    colour: selectedGender == Gender.male ? kActiveCardColor : kInActiveColorCard,
                  childCard: ChildCardReused(icon: FontAwesomeIcons.mars, label: 'MALE',),
                  onPress: (){
                    setState(() {
                      // updateColour(Gender.male);
                      selectedGender = Gender.male;
                    });
                  }),
                ),
                Expanded(
                  child: ReusableCode(
                      colour:selectedGender == Gender.female ? kActiveCardColor: kInActiveColorCard,
                      childCard: ChildCardReused(icon: FontAwesomeIcons.venus,label: 'FEMALE',),
                      onPress: (){
                        setState(() {
                          // updateColour(Gender.male);
                          selectedGender = Gender.female;
                        });
                      },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
    child: ReusableCode(colour:kActiveCardColor, childCard: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Height', style: kLabelTextStyle,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(height.toString(),
            style: kNumberColorStyle,),
            Text('sm',
            style: kLabelTextStyle,),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.white,
            inactiveTrackColor: Color(0xFF8D8E98),
            thumbColor: Color(0xFFEB1555),
            overlayColor: Color(0x29EB1555),
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
            overlayShape: RoundSliderOverlayShape(
              overlayRadius: 20.0
            ),
          ),
          child: Slider(value: height.toDouble(),
            min: 120.0,
            max: 220.0,
             onChanged: (double newValue){
              print(newValue);
              setState(() {
                height = newValue.round();
              });
            },),
        ),
      ],
    ), onPress: () {  },),
    ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCode(
                    colour:kActiveCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: kLabelTextStyle,
                        ),
                        Text(weight.toString(),
                          style: kNumberColorStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon:FontAwesomeIcons.plus,
                              onpress: (){
                                setState(() {
                                  weight ++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpress: (){
                                setState(() {
                                  weight --;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ), onPress: () {  },
                  ),
                ),
                Expanded(
                  child:ReusableCode(colour:kActiveCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        Text(age.toString(),
                          style: kNumberColorStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon:FontAwesomeIcons.plus,
                              onpress: (){
                                setState(() {
                                  age ++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpress: (){
                                setState(() {
                                  age --;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ), onPress: () {  },
                  ),
                ),
              ],
            ),
          ),
          BottomButton(label: 'CALCULATE',onTapAction: (){
            CalculatorBrain calc =
            CalculatorBrain(height: height, weight: weight);
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=> ResultPage(  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),)));
          },)
        ],
      ),

    );
  }
}






