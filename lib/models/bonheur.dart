import 'package:custumpainter/models/item.dart';

class Bonheur extends Item {
  int speed;
  double? value;
  String emojis;

  Bonheur({
    name,
    iconOn,
    iconOff,
    active,
    color,
    type,
    this.speed = 1,
    this.value = 25,
    this.emojis = '\u2764',
  }) : super(
          name: name,
          iconOn: iconOn,
          iconOff: iconOff,
          active: active,
          color: color,
          type: type,
        );
}
