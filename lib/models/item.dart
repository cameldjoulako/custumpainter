import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:custumpainter/models/bonheur.dart';

class Item {
  Item({
    @required this.name,
    @required this.iconOn,
    @required this.iconOff,
    @required this.active,
    @required this.color,
    @required this.type,
  });

  String? name;
  IconData? iconOn;
  IconData? iconOff;
  bool? active;
  Color? color;
  ItemType? type;
}

enum ItemType { light, bonheur, tv, sound }

List<dynamic> itemList = [
  Item(
    name: 'Niveau de bonheur',
    iconOn: MdiIcons.lightbulbOnOutline,
    iconOff: MdiIcons.lightbulbOffOutline,
    active: false,
    color: const Color(0xFFFD443C),
    type: ItemType.light,
  ),
  Bonheur(
    name: 'Niveau de bonheur 2',
    iconOn: MdiIcons.airConditioner,
    iconOff: MdiIcons.airConditioner,
    active: false,
    color: const Color(0xFF5D24FB),
    type: ItemType.bonheur,
  ),
];
