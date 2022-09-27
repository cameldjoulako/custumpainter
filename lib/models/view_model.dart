import 'package:flutter/material.dart';
import 'package:custumpainter/models/item.dart';

class ViewModel extends ChangeNotifier {
  List<dynamic> myList = itemList;

  changeValue(double value) {
    myList[1].value = value;
    notifyListeners();
  }
}
