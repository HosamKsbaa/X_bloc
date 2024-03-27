part of '../../HDM.dart';

// ignore: must_be_immutable
class HDMKey<Handler> {
  const HDMKey();
  _StorageHolder<Handler> keyBuild(Widget function(HDMBox<Handler> box)) {
    return _StorageHolder<Handler>(
      this,
      function,
      HDMBox<Handler>(),
    );
  }
}
