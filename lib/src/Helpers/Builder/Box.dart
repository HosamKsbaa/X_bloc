part of '../../HDM.dart';

class HDMBox<Handler> {
  late BuildContext context;
  late Handler app;
  late HDMMain<Handler> hdmMainObj;
  final Map<int, Widget> _widgetList = {};

  _CashKey<Handler> key(int x) {
    return _CashKey<Handler>(x, this);
  }

  void _getAppWithProvider() {
    // assert(temp != null, "the class in not in the widget tree");

    var temp = context.dependOnInheritedWidgetOfExactType<_HDMProviderObj<Handler>>();
    if (temp != null) {
      app = temp.hdmMainObj._handler;
      this.hdmMainObj = temp.hdmMainObj;
    } else {
      throw ArgumentError('the class  $Handler in not in the widget tree');
    }
  }

  void _getAppWithNoProvider(HDMMain hdmMainObj) {
    app = hdmMainObj._handler;
    this.hdmMainObj = hdmMainObj as HDMMain<Handler>;
  }

  Widget? _cash(Widget Function() x, int key) {
    if (_widgetList.containsKey(key)) {
      return _widgetList[key];
    } else {
      Widget temp = x();
      _widgetList.addAll({key: temp});
      return temp;
    }
  }
}

class _CashKey<Handler> {
  final HDMBox<Handler> _box;
  final int key;

  _CashKey(this.key, this._box);

  Widget? cash(Widget Function() x) => _box._cash(x, key);
}
