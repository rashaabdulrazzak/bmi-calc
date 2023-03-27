import 'package:new_bmi/components/bottom_button.dart';
import 'package:new_bmi/components/reusable_code.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:new_bmi/components/reusable_code.dart';
import 'package:new_bmi/components/bottom_button.dart';


class ResultPage extends StatelessWidget {
  ResultPage({required this.interpretation,
  required this.bmiResult,
  required this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('BMI calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text('Your Result', style :kTitleTextStyle,),
          ),),
          Expanded(
           flex: 5,
            child: ReusableCode(
              colour: kActiveCardColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText.toUpperCase(),style: kResultTextStyle ,),
                  Text( bmiResult,style: kBMITextStyle ,),
                  Text(interpretation,textAlign: TextAlign.center,style: kBodyTextStyle ,),
                ],
              ), onPress: () {  },
            ),
          ),
          BottomButton(label: 'RE-CALCULATE', onTapAction: (){
            Navigator.pop(context);
          },)
        ],
      ),
    );
  }
}

    