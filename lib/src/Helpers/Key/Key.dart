part of '../../HDM.dart';

// ignore: must_be_immutable
class HDMKey<Handler> extends Enum<int> {
  const HDMKey(int i) : super(i);
  _StorageHolder<Handler> keyBuild(Widget function(HDMBox<Handler> box)) {
    return _StorageHolder<Handler>(this, function);
  }
}
