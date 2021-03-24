//region imports

import 'package:extension/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

part 'Helpers/Builder/Box.dart';
part 'Helpers/Builder/Moduel.dart';
part 'Helpers/Key/Key.dart';
part 'Helpers/Key/Storage.dart';
part 'Helpers/Key/keyControler.dart';
part 'Helpers/Other/WidgetStats.dart';
part 'Helpers/Other/mixin.dart';
part 'Helpers/Provider/Providerlib.dart';
part 'Helpers/Provider/moduel.dart';

//endregion

class HDM<Handler extends HDMMix<Handler>> {
  //region  The Constructor
  final Handler _handler;
  final Widget Function(HDMBox<Handler>) _statsHere;
  final Function _wait;
  final List<HDMKey<Handler>> _keysList;
  Widget Function(HDMBox<Handler>) _initial;
  //region  Constructor fun
  HDM(this._handler, this._statsHere, this._keysList, [this._wait, Widget initial2]) {
    initial2 == null ? _initial = (box) => _StatsInitial() : _initial = _initial;
    assignTable();
  }

  //endregion

  //endregion

  //region  Functions TableHandling
  final HDMKey<Handler> _fullAppKey = HDMKey<Handler>(0);
  final Map<HDMKey<Handler>, _HDMKeyController<Handler>> _tableOfSetStateFuncList = {};

  ///Creat and Object for eachKey That the class have
  void assignTable() {
    assert(_keysList.isNotEmpty, "No keys");
    _keysList.forEach((enumElement) {
      _tableOfSetStateFuncList.addAll({enumElement: _HDMKeyController<Handler>()});
    });
    _tableOfSetStateFuncList.addAll({_fullAppKey: _HDMKeyController<Handler>()});
  }

  void addSetStateFunToTable(HDMKey<Handler> x, Function y) => _tableOfSetStateFuncList[x].addSetStateFunToTable(y);
  void removeSetStateFunToTable(HDMKey<Handler> x, Function y) => _tableOfSetStateFuncList[x].removeSetStateFunToTable(y);
  //endregion
  //region    Handler Api
  bool _didNotInitialized = true;

  Widget play() {
    Future<void> waitForIT() async {
      await _wait();
      _didNotInitialized = false;

      update();
    }

    if (_didNotInitialized) {
      // print("HDM _didNotInitialized");

      if (_wait != null) {
        //print("Wait");
        waitForIT();

        return HDMBuilder(
            app: _handler,
            keyBuilder: _fullAppKey.keyBuild((box) {
              if (_didNotInitialized) {
                //print("case 1");
                return _initial(box);
              } else {
                //print("case 3");
                return _statsHere(box);
              }
            }));
      }
      _didNotInitialized = false;
    }
    return HDMBuilder(app: _handler, keyBuilder: _fullAppKey.keyBuild((box) => _statsHere(box)));
  }

  Widget playWIthProvider() {
    return HDMProvider(play(), [HDMProvide<Handler>(_handler)]);
  }

  void update([HDMKey<Handler> E]) {
    if (E != null) {
      _tableOfSetStateFuncList[E].triggerAllSetStateFunctions();
    } else {
      //print("_fullAppKey");
      _tableOfSetStateFuncList[_fullAppKey].triggerAllSetStateFunctions();
    }
  }

  //endregion
}
