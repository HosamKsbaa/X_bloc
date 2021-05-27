part of '../../HDM.dart';

// ignore: must_be_immutable

class _HDMProviderObj<Handler> extends InheritedWidget {
  final Handler state;
  final HDMMain<Handler> hdmMainObj;
  const _HDMProviderObj(this.state, Widget child, this.hdmMainObj) : super(child: child);
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
  //static  HDMProviderObj of(BuildContext context)=>context.inheritFromWidgetOfExactType()   ;
}

// ignore: must_be_immutable
class HDMProvider extends StatelessWidget {
  final Widget passedChild;

  ///[HDMProvide<Handler>(App)]
  final List<HDMProvide> providers;

  const HDMProvider(this.passedChild, this.providers);

  Widget _composer(Widget child) {
    int pointer = 0;
    Widget nestedLoop(Widget child) {
      //todo remove if
      if (pointer <= providers.length - 1) {
        HDMProvide hDMProvide = providers[pointer];
        pointer++;
        _HDMProviderObj hDMProviderObj = hDMProvide.hDMProviderObjCreator(nestedLoop(child));
        return hDMProviderObj;
      } else {
        return child;
      }
    }

    return nestedLoop(child);
  }

  @override
  Widget build(BuildContext context) {
    //assert(providers != null, "You didn't give any providers here");

    return _composer(passedChild);
  }
}
