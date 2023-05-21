import "package:flutter/material.dart";
import "dart:math";


class CalculatorBrain{


  CalculatorBrain({required this.height ,required this.weight});

  final int height;
  final int weight;

  double bmi =0.0;



  String calculateBMI(){
     bmi = weight / pow((height/100 ), 2);

    return bmi.toStringAsFixed(2);

  }

  String getResutl(){
    if(bmi >= 25.0){
      return "overWeight";
    }else if (bmi >= 18.5){
      return "Normal";
    }
    else{
      return "underWeight";
    }
  }

  String getInterpretiation(){

    if(bmi >= 25.0){
      return "You have a higher than normal body weight. Try to Exercise more.";
    }else if (bmi >= 18.5){
      return "You have a normal body weight. Good job!";
    }
    else{
      return "You have a lower than normal body weight. You can eat a little bit more.";
    }
  }
}