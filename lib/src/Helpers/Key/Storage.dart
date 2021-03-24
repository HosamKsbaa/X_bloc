part of '../../HDM.dart';

class _StorageHolder<Handler> {
  final HDMKey<Handler> key;
  final Widget Function(HDMBox<Handler> box) widgetBuilder;
  final HDMBox box = HDMBox<Handler>();
  _StorageHolder(this.key, this.widgetBuilder);
  void getAppWithProvider() {
    _HDMProviderObj<Handler> temp = box.context.dependOnInheritedWidgetOfExactType<_HDMProviderObj<Handler>>();
    assert(temp != null, "the class in not in the widget tree");
    box.app = box.context.dependOnInheritedWidgetOfExactType<_HDMProviderObj<Handler>>().data;
  }

  void getAppWithNoProvider(Handler app) {
    box.app = app;
  }

  Widget build(BuildContext context) {
    box.context = context;
    return widgetBuilder(box);
  }
}
