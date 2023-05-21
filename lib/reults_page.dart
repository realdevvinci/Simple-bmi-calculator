import 'package:flutter/material.dart';
import "constants.dart";
import "input_page.dart";
import "calcuator_brain.dart";

class ResultsPage extends StatelessWidget {


 const ResultsPage({required this.bmiResual , required this.interpretation , required this.reslutText});

  final String bmiResual;
  final String reslutText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Expanded(
              child: Container(
      padding:EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: Text("Your Resulte", style: kTiteTExtStyle),
          )),
          Expanded(
              flex: 5,
              child: ReusableCard(
                  Color(kCardColor),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        reslutText,
                        style: kResultTextStyle,
                      )
                    , Text(bmiResual , style: kBMITextStyle) , Text(interpretation , style: kBoldyTextStyle, textAlign: TextAlign.center,) ],

                  )))
        ,BottomButton(onTap: (){Navigator.pop(context);}, buttonTitle: "Re-Calcluate")],
      ),
    );
  }
}
