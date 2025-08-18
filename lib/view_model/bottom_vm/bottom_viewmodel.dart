import 'package:priya_freshmeats_delivery/utils/exports.dart';

class BottomViewmodel with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
