part of '../../HDM.dart';

mixin HDMMix<Handler extends HDMMix<Handler>> {
  //region
  HDM<Handler> data;
  @protected
  HDM<Handler> getHDM({
    @required Handler app,
    @required Widget Function(HDMBox<Handler>) startHereFunction,
    @required List<HDMKey<Handler>> keyList,
    Function wait,
    Widget initial2,
  }) {
    //assert(keyList.isNotEmpty,"You shoud add at least a key ");
    return HDM<Handler>(app, startHereFunction, keyList, wait, initial2);
  }

  static int _counter = 0;
  @protected
  static int keyNum() {
    _counter++;
    return _counter;
  }
}
