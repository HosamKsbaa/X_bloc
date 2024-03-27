part of '../../HDM.dart';

class HDMBox<Handler> {
  late BuildContext context;
  Handler? app;
  HDMMain<Handler?>? hdmMainObj;
  final Map<int, Widget> _widgetList = {};

  _CashKey<Handler> key(int x) {
    return _CashKey<Handler>(x, this);
  }

  void _getAppWithProvider(_HDMProviderObj<Handler> temp) {
    // assert(temp != null, "the class in not in the widget tree");
    hdmMainObj = context.dependOnInheritedWidgetOfExactType<_HDMProviderObj<Handler>>()!.hdmMainObj;
    app = hdmMainObj!._handler;
  }

  void _getAppWithNoProvider(HDMMain hdmMainObj) {
    app = hdmMainObj._handler;
    this.hdmMainObj = hdmMainObj as HDMMain<Handler?>?;
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

  void _addSetStateFunctionToTable(HDMKey<Handler> key, Function setStateFunction) {
    // print("");
    hdmMainObj!._addSetStateFunctionToTable(key, setStateFunction);
  }

  void _removeSetStateFunctionToTable(HDMKey<Handler> key, Function setStateFunction) => hdmMainObj!._removeSetStateFunctionToTable(key, setStateFunction);
}

class _CashKey<Handler> {
  final HDMBox<Handler> _box;
  final int key;

  _CashKey(this.key, this._box);

  Widget? cash(Widget Function() x) => _box._cash(x, key);
}
