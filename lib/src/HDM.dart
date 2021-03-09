import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

part 'Helpers/WidgetStats.dart';
part 'Helpers/bloc.dart';

class HDM<Handler> {
  // ignore: unused_field
  List<int> _whatToBuild = [];
  bool stateReady = false;
  @required
  final Handler _handler;
  @required
  final Function _statsHere;

  Function _wait;
  Widget _initial;

  HDM(this._handler, this._statsHere, {Function wait, Widget initial}) {
    wait == null ? _wait = () => null : _wait = wait;
    initial == null ? _initial = _StatsInitial() : _initial = initial;

    _start();
  }

  BlocMain<Handler> _bloc;

  bool seeWhatToBuild(int x) {
    //called from the UI to check if to build
    ///if any is false ? r=flase:r=true
    if (_whatToBuild.contains(x)) {
      return true;
    }

    return false;
  }

  Future<void> _start() async {
    //zero

    /// if there is no data to get , it will start right away
    await _wait();
    _bloc?.add(0);

    stateReady = true;
  }

  BlocMain<Handler> _getBloc() {
    ///Creat a new Block for the new build
    _bloc = BlocMain<Handler>(_handler);
    // ignore: unnecessary_statements
    stateReady == true ? update([0]) : null;
    return _bloc;
  }

  final UniqueKey _key = UniqueKey();

  Widget play() {
    Widget statsBlockStateFunctions({final StateMain state}) {
      // print("case start ${state.index}");
      if ((state.index == 0) | (stateReady == true) | (state.index == 10)) {
        // print("case update ");
        return _statsHere(state);
      } else if (state.index == 2) {
        return _StatsNoConnection();
      } else if (state.index == 1) {
        stateReady = true;
        return _initial;
      } else {
        return _StatsErrBlock();
      }
    }

    return BlocProvider(
      key: _key,
      create: (_) => _getBloc(),
      child: Builder(
        builder: (context) => BlocBuilder<BlocMain<Handler>, StateMain<Handler>>(
          buildWhen: (previous, current) {
            return seeWhatToBuild(1);
          },
          builder: (context, state) => statsBlockStateFunctions(state: state),
        ),
      ),
    );
  }

  ///0=> the whole page
  void update(List<int> value) {
    if (_bloc == null) {
      print("A build With No bolc on${this.runtimeType}");
    }
    _whatToBuild = value;

    _bloc.add(0);
  }
}
