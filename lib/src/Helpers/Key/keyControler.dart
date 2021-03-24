part of '../../HDM.dart';

class _HDMKeyController<Handler> {
  final List<Function> _setStateFunctionsList = [];
  void triggerAllSetStateFunctions() {
    _setStateFunctionsList.forEach((f) async => f(() {}));
  }

  void addSetStateFunToTable(Function y) => _setStateFunctionsList.add(y);
  void removeSetStateFunToTable(Function y) => _setStateFunctionsList.remove(y);
}
