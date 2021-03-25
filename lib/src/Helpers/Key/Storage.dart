part of '../../HDM.dart';

class _StorageHolder<Handler> {
  final HDMKey<Handler> key;
  final Widget Function(HDMBox<Handler> box) widgetBuilder;
  final HDMBox<Handler> box;
  const _StorageHolder(this.key, this.widgetBuilder, this.box);
  void getStorageBoxFromBuilder() {}
  void getAppWithProvider() => box._getAppWithProvider(box.context.dependOnInheritedWidgetOfExactType<_HDMProviderObj<Handler>>());

  void getAppWithNoProvider(HDMMain hdmMainObj) => box._getAppWithNoProvider(hdmMainObj);

  Widget build(BuildContext context) {
    box.context = context;
    return widgetBuilder(box);
  }

  void _addSetStateFunctionToTable(Function setStateFunction) => box._addSetStateFunctionToTable(key, setStateFunction);

  void _removeSetStateFunctionToTable(Function setStateFunction) => box._removeSetStateFunctionToTable(key, setStateFunction);
}
