part of '../../HDM.dart';

class HDMProvide<Handler> {
  final Handler data;
  const HDMProvide(this.data);
  _HDMProviderObj hDMProviderObjCreator(Widget child) {
    // print("printed>>>");
    // print(data);
    return _HDMProviderObj<Handler>(data: data, child: child);
  }
}
