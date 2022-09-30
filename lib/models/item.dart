import 'package:flutter/material.dart';
import 'package:custumpainter/models/bonheur.dart';

class Item {
  Item({
    @required this.name,
    @required this.active,
    @required this.color,
  });

  String? name;
  bool? active;
  Color? color;
}

List<dynamic> itemList = [
  Item(
    name: 'Niveau de bonheur',
    active: false,
    color: const Color(0xFFFD443C),
  ),
  Bonheur(
    name: 'Niveau de bonheur',
    active: false,
    color: const Color(0xFF5D24FB),
  ),
];
