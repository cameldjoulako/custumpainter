import 'package:flutter/material.dart';
import 'package:custumpainter/widgets/semi_circle_widget.dart';
import 'package:custumpainter/widgets/bonheur_widget.dart';
import 'package:custumpainter/models/view_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final myList = ViewModel().myList;
    final vmodel = ViewModel();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: getBackColor(myList[1].value)!,
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RawMaterialButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Icon(
                            Icons.person,
                            color: Colors.black,
                          )
                        ],
                      ),
                      onPressed: () {},
                    ),
                    const Text(
                      "Niveau de bonheur",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Opacity(
                      opacity: 0,
                      child: RawMaterialButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            )
                          ],
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 260,
                                      height: 260,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SemiCircleWidget(
                                      diameter: 200,
                                      sweepAngle:
                                          ((myList[1].value - 15) * 12.0)
                                              .clamp(0.0, 180.0),
                                      color: getSliderColor(myList[1].value),
                                    ),
                                    Container(
                                      width: 200,
                                      height: 200,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ]),
                                    ),
                                    Text(
                                      '${convertToInt(myList[1].value)}',
                                      style: TextStyle(
                                          fontSize: 60,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                BonheurWidget(
                                  bonheur: myList[1],
                                  onChanged: (value) {
                                    setState(() {
                                      vmodel.changeValue(value);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  int convertToInt(double value) {
    return value.toInt();
  }

  List<Color>? getBackColor(double value) {
    int newValue = value.toInt();
    if (newValue >= 16 && newValue < 19) {
      return gradientRed;
    } else if (newValue >= 19 && newValue < 22) {
      return gradientTeal;
    } else if (newValue >= 22 && newValue < 25) {
      return gradientBlue;
    } else if (newValue >= 25 && newValue < 28) {
      return gradientViolet;
    } else if (newValue >= 28) {
      return gradientGreen;
    }
    return null;
  }

  Color? getSliderColor(double value) {
    int newValue = value.toInt();
    Color? newColor;
    if (newValue >= 16 && newValue < 19) {
      newColor = colorRed;
    } else if (newValue >= 19 && newValue < 22) {
      newColor = colorTeal;
    } else if (newValue >= 22 && newValue < 25) {
      newColor = colorBlue;
    } else if (newValue >= 25 && newValue < 28) {
      newColor = colorViolet;
    } else if (newValue >= 28) {
      newColor = colorGreen;
    }

    return newColor!;
  }
}

final gradientRed = [
  Color(0xFFff5252).withOpacity(0.2),
  Color(0xFFff1744).withOpacity(0.4),
  Color(0xFFff1744).withOpacity(0.4),
  Color(0xFFd50000).withOpacity(0.6),
];

final gradientViolet = [
  Color(0xFFE9E1FF),
  Color(0xFFD6C9FE),
  Color(0xFFD6C9FE),
  Color(0xFF784CFC).withOpacity(0.6),
];

final gradientBlue = [
  Color(0xFF448aff).withOpacity(0.2),
  Color(0xFF2979ff).withOpacity(0.4),
  Color(0xFF2979ff).withOpacity(0.4),
  Color(0xFF2962ff).withOpacity(0.6),
];

final gradientTeal = [
  Color(0xFF64ffda).withOpacity(0.2),
  Color(0xFF1de9b6).withOpacity(0.4),
  Color(0xFF1de9b6).withOpacity(0.4),
  Color(0xFF00bfa5).withOpacity(0.6),
];

final gradientGreen = [
  Color(0xFF69f0ae).withOpacity(0.2),
  Color(0xFF00e676).withOpacity(0.4),
  Color(0xFF00e676).withOpacity(0.4),
  Color(0xFF00c853).withOpacity(0.6),
];

const colorGreen = Color(0xFF00c853);
const colorTeal = Color(0xFF00bfa5);
const colorBlue = Color(0xFF2962ff);
const colorViolet = Color(0xFF784CFC);
const colorRed = Color(0xFFd50000);
