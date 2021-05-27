part of '../../HDM.dart';

// ignore: must_be_immutable
class HDM extends StatefulWidget {
  ///you need this format
  ///
  /// CLASS.KEY.BUILD ((BOX)=>CONTAINER())
  /// for Exable Counter.countKey.build((box)=>Text(box.app.count))
  // final UniqueKey x=UniqueKey();

  final _StorageHolder child;
  final HDMMain? app;
  final bool isItPlayHDM;
  const HDM({required this.child, this.app, this.isItPlayHDM = false});
  @override
  _HDMState createState() => _HDMState(this.app, this.child);
}

class _HDMState extends State<HDM> {
  final _StorageHolder child;
  final HDMMain? app;
  _HDMState(this.app, this.child);
  //region init and dispose  and firstTimeCHeck

  @override
  void didChangeDependencies() {
    // print("didChangeDependencies");

    child.box.context = context;

    print("init");
    if (widget.isItPlayHDM) app!._inite();

    _checkIfItIsTheFirstTime();
    child._addSetStateFunctionToTable(setState);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    widget.child._removeSetStateFunctionToTable(setState);
    print("dis");
    if (widget.isItPlayHDM) app!._dispose();

    super.dispose();
  }

  void _checkIfItIsTheFirstTime() {
    // print("_checkIfItIsTheFirstTime");

    //print("_didNotInitialized");

    if (widget.app == null) {
      //do it useing provider
      child.getAppWithProvider();
    } else {
      //dp it normaly

      child.getAppWithNoProvider(widget.app!);
    }
  }

  //endregion
  Widget build(BuildContext context) {
    assert(child.box.app != null, "app == null");
    return child.build(context);
  }
}
