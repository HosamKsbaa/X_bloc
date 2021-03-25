part of '../../HDM.dart';

class HDMProvide<Handler> {
  final Handler state;
  const HDMProvide({this.state, this.hdmMainObj});
  final HDMMain<Handler> hdmMainObj;
  _HDMProviderObj hDMProviderObjCreator(Widget child) {
    // print("printed>>>");
    // print(data);

    return _HDMProviderObj<Handler>(
      hdmMainObj: hdmMainObj,
      child: child,
    );
  }
}
