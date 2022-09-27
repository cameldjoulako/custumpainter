import 'package:flutter/material.dart';
import 'package:custumpainter/models/bonheur.dart';
import 'package:custumpainter/pages/detail.dart';

class BonheurWidget extends StatefulWidget {
  const BonheurWidget({
    Key? key,
    @required this.bonheur,
    @required this.onChanged,
  }) : super(key: key);
  final Bonheur? bonheur;
  final Function(double)? onChanged;

  @override
  State<BonheurWidget> createState() => _BonheurWidgetState();
}

class _BonheurWidgetState extends State<BonheurWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: getBackColor(widget.bonheur!.value!),
      ),
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Niveau',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '16',
                style: TextStyle(color: Colors.white),
              ),
              Expanded(
                child: Slider(
                  min: 16,
                  max: 30,
                  value: widget.bonheur!.value!,
                  activeColor: Colors.white,
                  inactiveColor: Colors.white.withOpacity(0.2),
                  onChanged: (value) {
                    setState(() {
                      widget.onChanged!(value);
                    });
                  },
                ),
              ),
              const Text(
                '30',
                style: TextStyle(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }

  Color? getBackColor(double value) {
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

    return newColor!.withOpacity(0.7);
  }
}
