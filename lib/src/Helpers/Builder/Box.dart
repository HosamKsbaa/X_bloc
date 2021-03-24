part of '../../HDM.dart';

class HDMBox<Handler> {
  BuildContext context;
  Handler app;
  final Map<int, Widget> _widgetList = {};

  _CashKey<Handler> key(int x) {
    return _CashKey<Handler>(x, this);
  }
}

class _CashKey<Handler> {
  final HDMBox<Handler> _up;
  final int key;

  _CashKey(this.key, this._up);

  Widget cash(Widget function()) {
    if (_up._widgetList.containsKey(key)) {
      return _up._widgetList[key];
    } else {
      Widget temp = function();
      _up._widgetList.addAll({key: temp});
      return temp;
    }
  }
}
