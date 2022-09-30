import 'package:custumpainter/models/item.dart';

class ViewModel {
  List<dynamic> myList = itemList;

  changeValue(double value) {
    myList[1].value = value;
  }
}
