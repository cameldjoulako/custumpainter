import 'package:custumpainter/models/item.dart';

class Bonheur extends Item {
  int speed;
  double? value;

  Bonheur({
    name,
    active,
    color,
    this.speed = 1,
    this.value = 25,
  }) : super(
          name: name,
          active: active,
          color: color,
        );
}
