import 'package:custumpainter/models/item.dart';

class Bonheur extends Item {
  int speed;
  double? value;

  Bonheur({
    name,
    iconOn,
    iconOff,
    active,
    color,
    type,
    this.speed = 1,
    this.value = 25,
  }) : super(
          name: name,
          iconOn: iconOn,
          iconOff: iconOff,
          active: active,
          color: color,
          type: type,
        );
}
