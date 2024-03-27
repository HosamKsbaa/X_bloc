part of '../../HDM.dart';

class _HDMKeyController<Handler> {
  _HDMKeyController();
  final List<Function> _setStateFunctionsList = [];
  void triggerAllSetStateFunctions() {
    _setStateFunctionsList.forEach((f) => f(() {}));
  }

  void addSetStateFunToTable(Function y) => _setStateFunctionsList.add(y);
  void removeSetStateFunToTable(Function y) => _setStateFunctionsList.remove(y);
}
