part of '../HDM.dart';

class StateMain<Handler> {
  final Handler h;
  final int index;
  StateMain({this.h, this.index});
}

/// Templet Block controler
class BlocMain<Handler> extends Bloc<int, StateMain<Handler>> {
  final Handler h;

  BlocMain(
    this.h,
  ) : super(StateMain<Handler>(index: 1, h: h));

  @override
  Stream<StateMain<Handler>> mapEventToState(final int event) async* {
    if (event == 0) {
      yield StateMain<Handler>(h: h, index: 0);
    }
  }
}
//---------------
