import 'package:flutter/material.dart';
import 'package:x_bloc2/x_bloc2.dart';

class CounterController {
  //region  Keys
  static const List<HDMKey<CounterController>> _keyList = [key1];
  late HDMMain<CounterController> data;

  void _start() => data = HDMMain<CounterController>(this, _widgetCounterController, _keyList);
  static const HDMKey<CounterController> key1 = HDMKey<CounterController>();

//endregion
  CounterController() {
    _start();
  }
  bool withprovide = false;
  int age = 0;
  void plus() {
    age++;
    data.updateTheWholeApp();
  }
}

Widget _widgetCounterController(HDMBox<CounterController> box) {
  return Scaffold(
    body: Center(
      child: Column(
        children: [
          Text(box.app!.age.toString()),
          box.app!.withprovide == true
              ? HDMProviderObj(
                  passedChild: HDMProviderBuilder<CounterApp>(
                    code: CounterAppEnum.a2ndTestBox,
                    child: (context, CounterAppobj) => Text((CounterAppobj.counter + 100).toString()),
                  ),
                )
              : Text("counterApp.counter.toString()"),
        ],
      ),
      //     hdmBuilder<CounterApp>(
      //   code: "TextBox1",
      //   build: (context, counterApp) => Text(
      //     counterApp.counter.toString(),
      //     key: Key("string box 1"),
      //   ),
      // )
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: counterApp.plus,
      key: Key("Tap1"),
    ),
  );
}
