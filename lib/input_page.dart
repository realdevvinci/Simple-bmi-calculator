import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "constants.dart";
import "reults_page.dart";
import "calcuator_brain.dart";
// const bottomContainerHeight = 80.0;
// const cardColor = 0xFF1D1E33;
// const inactiveCardColor = 0xFF111328;
enum Genders { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var maleCardColor = 0xFF111328;
  var femaleCardColor = 0xFF111328;

  int height = 180;
  int age = 25;
  int weight = 60;

  void updateColor(var gender) {
    if (gender == Genders.male) {
      setState(() {
        maleCardColor = kCardColor;
        femaleCardColor = kInactiveCardColor;
      });
    } else {
      setState(() {
        maleCardColor = kInactiveCardColor;
        femaleCardColor = kCardColor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
            child: Row(
          children: <Widget>[
            Expanded(
              child: ReusableCard(
                  Color(
                    maleCardColor,
                  ),
                  GestureDetector(
                      onTap: () {
                        updateColor(Genders.male);
                      },
                      child: reusableMale(FontAwesomeIcons.mars))),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  updateColor(Genders.female);
                },
                child: ReusableCard(Color(femaleCardColor),
                    reusableMale(FontAwesomeIcons.venus)),
              ),
            ),
          ],
        )),
        Expanded(
          child: ReusableCard(
              Color(kCardColor),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT", style: kLableTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "${height}",
                        style: kNumberTextStyle,
                      ),
                      Text("cm", style: kLableTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        thumbColor: Color(0xffeb1555),
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x29eb1555),
                        inactiveTrackColor: Color(0xff8d8e98),
                        trackHeight: 2.0),
                    child: Slider(
                      value: height.toDouble(),
                      min: 110.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.ceil();
                        });
                        print(newValue);
                      },
                    ),
                  )
                ],
              )),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                    Color(kCardColor),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT", style: kLableTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              "${weight}",
                              style: kNumberTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,

                          children: [
                            ElevatedButton(onPressed: (){
                              setState(() {
                                weight++;
                              });
                            }, child: Icon(FontAwesomeIcons.plus)),
                            ElevatedButton(onPressed: (){
                              setState(() {
                                weight--;
                              });
                            }, child: Icon(FontAwesomeIcons.minus))],
                        )],
                    )),
              ),
              Expanded(
                child: ReusableCard(
                    Color(kCardColor), Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("AGE", style: kLableTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "${age}",
                          style: kNumberTextStyle,
                        ),


                      ]
                      ,
                    ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,

                          children: [
                            ElevatedButton(onPressed: (){
                              setState(() {
                                age++;
                              });
                            }, child: Icon(FontAwesomeIcons.plus)),
                            ElevatedButton(onPressed: (){
                              setState(() {
                                age--;
                              });
                            }, child: Icon(FontAwesomeIcons.minus))],
                        )],
                )),
              ),
            ],
          ),
        ),
        BottomButton(
            onTap: () {
              CalculatorBrain calc = new CalculatorBrain(height: this.height, weight: this.weight);
              print(calc.getInterpretiation() );
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage(bmiResual: calc.calculateBMI(), interpretation: calc.getInterpretiation() ,reslutText: calc.getResutl() )));
            },
            buttonTitle: "CALCULATE")
      ]),
    );
  }
}

// () {
// Navigator.push(context, MaterialPageRoute(builder: (context) {
// return ResultsPage();
// }));
// }

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;

  BottomButton({required Function this.onTap, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        child: Center(
          child: Text(buttonTitle, style: kLargeButtonText),
        ),
        margin: EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.only(bottom: 20.0),
        color: Color(0xFFEB1555),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}

class reusableMale extends StatelessWidget {
  final iconName;

  reusableMale(this.iconName);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconName, size: 80.0, color: Colors.white),
        SizedBox(
          height: 15.0,
        ),
        Container(
            child: Text("Male",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color(0xFF8D8E98),
                )))
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;

  ReusableCard(this.colour, this.cardChild);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.cardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
