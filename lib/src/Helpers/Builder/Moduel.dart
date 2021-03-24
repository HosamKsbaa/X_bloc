part of '../../HDM.dart';

// ignore: must_be_immutable
class HDM extends StatefulWidget {
  ///you need this format
  ///
  /// CLASS.KEY.BUILD ((BOX)=>CONTAINER())
  /// for Exable Counter.countKey.build((box)=>Text(box.app.count))

  final _StorageHolder keyBuilder;
  final HDMMix app;
  HDM({@required this.keyBuilder, this.app}) : super(key: UniqueKey()) {
    //print("HDMBuilder constructor ");
  }
  bool _didNotInitialized = true;

  @override
  _HDMState createState() => _HDMState();
}

class _HDMState extends State<HDM> {
  //region init and dispose  and firstTimeCHeck

  @override
  void didChangeDependencies() {
    // print("didChangeDependencies");
    widget.keyBuilder.box.context = context;
    _checkIfItIsTheFirstTime();
    widget.keyBuilder.box.app.data._addSetStateFunctionToTable(widget.keyBuilder.key, setState);

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    widget.keyBuilder.box.app.data._removeSetStateFunctionToTable(widget.keyBuilder.key, setState);
    super.dispose();
  }

  void _checkIfItIsTheFirstTime() {
    //print("_checkIfItIsTheFirstTime");
    if (widget._didNotInitialized) {
      //print("_didNotInitialized");

      if (widget.app == null) {
        //do it useing provider
        widget.keyBuilder.getAppWithProvider();
      } else {
        //dp it normaly

        widget.keyBuilder.getAppWithNoProvider(widget.app);
      }
      widget._didNotInitialized = false;
    }
  }

  //endregion
  Widget build(BuildContext context) {
    assert(widget.keyBuilder.box.app != null, "app == null");
    return widget.keyBuilder.build(context);
  }
}
