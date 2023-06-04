import 'package:flutter/foundation.dart' show ChangeNotifier;

enum PagniationControllerAction { none, refreshDataList }

class PagniationController with ChangeNotifier {
  var action = PagniationControllerAction.none;
  void refreshDataList() {
    action = PagniationControllerAction.refreshDataList;
    notifyListeners();
  }
}
