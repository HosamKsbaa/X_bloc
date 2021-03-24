part of '../../HDM.dart';

mixin HDMMix<Handler extends HDMMix<Handler>> {
  //region
  HDMMain<Handler> data;
  @protected
  HDMMain<Handler> getHDMMain({
    @required Handler app,
    @required Widget Function(HDMBox<Handler>) startHereFunction,
    @required List<HDMKey<Handler>> keyList,
    Function wait,
    Widget initial2,
  }) {
    //assert(keyList.isNotEmpty,"You shoud add at least a key ");
    return HDMMain<Handler>(app, startHereFunction, keyList, wait, initial2);
  }
}
