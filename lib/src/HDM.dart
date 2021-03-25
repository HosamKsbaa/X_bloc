//region imports

import 'package:flutter/material.dart';

part 'Helpers/Builder/Box.dart';
part 'Helpers/Builder/Moduel.dart';
part 'Helpers/Key/Key.dart';
part 'Helpers/Key/Storage.dart';
part 'Helpers/Key/keyControler.dart';
part 'Helpers/Other/WidgetStats.dart';
part 'Helpers/Provider/Providerlib.dart';
part 'Helpers/Provider/moduel.dart';

//endregion

class HDMMain<Handler> {
  //region  The Constructor
  final Handler _handler;
  final Widget Function(HDMBox<Handler>) _statsHere;
  final Function? _wait;
  final List<HDMKey<Handler>> _keysList;
  Widget Function(HDMBox<Handler>)? _initial;
  //region  Constructor fun
  HDMMain(this._handler, this._statsHere, this._keysList, [this._wait, Widget? initial2]) {
    initial2 == null ? _initial = (box) => const _StatsInitial() : _initial = _initial;
    _assignTable();
  }

  //endregion

  //endregion

  //region  Functions TableHandling
  final HDMKey<Handler> _fullAppKey = HDMKey<Handler>();
  final Map<HDMKey<Handler>, _HDMKeyController<Handler>> _tableOfSetStateFuncList = {};

  ///Creat and Object for eachKey That the class have
  void _assignTable() {
    assert(_keysList.isNotEmpty, "No keys , witout key");
    _keysList.forEach((enumElement) {
      _tableOfSetStateFuncList.addAll({enumElement: _HDMKeyController<Handler>()});
    });
    _tableOfSetStateFuncList.addAll({_fullAppKey: _HDMKeyController<Handler>()});
  }

  void _addSetStateFunctionToTable(HDMKey<Handler> hdmKey, Function setStateFunctionPointer) {
    assert(_tableOfSetStateFuncList.containsKey(hdmKey), "this key dons't excist , you probably didin't add it to the list _keyList in  $Handler");
    _tableOfSetStateFuncList[hdmKey]!.addSetStateFunToTable(setStateFunctionPointer);
  }

  void _removeSetStateFunctionToTable(HDMKey<Handler> hdmKey, Function setStateFunctionPointer) {
    _tableOfSetStateFuncList[hdmKey]!.removeSetStateFunToTable(setStateFunctionPointer);
  }

  //endregion
  //region    Handler Api
  bool _didNotInitialized = true;

  Widget play() {
    Future<void> waitForIT() async {
      await _wait!();
      _didNotInitialized = false;

      updateTheWholeApp();
    }

    if (_didNotInitialized) {
      // print("HDM _didNotInitialized");

      if (_wait != null) {
        //print("Wait");
        waitForIT();

        return HDM(
            app: this,
            child: _fullAppKey.keyBuild((box) {
              if (_didNotInitialized) {
                //print("case 1");
                return _initial!(box);
              } else {
                //print("case 3");
                return _statsHere(box);
              }
            }));
      }
      _didNotInitialized = false;
    }
    return HDM(app: this, child: _fullAppKey.keyBuild((box) => _statsHere(box)));
  }

  Widget playWIthProvider() {
    return HDMProvider(play(), [HDMProvide<Handler>(hdmMainObj: this)]);
  }

  void update(HDMKey<Handler> hdmKey) {
    // assert(_tableOfSetStateFuncList.containsKey(hdmKey), "this key dons't excist , you probably didin't add it to the list _keyList in  $Handler");

    _tableOfSetStateFuncList[hdmKey]!.triggerAllSetStateFunctions();
  }

  void updateTheWholeApp() {
    _tableOfSetStateFuncList[_fullAppKey]!.triggerAllSetStateFunctions();
  }
  //endregion
}
