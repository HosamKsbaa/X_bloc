part of '../../HDM.dart';

//todo check becouseit is a function that the app won't cash it
// ignore: must_be_immutable
class HDMBuilder extends StatefulWidget {
  ///you need this format
  ///
  /// CLASS.KEY.BUILD ((BOX)=>CONTAINER())
  /// for Exable Counter.countKey.build((box)=>Text(box.app.count))

  final _StorageHolder keyBuilder;
  final HDMMix app;
  HDMBuilder({@required this.keyBuilder, this.app}) : super(key: UniqueKey()) {
    //print("HDMBuilder constructor ");
  }
  bool _didNotInitialized = true;

  @override
  _HDMBuilderState createState() => _HDMBuilderState();
}

class _HDMBuilderState extends State<HDMBuilder> {
  //region init and dispose  and firstTimeCHeck
  void initState() {
    //print("a7aaaaaa");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // print("didChangeDependencies");
    widget.keyBuilder.box.context = context;
    _checkIfItIsTheFirstTime();
    widget.keyBuilder.box.app.data.addSetStateFunToTable(widget.keyBuilder.key, setState);

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    widget.keyBuilder.box.app.data.removeSetStateFunToTable(widget.keyBuilder.key, setState);
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
  //todo add cashing for children

  Widget build(BuildContext context) {
    assert(widget.keyBuilder.box.app != null, "app = null");
    return widget.keyBuilder.build(context);
  }
}